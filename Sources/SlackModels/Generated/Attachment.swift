#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Attachment`.
public struct Attachment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Attachment/fallback`.
    public var fallback: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/color`.
    public var color: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/pretext`.
    public var pretext: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/id`.
    public var id: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/indent`.
    public var indent: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/fields`.
    public var fields: [SlackModels.Field]?
    /// - Remark: Generated from `#/components/schemas/Attachment/footer`.
    public var footer: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/actions`.
    public var actions: [SlackModels.Action]?
    /// - Remark: Generated from `#/components/schemas/Attachment/blocks`.
    public var blocks: [SlackBlockKit.BlockType]?
    /// - Remark: Generated from `#/components/schemas/Attachment/preview`.
    public var preview: SlackModels.Preview?
    /// - Remark: Generated from `#/components/schemas/Attachment/files`.
    public var files: [SlackModels.FileElement]?
    /// - Remark: Generated from `#/components/schemas/Attachment/filename`.
    public var filename: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/size`.
    public var size: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/mimetype`.
    public var mimetype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/metadata`.
    public var metadata: SlackModels.Metadata?
    /// - Remark: Generated from `#/components/schemas/Attachment/msgSubtype`.
    public var msgSubtype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/callbackId`.
    public var callbackId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/serviceUrl`.
    public var serviceUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/serviceName`.
    public var serviceName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/serviceIcon`.
    public var serviceIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/authorId`.
    public var authorId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/authorName`.
    public var authorName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/authorLink`.
    public var authorLink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/authorIcon`.
    public var authorIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/fromUrl`.
    public var fromUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/originalUrl`.
    public var originalUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/authorSubname`.
    public var authorSubname: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/channelId`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/channelName`.
    public var channelName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/channelTeam`.
    public var channelTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/botId`.
    public var botId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/isMsgUnfurl`.
    public var isMsgUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/isReplyUnfurl`.
    public var isReplyUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/isThreadRootUnfurl`.
    public var isThreadRootUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/isAppUnfurl`.
    public var isAppUnfurl: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Attachment/appUnfurlUrl`.
    public var appUnfurlUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/titleLink`.
    public var titleLink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/imageUrl`.
    public var imageUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/imageWidth`.
    public var imageWidth: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/imageHeight`.
    public var imageHeight: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/imageBytes`.
    public var imageBytes: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/thumbUrl`.
    public var thumbUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/thumbWidth`.
    public var thumbWidth: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/thumbHeight`.
    public var thumbHeight: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/videoUrl`.
    public var videoUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/videoHtml`.
    public var videoHtml: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/videoHtmlWidth`.
    public var videoHtmlWidth: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/videoHtmlHeight`.
    public var videoHtmlHeight: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Attachment/footerIcon`.
    public var footerIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Attachment/mrkdwnIn`.
    public var mrkdwnIn: [Swift.String]?
    /// Creates a new `Attachment`.
    ///
    /// - Parameters:
    ///   - fallback:
    ///   - color:
    ///   - pretext:
    ///   - id:
    ///   - indent:
    ///   - title:
    ///   - text:
    ///   - fields:
    ///   - footer:
    ///   - ts:
    ///   - actions:
    ///   - blocks:
    ///   - preview:
    ///   - files:
    ///   - filename:
    ///   - size:
    ///   - mimetype:
    ///   - url:
    ///   - metadata:
    ///   - msgSubtype:
    ///   - callbackId:
    ///   - serviceUrl:
    ///   - serviceName:
    ///   - serviceIcon:
    ///   - authorId:
    ///   - authorName:
    ///   - authorLink:
    ///   - authorIcon:
    ///   - fromUrl:
    ///   - originalUrl:
    ///   - authorSubname:
    ///   - channelId:
    ///   - channelName:
    ///   - channelTeam:
    ///   - appId:
    ///   - botId:
    ///   - isMsgUnfurl:
    ///   - isReplyUnfurl:
    ///   - isThreadRootUnfurl:
    ///   - isAppUnfurl:
    ///   - appUnfurlUrl:
    ///   - titleLink:
    ///   - imageUrl:
    ///   - imageWidth:
    ///   - imageHeight:
    ///   - imageBytes:
    ///   - thumbUrl:
    ///   - thumbWidth:
    ///   - thumbHeight:
    ///   - videoUrl:
    ///   - videoHtml:
    ///   - videoHtmlWidth:
    ///   - videoHtmlHeight:
    ///   - footerIcon:
    ///   - mrkdwnIn:
    public init(
        fallback: Swift.String? = nil,
        color: Swift.String? = nil,
        pretext: Swift.String? = nil,
        id: Swift.Int? = nil,
        indent: Swift.Bool? = nil,
        title: Swift.String? = nil,
        text: Swift.String? = nil,
        fields: [SlackModels.Field]? = nil,
        footer: Swift.String? = nil,
        ts: Swift.String? = nil,
        actions: [SlackModels.Action]? = nil,
        blocks: [SlackBlockKit.BlockType]? = nil,
        preview: SlackModels.Preview? = nil,
        files: [SlackModels.FileElement]? = nil,
        filename: Swift.String? = nil,
        size: Swift.Int? = nil,
        mimetype: Swift.String? = nil,
        url: Swift.String? = nil,
        metadata: SlackModels.Metadata? = nil,
        msgSubtype: Swift.String? = nil,
        callbackId: Swift.String? = nil,
        serviceUrl: Swift.String? = nil,
        serviceName: Swift.String? = nil,
        serviceIcon: Swift.String? = nil,
        authorId: Swift.String? = nil,
        authorName: Swift.String? = nil,
        authorLink: Swift.String? = nil,
        authorIcon: Swift.String? = nil,
        fromUrl: Swift.String? = nil,
        originalUrl: Swift.String? = nil,
        authorSubname: Swift.String? = nil,
        channelId: Swift.String? = nil,
        channelName: Swift.String? = nil,
        channelTeam: Swift.String? = nil,
        appId: Swift.String? = nil,
        botId: Swift.String? = nil,
        isMsgUnfurl: Swift.Bool? = nil,
        isReplyUnfurl: Swift.Bool? = nil,
        isThreadRootUnfurl: Swift.Bool? = nil,
        isAppUnfurl: Swift.Bool? = nil,
        appUnfurlUrl: Swift.String? = nil,
        titleLink: Swift.String? = nil,
        imageUrl: Swift.String? = nil,
        imageWidth: Swift.Int? = nil,
        imageHeight: Swift.Int? = nil,
        imageBytes: Swift.Int? = nil,
        thumbUrl: Swift.String? = nil,
        thumbWidth: Swift.Int? = nil,
        thumbHeight: Swift.Int? = nil,
        videoUrl: Swift.String? = nil,
        videoHtml: Swift.String? = nil,
        videoHtmlWidth: Swift.Int? = nil,
        videoHtmlHeight: Swift.Int? = nil,
        footerIcon: Swift.String? = nil,
        mrkdwnIn: [Swift.String]? = nil
    ) {
        self.fallback = fallback
        self.color = color
        self.pretext = pretext
        self.id = id
        self.indent = indent
        self.title = title
        self.text = text
        self.fields = fields
        self.footer = footer
        self.ts = ts
        self.actions = actions
        self.blocks = blocks
        self.preview = preview
        self.files = files
        self.filename = filename
        self.size = size
        self.mimetype = mimetype
        self.url = url
        self.metadata = metadata
        self.msgSubtype = msgSubtype
        self.callbackId = callbackId
        self.serviceUrl = serviceUrl
        self.serviceName = serviceName
        self.serviceIcon = serviceIcon
        self.authorId = authorId
        self.authorName = authorName
        self.authorLink = authorLink
        self.authorIcon = authorIcon
        self.fromUrl = fromUrl
        self.originalUrl = originalUrl
        self.authorSubname = authorSubname
        self.channelId = channelId
        self.channelName = channelName
        self.channelTeam = channelTeam
        self.appId = appId
        self.botId = botId
        self.isMsgUnfurl = isMsgUnfurl
        self.isReplyUnfurl = isReplyUnfurl
        self.isThreadRootUnfurl = isThreadRootUnfurl
        self.isAppUnfurl = isAppUnfurl
        self.appUnfurlUrl = appUnfurlUrl
        self.titleLink = titleLink
        self.imageUrl = imageUrl
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.imageBytes = imageBytes
        self.thumbUrl = thumbUrl
        self.thumbWidth = thumbWidth
        self.thumbHeight = thumbHeight
        self.videoUrl = videoUrl
        self.videoHtml = videoHtml
        self.videoHtmlWidth = videoHtmlWidth
        self.videoHtmlHeight = videoHtmlHeight
        self.footerIcon = footerIcon
        self.mrkdwnIn = mrkdwnIn
    }
}
