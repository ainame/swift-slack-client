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
        guard let item = event.item,
              item._type == "message",
              let channelId = item.channel,
              let messageTs = item.ts,
              let reaction = event.reaction,
              let language = Languages.languageFromReaction(reaction) else {
            return
        }
        
        logger.info("Translating to language", metadata: ["language": "\(language)", "reaction": "\(reaction)"])
        
        let replies = try await client.conversationsReplies(
            body: .json(.init(
                channel: channelId,
                ts: messageTs,
                inclusive: true
            ))
        )
        
        let response = try replies.ok.body.json

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
