import Foundation
import SlackClient
import SlackModels
import Logging

public struct ReactionHandler: Sendable {
    private let deepL: DeepLClient
    private let logger: Logger = {
        var logger = Logger(label: "ReactionHandler")
        logger.logLevel = .debug
        return logger
    }()
    
    public init(deepL: DeepLClient) {
        self.deepL = deepL
    }
    
    public func handleReactionAdded(
        client: any APIProtocol,
        event: ReactionAddedEvent
    ) async throws {
        logger.debug("ReactionHandler.handleReactionAdded called", metadata: [
            "reaction": "\(event.reaction ?? "nil")",
            "item_type": "\(event.item?._type ?? "nil")"
        ])
        
        // Only handle message reactions  
        guard let item = event.item else {
            logger.debug("No item in reaction event")
            return
        }
        
        guard item._type == "message" else {
            logger.debug("Item is not a message", metadata: ["type": "\(item._type)"])
            return
        }
        
        guard let channelId = item.channel else {
            logger.debug("No channel in item")
            return
        }
        
        logger.debug("Item details", metadata: [
            "channel": "\(item.channel ?? "nil")",
            "ts": "\(item.ts ?? "nil")",
            "message": "\(item.message != nil ? "present" : "nil")",
            "comment": "\(item.comment != nil ? "present" : "nil")",
            "file": "\(item.file != nil ? "present" : "nil")",
            "dateCreate": "\(item.dateCreate ?? -1)"
        ])
        
        // Use item.ts as the message timestamp (like TypeScript implementation)
        guard let messageTs = item.ts else {
            logger.debug("No ts field in item - trying eventTs as fallback")
            // Fallback to eventTs if item.ts is not available
            guard let eventTs = event.eventTs else {
                logger.debug("No eventTs in reaction event either")
                return
            }
            logger.debug("Using eventTs as fallback", metadata: [
                "channel": "\(channelId)",
                "eventTs": "\(eventTs)"
            ])
            // Note: This might not work as eventTs != message timestamp
            return
        }
        
        logger.debug("Using item.ts as message timestamp", metadata: [
            "channel": "\(channelId)",
            "messageTs": "\(messageTs)"
        ])
        
        // Get language from reaction
        guard let reaction = event.reaction else {
            logger.debug("No reaction found in event")
            return
        }
        
        logger.debug("Processing reaction", metadata: ["reaction": "\(reaction)"])
        
        guard let language = Languages.languageFromReaction(reaction) else {
            logger.debug("Reaction not recognized as language flag", metadata: ["reaction": "\(reaction)"])
            return
        }
        
        logger.info("Translating to language", metadata: ["language": "\(language)", "reaction": "\(reaction)"])
        
        // Use conversations.replies to get the message thread (like TypeScript implementation)
        // Validate timestamp format
        let timestampDate = Date(timeIntervalSince1970: Double(messageTs) ?? 0)
        logger.debug("Calling conversations.replies", metadata: [
            "channel": "\(channelId)",
            "ts": "\(messageTs)",
            "timestampAsDate": "\(timestampDate)"
        ])
        
        let replies = try await client.conversationsReplies(
            body: .json(.init(
                channel: channelId,
                ts: messageTs,
                inclusive: true
            ))
        )
        
        logger.debug("conversations.replies response received")
        let response = try replies.ok.body.json
        
        logger.debug("Response details", metadata: [
            "ok": "\(response.ok)",
            "messagesCount": "\(response.messages?.count ?? 0)",
            "error": "\(response.error ?? "none")"
        ])
        
        // If we get invalid_arguments, try using conversations.history as fallback
        if response.ok == false && response.error == "invalid_arguments" {
            logger.debug("conversations.replies failed with invalid_arguments, trying conversations.history")
            
            let history = try await client.conversationsHistory(
                body: .json(.init(
                    channel: channelId,
                    inclusive: true,
                    latest: messageTs,
                    limit: 1
                ))
            )
            
            let historyResponse = try history.ok.body.json
            logger.debug("conversations.history response", metadata: [
                "ok": "\(historyResponse.ok)",
                "messagesCount": "\(historyResponse.messages?.count ?? 0)",
                "error": "\(historyResponse.error ?? "none")"
            ])
            
            if let messages = historyResponse.messages,
               let originalMessage = messages.first,
               let messageText = originalMessage.text {
                logger.debug("Found message via conversations.history", metadata: [
                    "messageText": "\(messageText)",
                    "messageTs": "\(originalMessage.ts ?? "none")"
                ])
                
                // Continue with translation logic using history response
                // Process the translation...
                guard let translatedText = try await deepL.translate(
                    text: messageText,
                    targetLanguage: language
                ) else {
                    logger.error("Translation failed - DeepL returned nil")
                    return
                }
                
                logger.debug("Translation successful", metadata: [
                    "translatedText": "\(translatedText)"
                ])
                
                // Post translation in thread
                let threadTs = originalMessage.threadTs ?? originalMessage.ts
                _ = try await client.chatPostMessage(
                    body: .json(.init(
                        channel: channelId,
                        text: translatedText,
                        threadTs: threadTs ?? messageTs
                    ))
                )
                
                logger.info("Translation posted successfully")
                return
            } else {
                logger.debug("conversations.history also failed to find message")
                return
            }
        }
        
        if let messages = response.messages {
            for (index, message) in messages.enumerated() {
                logger.debug("Message \(index)", metadata: [
                    "ts": "\(message.ts ?? "none")",
                    "textLength": "\(message.text?.count ?? 0)",
                    "user": "\(message.user ?? "none")"
                ])
            }
        }
        
        guard let messages = response.messages,
              let originalMessage = messages.first,
              let messageText = originalMessage.text else {
            logger.debug("Could not find message text", metadata: [
                "messagesCount": "\(response.messages?.count ?? 0)",
                "firstMessage": "\(response.messages?.first?.ts ?? "none")"
            ])
            return
        }
        
        logger.debug("Found message to translate", metadata: [
            "messageText": "\(messageText)",
            "messageTs": "\(originalMessage.ts ?? "none")"
        ])
        
        logger.debug("Translating message", metadata: [
            "originalText": "\(messageText)",
            "targetLanguage": "\(language)"
        ])
        
        // Translate the text
        guard let translatedText = try await deepL.translate(
            text: messageText,
            targetLanguage: language
        ) else {
            logger.error("Translation failed - DeepL returned nil")
            return
        }
        
        logger.debug("Translation successful", metadata: [
            "translatedText": "\(translatedText)"
        ])
        
        // Check if translation already posted in thread (use the same messages we just fetched)
        if isAlreadyPosted(messages: messages, translatedText: translatedText) {
            logger.debug("Translation already posted in thread")
            return
        }
        
        let threadTs = originalMessage.threadTs ?? originalMessage.ts
        
        logger.debug("Posting translation to thread", metadata: [
            "channel": "\(channelId)",
            "threadTs": "\(threadTs ?? messageTs)"
        ])
        
        // Post translation in thread
        _ = try await client.chatPostMessage(
            body: .json(.init(
                channel: channelId,
                text: translatedText,
                threadTs: threadTs ?? messageTs
            ))
        )
        
        logger.info("Translation posted successfully")
    }
    
    private func isAlreadyPosted(messages: [Message], translatedText: String) -> Bool {
        return messages.contains { message in
            message.text == translatedText
        }
    }
}