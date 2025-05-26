@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/FileElement`.
public struct FileElement: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/FileElement/alt_txt`.
    public var altTxt: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/app_name`.
    public var appName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/bot_id`.
    public var botId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/cc`.
    public var cc: [Cc]?
    /// - Remark: Generated from `#/components/schemas/FileElement/channel_actions_count`.
    public var channelActionsCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/channel_actions_ts`.
    public var channelActionsTs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/channels`.
    public var channels: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/FileElement/comments_count`.
    public var commentsCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/converted_pdf`.
    public var convertedPdf: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/deanimate`.
    public var deanimate: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/deanimate_gif`.
    public var deanimateGif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/display_as_bot`.
    public var displayAsBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/duration_ms`.
    public var durationMs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/edit_link`.
    public var editLink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/editable`.
    public var editable: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/editor`.
    public var editor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/external_id`.
    public var externalId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/external_type`.
    public var externalType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/external_url`.
    public var externalUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/file_access`.
    public var fileAccess: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/filetype`.
    public var filetype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/from`.
    public var from: [Cc]?
    /// - Remark: Generated from `#/components/schemas/FileElement/groups`.
    public var groups: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/FileElement/has_more`.
    public var hasMore: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/has_more_shares`.
    public var hasMoreShares: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/has_rich_preview`.
    public var hasRichPreview: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/headers`.
    public var headers: Headers?
    /// - Remark: Generated from `#/components/schemas/FileElement/hls`.
    public var hls: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/hls_embed`.
    public var hlsEmbed: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/image_exif_rotation`.
    public var imageExifRotation: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/ims`.
    public var ims: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/FileElement/initial_comment`.
    public var initialComment: Comment?
    /// - Remark: Generated from `#/components/schemas/FileElement/is_external`.
    public var isExternal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/is_public`.
    public var isPublic: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/is_starred`.
    public var isStarred: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/last_editor`.
    public var lastEditor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/lines`.
    public var lines: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/lines_more`.
    public var linesMore: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/media_display_type`.
    public var mediaDisplayType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/media_progress`.
    public var mediaProgress: MediaProgress?
    /// - Remark: Generated from `#/components/schemas/FileElement/mimetype`.
    public var mimetype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/mode`.
    public var mode: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/mp4`.
    public var mp4: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/mp4_low`.
    public var mp4Low: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/non_owner_editable`.
    public var nonOwnerEditable: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/num_stars`.
    public var numStars: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/original_attachment_count`.
    public var originalAttachmentCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/original_h`.
    public var originalH: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/original_w`.
    public var originalW: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/permalink_public`.
    public var permalinkPublic: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/pinned_to`.
    public var pinnedTo: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/FileElement/pjpeg`.
    public var pjpeg: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/plain_text`.
    public var plainText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/pretty_type`.
    public var prettyType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/preview`.
    public var preview: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/preview_highlight`.
    public var previewHighlight: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/preview_is_truncated`.
    public var previewIsTruncated: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/preview_plain_text`.
    public var previewPlainText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/public_url_shared`.
    public var publicUrlShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/reactions`.
    public var reactions: [Reaction]?
    /// - Remark: Generated from `#/components/schemas/FileElement/saved`.
    public var saved: Saved?
    /// - Remark: Generated from `#/components/schemas/FileElement/sent_to_self`.
    public var sentToSelf: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/FileElement/shares`.
    public var shares: Shares?
    /// - Remark: Generated from `#/components/schemas/FileElement/simplified_html`.
    public var simplifiedHtml: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/size`.
    public var size: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/source_team`.
    public var sourceTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/subject`.
    public var subject: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/subtype`.
    public var subtype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_1024`.
    public var thumb1024: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_1024_gif`.
    public var thumb1024Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_1024_h`.
    public var thumb1024H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_1024_w`.
    public var thumb1024W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_160`.
    public var thumb160: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_160_gif`.
    public var thumb160Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_160_h`.
    public var thumb160H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_160_w`.
    public var thumb160W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_360`.
    public var thumb360: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_360_gif`.
    public var thumb360Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_360_h`.
    public var thumb360H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_360_w`.
    public var thumb360W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_480`.
    public var thumb480: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_480_gif`.
    public var thumb480Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_480_h`.
    public var thumb480H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_480_w`.
    public var thumb480W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_64`.
    public var thumb64: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_64_gif`.
    public var thumb64Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_64_h`.
    public var thumb64H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_64_w`.
    public var thumb64W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_720`.
    public var thumb720: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_720_gif`.
    public var thumb720Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_720_h`.
    public var thumb720H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_720_w`.
    public var thumb720W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_80`.
    public var thumb80: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_800`.
    public var thumb800: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_800_gif`.
    public var thumb800Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_800_h`.
    public var thumb800H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_800_w`.
    public var thumb800W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_80_gif`.
    public var thumb80Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_80_h`.
    public var thumb80H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_80_w`.
    public var thumb80W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_960`.
    public var thumb960: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_960_gif`.
    public var thumb960Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_960_h`.
    public var thumb960H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_960_w`.
    public var thumb960W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_gif`.
    public var thumbGif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_pdf`.
    public var thumbPdf: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_pdf_h`.
    public var thumbPdfH: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_pdf_w`.
    public var thumbPdfW: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_tiny`.
    public var thumbTiny: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_video`.
    public var thumbVideo: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_video_h`.
    public var thumbVideoH: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/thumb_video_w`.
    public var thumbVideoW: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/timestamp`.
    public var timestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/to`.
    public var to: [Cc]?
    /// - Remark: Generated from `#/components/schemas/FileElement/transcription`.
    public var transcription: Transcription?
    /// - Remark: Generated from `#/components/schemas/FileElement/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/FileElement/url_private`.
    public var urlPrivate: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/url_private_download`.
    public var urlPrivateDownload: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/user_team`.
    public var userTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/username`.
    public var username: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FileElement/vtt`.
    public var vtt: Swift.String?
    /// Creates a new `FileElement`.
    ///
    /// - Parameters:
    ///   - altTxt:
    ///   - appId:
    ///   - appName:
    ///   - botId:
    ///   - cc:
    ///   - channelActionsCount:
    ///   - channelActionsTs:
    ///   - channels:
    ///   - commentsCount:
    ///   - convertedPdf:
    ///   - created:
    ///   - deanimate:
    ///   - deanimateGif:
    ///   - displayAsBot:
    ///   - durationMs:
    ///   - editLink:
    ///   - editable:
    ///   - editor:
    ///   - externalId:
    ///   - externalType:
    ///   - externalUrl:
    ///   - fileAccess:
    ///   - filetype:
    ///   - from:
    ///   - groups:
    ///   - hasMore:
    ///   - hasMoreShares:
    ///   - hasRichPreview:
    ///   - headers:
    ///   - hls:
    ///   - hlsEmbed:
    ///   - id:
    ///   - imageExifRotation:
    ///   - ims:
    ///   - initialComment:
    ///   - isExternal:
    ///   - isPublic:
    ///   - isStarred:
    ///   - lastEditor:
    ///   - lines:
    ///   - linesMore:
    ///   - mediaDisplayType:
    ///   - mediaProgress:
    ///   - mimetype:
    ///   - mode:
    ///   - mp4:
    ///   - mp4Low:
    ///   - name:
    ///   - nonOwnerEditable:
    ///   - numStars:
    ///   - originalAttachmentCount:
    ///   - originalH:
    ///   - originalW:
    ///   - permalink:
    ///   - permalinkPublic:
    ///   - pinnedTo:
    ///   - pjpeg:
    ///   - plainText:
    ///   - prettyType:
    ///   - preview:
    ///   - previewHighlight:
    ///   - previewIsTruncated:
    ///   - previewPlainText:
    ///   - publicUrlShared:
    ///   - reactions:
    ///   - saved:
    ///   - sentToSelf:
    ///   - shares:
    ///   - simplifiedHtml:
    ///   - size:
    ///   - sourceTeam:
    ///   - subject:
    ///   - subtype:
    ///   - thumb1024:
    ///   - thumb1024Gif:
    ///   - thumb1024H:
    ///   - thumb1024W:
    ///   - thumb160:
    ///   - thumb160Gif:
    ///   - thumb160H:
    ///   - thumb160W:
    ///   - thumb360:
    ///   - thumb360Gif:
    ///   - thumb360H:
    ///   - thumb360W:
    ///   - thumb480:
    ///   - thumb480Gif:
    ///   - thumb480H:
    ///   - thumb480W:
    ///   - thumb64:
    ///   - thumb64Gif:
    ///   - thumb64H:
    ///   - thumb64W:
    ///   - thumb720:
    ///   - thumb720Gif:
    ///   - thumb720H:
    ///   - thumb720W:
    ///   - thumb80:
    ///   - thumb800:
    ///   - thumb800Gif:
    ///   - thumb800H:
    ///   - thumb800W:
    ///   - thumb80Gif:
    ///   - thumb80H:
    ///   - thumb80W:
    ///   - thumb960:
    ///   - thumb960Gif:
    ///   - thumb960H:
    ///   - thumb960W:
    ///   - thumbGif:
    ///   - thumbPdf:
    ///   - thumbPdfH:
    ///   - thumbPdfW:
    ///   - thumbTiny:
    ///   - thumbVideo:
    ///   - thumbVideoH:
    ///   - thumbVideoW:
    ///   - timestamp:
    ///   - title:
    ///   - to:
    ///   - transcription:
    ///   - updated:
    ///   - urlPrivate:
    ///   - urlPrivateDownload:
    ///   - user:
    ///   - userTeam:
    ///   - username:
    ///   - vtt:
    public init(
        altTxt: Swift.String? = nil,
        appId: Swift.String? = nil,
        appName: Swift.String? = nil,
        botId: Swift.String? = nil,
        cc: [Cc]? = nil,
        channelActionsCount: Swift.Int? = nil,
        channelActionsTs: Swift.String? = nil,
        channels: [Swift.String]? = nil,
        commentsCount: Swift.Int? = nil,
        convertedPdf: Swift.String? = nil,
        created: Swift.Int? = nil,
        deanimate: Swift.String? = nil,
        deanimateGif: Swift.String? = nil,
        displayAsBot: Swift.Bool? = nil,
        durationMs: Swift.Int? = nil,
        editLink: Swift.String? = nil,
        editable: Swift.Bool? = nil,
        editor: Swift.String? = nil,
        externalId: Swift.String? = nil,
        externalType: Swift.String? = nil,
        externalUrl: Swift.String? = nil,
        fileAccess: Swift.String? = nil,
        filetype: Swift.String? = nil,
        from: [Cc]? = nil,
        groups: [Swift.String]? = nil,
        hasMore: Swift.Bool? = nil,
        hasMoreShares: Swift.Bool? = nil,
        hasRichPreview: Swift.Bool? = nil,
        headers: Headers? = nil,
        hls: Swift.String? = nil,
        hlsEmbed: Swift.String? = nil,
        id: Swift.String? = nil,
        imageExifRotation: Swift.Int? = nil,
        ims: [Swift.String]? = nil,
        initialComment: Comment? = nil,
        isExternal: Swift.Bool? = nil,
        isPublic: Swift.Bool? = nil,
        isStarred: Swift.Bool? = nil,
        lastEditor: Swift.String? = nil,
        lines: Swift.Int? = nil,
        linesMore: Swift.Int? = nil,
        mediaDisplayType: Swift.String? = nil,
        mediaProgress: MediaProgress? = nil,
        mimetype: Swift.String? = nil,
        mode: Swift.String? = nil,
        mp4: Swift.String? = nil,
        mp4Low: Swift.String? = nil,
        name: Swift.String? = nil,
        nonOwnerEditable: Swift.Bool? = nil,
        numStars: Swift.Int? = nil,
        originalAttachmentCount: Swift.Int? = nil,
        originalH: Swift.String? = nil,
        originalW: Swift.String? = nil,
        permalink: Swift.String? = nil,
        permalinkPublic: Swift.String? = nil,
        pinnedTo: [Swift.String]? = nil,
        pjpeg: Swift.String? = nil,
        plainText: Swift.String? = nil,
        prettyType: Swift.String? = nil,
        preview: Swift.String? = nil,
        previewHighlight: Swift.String? = nil,
        previewIsTruncated: Swift.Bool? = nil,
        previewPlainText: Swift.String? = nil,
        publicUrlShared: Swift.Bool? = nil,
        reactions: [Reaction]? = nil,
        saved: Saved? = nil,
        sentToSelf: Swift.Bool? = nil,
        shares: Shares? = nil,
        simplifiedHtml: Swift.String? = nil,
        size: Swift.Int? = nil,
        sourceTeam: Swift.String? = nil,
        subject: Swift.String? = nil,
        subtype: Swift.String? = nil,
        thumb1024: Swift.String? = nil,
        thumb1024Gif: Swift.String? = nil,
        thumb1024H: Swift.String? = nil,
        thumb1024W: Swift.String? = nil,
        thumb160: Swift.String? = nil,
        thumb160Gif: Swift.String? = nil,
        thumb160H: Swift.String? = nil,
        thumb160W: Swift.String? = nil,
        thumb360: Swift.String? = nil,
        thumb360Gif: Swift.String? = nil,
        thumb360H: Swift.String? = nil,
        thumb360W: Swift.String? = nil,
        thumb480: Swift.String? = nil,
        thumb480Gif: Swift.String? = nil,
        thumb480H: Swift.String? = nil,
        thumb480W: Swift.String? = nil,
        thumb64: Swift.String? = nil,
        thumb64Gif: Swift.String? = nil,
        thumb64H: Swift.String? = nil,
        thumb64W: Swift.String? = nil,
        thumb720: Swift.String? = nil,
        thumb720Gif: Swift.String? = nil,
        thumb720H: Swift.String? = nil,
        thumb720W: Swift.String? = nil,
        thumb80: Swift.String? = nil,
        thumb800: Swift.String? = nil,
        thumb800Gif: Swift.String? = nil,
        thumb800H: Swift.String? = nil,
        thumb800W: Swift.String? = nil,
        thumb80Gif: Swift.String? = nil,
        thumb80H: Swift.String? = nil,
        thumb80W: Swift.String? = nil,
        thumb960: Swift.String? = nil,
        thumb960Gif: Swift.String? = nil,
        thumb960H: Swift.String? = nil,
        thumb960W: Swift.String? = nil,
        thumbGif: Swift.String? = nil,
        thumbPdf: Swift.String? = nil,
        thumbPdfH: Swift.String? = nil,
        thumbPdfW: Swift.String? = nil,
        thumbTiny: Swift.String? = nil,
        thumbVideo: Swift.String? = nil,
        thumbVideoH: Swift.Int? = nil,
        thumbVideoW: Swift.Int? = nil,
        timestamp: Swift.Int? = nil,
        title: Swift.String? = nil,
        to: [Cc]? = nil,
        transcription: Transcription? = nil,
        updated: Swift.Int? = nil,
        urlPrivate: Swift.String? = nil,
        urlPrivateDownload: Swift.String? = nil,
        user: Swift.String? = nil,
        userTeam: Swift.String? = nil,
        username: Swift.String? = nil,
        vtt: Swift.String? = nil
    ) {
        self.altTxt = altTxt
        self.appId = appId
        self.appName = appName
        self.botId = botId
        self.cc = cc
        self.channelActionsCount = channelActionsCount
        self.channelActionsTs = channelActionsTs
        self.channels = channels
        self.commentsCount = commentsCount
        self.convertedPdf = convertedPdf
        self.created = created
        self.deanimate = deanimate
        self.deanimateGif = deanimateGif
        self.displayAsBot = displayAsBot
        self.durationMs = durationMs
        self.editLink = editLink
        self.editable = editable
        self.editor = editor
        self.externalId = externalId
        self.externalType = externalType
        self.externalUrl = externalUrl
        self.fileAccess = fileAccess
        self.filetype = filetype
        self.from = from
        self.groups = groups
        self.hasMore = hasMore
        self.hasMoreShares = hasMoreShares
        self.hasRichPreview = hasRichPreview
        self.headers = headers
        self.hls = hls
        self.hlsEmbed = hlsEmbed
        self.id = id
        self.imageExifRotation = imageExifRotation
        self.ims = ims
        self.initialComment = initialComment
        self.isExternal = isExternal
        self.isPublic = isPublic
        self.isStarred = isStarred
        self.lastEditor = lastEditor
        self.lines = lines
        self.linesMore = linesMore
        self.mediaDisplayType = mediaDisplayType
        self.mediaProgress = mediaProgress
        self.mimetype = mimetype
        self.mode = mode
        self.mp4 = mp4
        self.mp4Low = mp4Low
        self.name = name
        self.nonOwnerEditable = nonOwnerEditable
        self.numStars = numStars
        self.originalAttachmentCount = originalAttachmentCount
        self.originalH = originalH
        self.originalW = originalW
        self.permalink = permalink
        self.permalinkPublic = permalinkPublic
        self.pinnedTo = pinnedTo
        self.pjpeg = pjpeg
        self.plainText = plainText
        self.prettyType = prettyType
        self.preview = preview
        self.previewHighlight = previewHighlight
        self.previewIsTruncated = previewIsTruncated
        self.previewPlainText = previewPlainText
        self.publicUrlShared = publicUrlShared
        self.reactions = reactions
        self.saved = saved
        self.sentToSelf = sentToSelf
        self.shares = shares
        self.simplifiedHtml = simplifiedHtml
        self.size = size
        self.sourceTeam = sourceTeam
        self.subject = subject
        self.subtype = subtype
        self.thumb1024 = thumb1024
        self.thumb1024Gif = thumb1024Gif
        self.thumb1024H = thumb1024H
        self.thumb1024W = thumb1024W
        self.thumb160 = thumb160
        self.thumb160Gif = thumb160Gif
        self.thumb160H = thumb160H
        self.thumb160W = thumb160W
        self.thumb360 = thumb360
        self.thumb360Gif = thumb360Gif
        self.thumb360H = thumb360H
        self.thumb360W = thumb360W
        self.thumb480 = thumb480
        self.thumb480Gif = thumb480Gif
        self.thumb480H = thumb480H
        self.thumb480W = thumb480W
        self.thumb64 = thumb64
        self.thumb64Gif = thumb64Gif
        self.thumb64H = thumb64H
        self.thumb64W = thumb64W
        self.thumb720 = thumb720
        self.thumb720Gif = thumb720Gif
        self.thumb720H = thumb720H
        self.thumb720W = thumb720W
        self.thumb80 = thumb80
        self.thumb800 = thumb800
        self.thumb800Gif = thumb800Gif
        self.thumb800H = thumb800H
        self.thumb800W = thumb800W
        self.thumb80Gif = thumb80Gif
        self.thumb80H = thumb80H
        self.thumb80W = thumb80W
        self.thumb960 = thumb960
        self.thumb960Gif = thumb960Gif
        self.thumb960H = thumb960H
        self.thumb960W = thumb960W
        self.thumbGif = thumbGif
        self.thumbPdf = thumbPdf
        self.thumbPdfH = thumbPdfH
        self.thumbPdfW = thumbPdfW
        self.thumbTiny = thumbTiny
        self.thumbVideo = thumbVideo
        self.thumbVideoH = thumbVideoH
        self.thumbVideoW = thumbVideoW
        self.timestamp = timestamp
        self.title = title
        self.to = to
        self.transcription = transcription
        self.updated = updated
        self.urlPrivate = urlPrivate
        self.urlPrivateDownload = urlPrivateDownload
        self.user = user
        self.userTeam = userTeam
        self.username = username
        self.vtt = vtt
    }
}
