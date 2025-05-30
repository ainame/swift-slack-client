import Foundation
import OpenAPIRuntime
import SlackBlockKit
import SlackModels
import Logging

public struct Say: Sendable {
    private let client: any APIProtocol
    private let logger: Logger

    init(client: any APIProtocol, logger: Logger) {
        self.client = client
        self.logger = logger
    }

    @discardableResult
    public func callAsFunction(
        text: String = "",
        blocks: [BlockType]? = nil,
        channel: String,
        attachments: [Attachment]? = nil,
        unfurlLinks: Bool? = nil,
        unfurlMedia: Bool? = nil,
        threadTs: String? = nil,
        metadata: OpenAPIObjectContainer? = nil
    ) async throws -> Bool {
        try await callAsFunction(
            Payload(
                channel: channel,
                text: text,
                blocks: blocks,
                attachments: attachments,
                unfurlLinks: unfurlLinks,
                unfurlMedia: unfurlMedia,
                threadTs: threadTs,
                metadata: metadata
            )
        )
    }

    @discardableResult
    public func callAsFunction(
        _ payload: Payload
    ) async throws -> Bool {
#if WebAPI_Chat
        let result = try await client.chatPostMessage(
            body: .json(payload.asInput())
        )
        return try result.ok.body.json.ok
#else
        logger.error("say() method failed. WebAPI_Chat trait is not enabled.")
        return false
#endif
    }
}

extension Say {
    public struct Payload {
        public enum Parse: String {
            case none
            case full
        }

        public var channel: String
        public var text: String
        public var blocks: [BlockType]?
        public var attachments: [Attachment]?
        public var username: String?
        public var iconEmoji: String?
        public var iconUrl: String?
        public var linkNames: Bool?
        public var markdownText: String?
        public var mrkdwn: Bool?
        public var parse: Parse?
        public var replyBroadcast: Bool?
        public var unfurlLinks: Bool?
        public var unfurlMedia: Bool?
        public var threadTs: String?
        public var metadata: OpenAPIObjectContainer?

        public init(
            channel: String,
            text: String = "",
            blocks: [BlockType]? = nil,
            attachments: [Attachment]? = nil,
            markdownText: String? = nil,
            mrkdwn: Bool? = nil,
            parse: Parse? = nil,
            linkNames: Bool? = nil,
            username: String? = nil,
            iconEmoji: String? = nil,
            iconUrl: String? = nil,
            replyBroadcast: Bool? = nil,
            unfurlLinks: Bool? = nil,
            unfurlMedia: Bool? = nil,
            threadTs: String? = nil,
            metadata: OpenAPIObjectContainer? = nil
        ) {
            self.channel = channel
            self.text = text
            self.blocks = blocks
            self.attachments = attachments
            self.markdownText = markdownText
            self.mrkdwn = mrkdwn
            self.parse = parse
            self.linkNames = linkNames
            self.username = username
            self.iconUrl = iconUrl
            self.iconEmoji = iconEmoji
            self.replyBroadcast = replyBroadcast
            self.unfurlLinks = unfurlLinks
            self.unfurlMedia = unfurlMedia
            self.threadTs = threadTs
            self.metadata = metadata
        }

        private enum CodingKeys: String, CodingKey {
            case channel
            case text
            case blocks
            case attachments
            case markdownText = "mrkdwn_text"
            case mrkdwn
            case parse
            case iconEmoji = "icon_emoji"
            case iconUrl = "icon_url"
            case linkNames = "link_names"
            case username
            case replyBroadcast = "reply_broadcast"
            case unfurlLinks = "unfurl_links"
            case unfurlMedia = "unfurl_media"
            case threadTs = "thread_ts"
            case metadata
        }

#if WebAPI_Chat
        fileprivate func asInput() -> Operations.ChatPostMessage.Input.Body.JsonPayload {
            var payload = Operations.ChatPostMessage.Input.Body.JsonPayload(
                channel: channel,
                text: text,
                agentMessageSourceType: nil,
                asUser: nil,
                markdownText: markdownText,
                metadata: nil,
                mrkdwn: mrkdwn,
                parse: parse.flatMap { $0 == .none ? "none" : "full" },
                replyBroadcast: replyBroadcast,
                threadTs: threadTs,
                unfurlLinks: unfurlLinks,
                unfurlMedia: unfurlMedia,
                username: username,
            )
            return payload
        }
#endif
    }
}
