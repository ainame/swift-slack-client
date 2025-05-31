@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Attachment`.
public struct Attachment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Attachment/actions`.
    public var actions: [Action]?
    /// - Remark: Generated from `#/components/schemas/Attachment/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/app_unfurl_url`.
    public var appUnfurlUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/author_icon`.
    public var authorIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/author_id`.
    public var authorId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/author_link`.
    public var authorLink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/author_name`.
    public var authorName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/author_subname`.
    public var authorSubname: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/blocks`.
    public var blocks: [Block]?
    /// - Remark: Generated from `#/components/schemas/Attachment/bot_id`.
    public var botId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/callback_id`.
    public var callbackId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/channel_name`.
    public var channelName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/channel_team`.
    public var channelTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/color`.
    public var color: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/fallback`.
    public var fallback: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/fields`.
    public var fields: [Field]?
    /// - Remark: Generated from `#/components/schemas/Attachment/filename`.
    public var filename: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/files`.
    public var files: [FileElement]?
    /// - Remark: Generated from `#/components/schemas/Attachment/footer`.
    public var footer: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/footer_icon`.
    public var footerIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/from_url`.
    public var fromUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/id`.
    public var id: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/image_bytes`.
    public var imageBytes: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/image_height`.
    public var imageHeight: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/image_url`.
    public var imageUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/image_width`.
    public var imageWidth: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/indent`.
    public var indent: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/is_app_unfurl`.
    public var isAppUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/is_msg_unfurl`.
    public var isMsgUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/is_reply_unfurl`.
    public var isReplyUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/is_thread_root_unfurl`.
    public var isThreadRootUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/metadata`.
    public var metadata: Metadata?
    /// - Remark: Generated from `#/components/schemas/Attachment/mimetype`.
    public var mimetype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/mrkdwn_in`.
    public var mrkdwnIn: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Attachment/msg_subtype`.
    public var msgSubtype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/original_url`.
    public var originalUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/pretext`.
    public var pretext: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/preview`.
    public var preview: Preview?
    /// - Remark: Generated from `#/components/schemas/Attachment/service_icon`.
    public var serviceIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/service_name`.
    public var serviceName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/service_url`.
    public var serviceUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/size`.
    public var size: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/thumb_height`.
    public var thumbHeight: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/thumb_url`.
    public var thumbUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/thumb_width`.
    public var thumbWidth: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/title_link`.
    public var titleLink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/video_html`.
    public var videoHtml: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/video_html_height`.
    public var videoHtmlHeight: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/video_html_width`.
    public var videoHtmlWidth: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/video_url`.
    public var videoUrl: Swift.String?
    /// Creates a new `Attachment`.
    ///
    /// - Parameters:
    ///   - actions:
    ///   - appId:
    ///   - appUnfurlUrl:
    ///   - authorIcon:
    ///   - authorId:
    ///   - authorLink:
    ///   - authorName:
    ///   - authorSubname:
    ///   - blocks:
    ///   - botId:
    ///   - callbackId:
    ///   - channelId:
    ///   - channelName:
    ///   - channelTeam:
    ///   - color:
    ///   - fallback:
    ///   - fields:
    ///   - filename:
    ///   - files:
    ///   - footer:
    ///   - footerIcon:
    ///   - fromUrl:
    ///   - id:
    ///   - imageBytes:
    ///   - imageHeight:
    ///   - imageUrl:
    ///   - imageWidth:
    ///   - indent:
    ///   - isAppUnfurl:
    ///   - isMsgUnfurl:
    ///   - isReplyUnfurl:
    ///   - isThreadRootUnfurl:
    ///   - metadata:
    ///   - mimetype:
    ///   - mrkdwnIn:
    ///   - msgSubtype:
    ///   - originalUrl:
    ///   - pretext:
    ///   - preview:
    ///   - serviceIcon:
    ///   - serviceName:
    ///   - serviceUrl:
    ///   - size:
    ///   - text:
    ///   - thumbHeight:
    ///   - thumbUrl:
    ///   - thumbWidth:
    ///   - title:
    ///   - titleLink:
    ///   - ts:
    ///   - url:
    ///   - videoHtml:
    ///   - videoHtmlHeight:
    ///   - videoHtmlWidth:
    ///   - videoUrl:
    public init(
        actions: [Action]? = nil,
        appId: Swift.String? = nil,
        appUnfurlUrl: Swift.String? = nil,
        authorIcon: Swift.String? = nil,
        authorId: Swift.String? = nil,
        authorLink: Swift.String? = nil,
        authorName: Swift.String? = nil,
        authorSubname: Swift.String? = nil,
        blocks: [Block]? = nil,
        botId: Swift.String? = nil,
        callbackId: Swift.String? = nil,
        channelId: Swift.String? = nil,
        channelName: Swift.String? = nil,
        channelTeam: Swift.String? = nil,
        color: Swift.String? = nil,
        fallback: Swift.String? = nil,
        fields: [Field]? = nil,
        filename: Swift.String? = nil,
        files: [FileElement]? = nil,
        footer: Swift.String? = nil,
        footerIcon: Swift.String? = nil,
        fromUrl: Swift.String? = nil,
        id: Swift.Int? = nil,
        imageBytes: Swift.Int? = nil,
        imageHeight: Swift.Int? = nil,
        imageUrl: Swift.String? = nil,
        imageWidth: Swift.Int? = nil,
        indent: Swift.Bool? = nil,
        isAppUnfurl: Swift.Bool? = nil,
        isMsgUnfurl: Swift.Bool? = nil,
        isReplyUnfurl: Swift.Bool? = nil,
        isThreadRootUnfurl: Swift.Bool? = nil,
        metadata: Metadata? = nil,
        mimetype: Swift.String? = nil,
        mrkdwnIn: [Swift.String]? = nil,
        msgSubtype: Swift.String? = nil,
        originalUrl: Swift.String? = nil,
        pretext: Swift.String? = nil,
        preview: Preview? = nil,
        serviceIcon: Swift.String? = nil,
        serviceName: Swift.String? = nil,
        serviceUrl: Swift.String? = nil,
        size: Swift.Int? = nil,
        text: Swift.String? = nil,
        thumbHeight: Swift.Int? = nil,
        thumbUrl: Swift.String? = nil,
        thumbWidth: Swift.Int? = nil,
        title: Swift.String? = nil,
        titleLink: Swift.String? = nil,
        ts: Swift.String? = nil,
        url: Swift.String? = nil,
        videoHtml: Swift.String? = nil,
        videoHtmlHeight: Swift.Int? = nil,
        videoHtmlWidth: Swift.Int? = nil,
        videoUrl: Swift.String? = nil
    ) {
        self.actions = actions
        self.appId = appId
        self.appUnfurlUrl = appUnfurlUrl
        self.authorIcon = authorIcon
        self.authorId = authorId
        self.authorLink = authorLink
        self.authorName = authorName
        self.authorSubname = authorSubname
        self.blocks = blocks
        self.botId = botId
        self.callbackId = callbackId
        self.channelId = channelId
        self.channelName = channelName
        self.channelTeam = channelTeam
        self.color = color
        self.fallback = fallback
        self.fields = fields
        self.filename = filename
        self.files = files
        self.footer = footer
        self.footerIcon = footerIcon
        self.fromUrl = fromUrl
        self.id = id
        self.imageBytes = imageBytes
        self.imageHeight = imageHeight
        self.imageUrl = imageUrl
        self.imageWidth = imageWidth
        self.indent = indent
        self.isAppUnfurl = isAppUnfurl
        self.isMsgUnfurl = isMsgUnfurl
        self.isReplyUnfurl = isReplyUnfurl
        self.isThreadRootUnfurl = isThreadRootUnfurl
        self.metadata = metadata
        self.mimetype = mimetype
        self.mrkdwnIn = mrkdwnIn
        self.msgSubtype = msgSubtype
        self.originalUrl = originalUrl
        self.pretext = pretext
        self.preview = preview
        self.serviceIcon = serviceIcon
        self.serviceName = serviceName
        self.serviceUrl = serviceUrl
        self.size = size
        self.text = text
        self.thumbHeight = thumbHeight
        self.thumbUrl = thumbUrl
        self.thumbWidth = thumbWidth
        self.title = title
        self.titleLink = titleLink
        self.ts = ts
        self.url = url
        self.videoHtml = videoHtml
        self.videoHtmlHeight = videoHtmlHeight
        self.videoHtmlWidth = videoHtmlWidth
        self.videoUrl = videoUrl
    }

    public enum CodingKeys: String, CodingKey {
        case actions
        case appId = "app_id"
        case appUnfurlUrl = "app_unfurl_url"
        case authorIcon = "author_icon"
        case authorId = "author_id"
        case authorLink = "author_link"
        case authorName = "author_name"
        case authorSubname = "author_subname"
        case blocks
        case botId = "bot_id"
        case callbackId = "callback_id"
        case channelId = "channel_id"
        case channelName = "channel_name"
        case channelTeam = "channel_team"
        case color
        case fallback
        case fields
        case filename
        case files
        case footer
        case footerIcon = "footer_icon"
        case fromUrl = "from_url"
        case id
        case imageBytes = "image_bytes"
        case imageHeight = "image_height"
        case imageUrl = "image_url"
        case imageWidth = "image_width"
        case indent
        case isAppUnfurl = "is_app_unfurl"
        case isMsgUnfurl = "is_msg_unfurl"
        case isReplyUnfurl = "is_reply_unfurl"
        case isThreadRootUnfurl = "is_thread_root_unfurl"
        case metadata
        case mimetype
        case mrkdwnIn = "mrkdwn_in"
        case msgSubtype = "msg_subtype"
        case originalUrl = "original_url"
        case pretext
        case preview
        case serviceIcon = "service_icon"
        case serviceName = "service_name"
        case serviceUrl = "service_url"
        case size
        case text
        case thumbHeight = "thumb_height"
        case thumbUrl = "thumb_url"
        case thumbWidth = "thumb_width"
        case title
        case titleLink = "title_link"
        case ts
        case url
        case videoHtml = "video_html"
        case videoHtmlHeight = "video_html_height"
        case videoHtmlWidth = "video_html_width"
        case videoUrl = "video_url"
    }
}
