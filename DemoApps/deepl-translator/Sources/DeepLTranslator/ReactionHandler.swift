import Foundation
import SlackClient
import SlackModels
import Logging

public struct ReactionHandler: Sendable {
    private let deepL: DeepLClient
    private let logger: Logger = {
        var logger = Logger(label: "ReactionHandler")
        logger.logLevel = .info
        return logger
    }()
    
    public init(deepL: DeepLClient) {
        self.deepL = deepL
    }
    
    public func handleReactionAdded(
        client: any APIProtocol,
        event: ReactionAddedEvent
    ) async throws {
        
        // Only handle message reactions  
        guard let item = event.item else {
            return
        }
        
        guard item._type == "message" else {
            return
        }
        
        guard let channelId = item.channel else {
            return
        }
        
        
        // Use item.ts as the message timestamp (like TypeScript implementation)
        guard let messageTs = item.ts else {
            // Fallback to eventTs if item.ts is not available
            guard let eventTs = event.eventTs else {
                return
            }
            // Note: This might not work as eventTs != message timestamp
            return
        }
        
        
        // Get language from reaction
        guard let reaction = event.reaction else {
            return
        }
        
        
        guard let language = Languages.languageFromReaction(reaction) else {
            return
        }
        
        logger.info("Translating to language", metadata: ["language": "\(language)", "reaction": "\(reaction)"])
        
        // Use conversations.replies to get the message thread (like TypeScript implementation)
        // Use conversations.replies to get the message thread (like TypeScript implementation)
        
        let replies = try await client.conversationsReplies(
            body: .json(.init(
                channel: channelId,
                ts: messageTs,
                inclusive: true
            ))
        )
        
        let response = try replies.ok.body.json
        
        
        // If we get invalid_arguments, try using conversations.history as fallback
        if response.ok == false && response.error == "invalid_arguments" {
            
            let history = try await client.conversationsHistory(
                body: .json(.init(
                    channel: channelId,
                    inclusive: true,
                    latest: messageTs,
                    limit: 1
                ))
            )
            
            let historyResponse = try history.ok.body.json
            
            if let messages = historyResponse.messages,
               let originalMessage = messages.first,
               let messageText = originalMessage.text {
                
                // Continue with translation logic using history response
                // Process the translation...
                guard let translatedText = try await deepL.translate(
                    text: messageText,
                    targetLanguage: language
                ) else {
                    logger.error("Translation failed - DeepL returned nil")
                    return
                }
                
                
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
                return
            }
        }
        
        
        guard let messages = response.messages,
              let originalMessage = messages.first,
              let messageText = originalMessage.text else {
            return
        }
        
        
        
        // Translate the text
        guard let translatedText = try await deepL.translate(
            text: messageText,
            targetLanguage: language
        ) else {
            logger.error("Translation failed - DeepL returned nil")
            return
        }
        
        
        // Check if translation already posted in thread (use the same messages we just fetched)
        if isAlreadyPosted(messages: messages, translatedText: translatedText) {
            return
        }
        
        let threadTs = originalMessage.threadTs ?? originalMessage.ts
        
        
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