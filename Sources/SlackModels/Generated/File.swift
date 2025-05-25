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
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/File`.
public struct File: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/File/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/timestamp`.
    public var timestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/subject`.
    public var subject: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/mimetype`.
    public var mimetype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/filetype`.
    public var filetype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/mode`.
    public var mode: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/editable`.
    public var editable: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/editor`.
    public var editor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/editors`.
    public var editors: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/File/subtype`.
    public var subtype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/transcription`.
    public var transcription: Transcription?
    /// - Remark: Generated from `#/components/schemas/File/mp4`.
    public var mp4: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/vtt`.
    public var vtt: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/hls`.
    public var hls: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/username`.
    public var username: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/size`.
    public var size: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/deanimate`.
    public var deanimate: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/pjpeg`.
    public var pjpeg: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/preview`.
    public var preview: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/lines`.
    public var lines: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/channels`.
    public var channels: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/File/groups`.
    public var groups: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/File/ims`.
    public var ims: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/File/shares`.
    public var shares: Shares?
    /// - Remark: Generated from `#/components/schemas/File/to`.
    public var to: [Cc]?
    /// - Remark: Generated from `#/components/schemas/File/from`.
    public var from: [Cc]?
    /// - Remark: Generated from `#/components/schemas/File/cc`.
    public var cc: [Cc]?
    /// - Remark: Generated from `#/components/schemas/File/headers`.
    public var headers: Headers?
    /// - Remark: Generated from `#/components/schemas/File/saved`.
    public var saved: Saved?
    /// - Remark: Generated from `#/components/schemas/File/access`.
    public var access: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/favorites`.
    public var favorites: [Favorite]?
    /// - Remark: Generated from `#/components/schemas/File/reactions`.
    public var reactions: [Reaction]?
    /// - Remark: Generated from `#/components/schemas/File/attachments`.
    public var attachments: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// - Remark: Generated from `#/components/schemas/File/blocks`.
    public var blocks: [BlockType]?
    /// - Remark: Generated from `#/components/schemas/File/prettyType`.
    public var prettyType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/userTeam`.
    public var userTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/sourceTeam`.
    public var sourceTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/nonOwnerEditable`.
    public var nonOwnerEditable: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/lastEditor`.
    public var lastEditor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/fileAccess`.
    public var fileAccess: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/editTimestamp`.
    public var editTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/altTxt`.
    public var altTxt: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/mp4Low`.
    public var mp4Low: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/hlsEmbed`.
    public var hlsEmbed: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/durationMs`.
    public var durationMs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/thumbVideoW`.
    public var thumbVideoW: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/thumbVideoH`.
    public var thumbVideoH: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/originalAttachmentCount`.
    public var originalAttachmentCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/isExternal`.
    public var isExternal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/externalType`.
    public var externalType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/externalId`.
    public var externalId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/externalUrl`.
    public var externalUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/urlPrivate`.
    public var urlPrivate: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/urlPrivateDownload`.
    public var urlPrivateDownload: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/urlStaticPreview`.
    public var urlStaticPreview: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/appName`.
    public var appName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb64`.
    public var thumb64: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb64Gif`.
    public var thumb64Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb64W`.
    public var thumb64W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb64H`.
    public var thumb64H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb80`.
    public var thumb80: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb80Gif`.
    public var thumb80Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb80W`.
    public var thumb80W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb80H`.
    public var thumb80H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb160`.
    public var thumb160: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb160Gif`.
    public var thumb160Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb160W`.
    public var thumb160W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb160H`.
    public var thumb160H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb360`.
    public var thumb360: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb360Gif`.
    public var thumb360Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb360W`.
    public var thumb360W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb360H`.
    public var thumb360H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb480`.
    public var thumb480: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb480Gif`.
    public var thumb480Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb480W`.
    public var thumb480W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb480H`.
    public var thumb480H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb720`.
    public var thumb720: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb720Gif`.
    public var thumb720Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb720W`.
    public var thumb720W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb720H`.
    public var thumb720H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb800`.
    public var thumb800: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb800Gif`.
    public var thumb800Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb800W`.
    public var thumb800W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb800H`.
    public var thumb800H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb960`.
    public var thumb960: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb960Gif`.
    public var thumb960Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb960W`.
    public var thumb960W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb960H`.
    public var thumb960H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb1024`.
    public var thumb1024: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb1024Gif`.
    public var thumb1024Gif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb1024W`.
    public var thumb1024W: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumb1024H`.
    public var thumb1024H: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumbVideo`.
    public var thumbVideo: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumbGif`.
    public var thumbGif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumbPdf`.
    public var thumbPdf: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumbPdfW`.
    public var thumbPdfW: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumbPdfH`.
    public var thumbPdfH: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/thumbTiny`.
    public var thumbTiny: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/convertedPdf`.
    public var convertedPdf: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/imageExifRotation`.
    public var imageExifRotation: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/originalW`.
    public var originalW: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/originalH`.
    public var originalH: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/deanimateGif`.
    public var deanimateGif: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/permalinkPublic`.
    public var permalinkPublic: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/editLink`.
    public var editLink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/hasRichPreview`.
    public var hasRichPreview: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/mediaDisplayType`.
    public var mediaDisplayType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/previewIsTruncated`.
    public var previewIsTruncated: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/previewHighlight`.
    public var previewHighlight: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/plainText`.
    public var plainText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/previewPlainText`.
    public var previewPlainText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/hasMore`.
    public var hasMore: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/sentToSelf`.
    public var sentToSelf: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/linesMore`.
    public var linesMore: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/isPublic`.
    public var isPublic: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/publicUrlShared`.
    public var publicUrlShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/displayAsBot`.
    public var displayAsBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/hasMoreShares`.
    public var hasMoreShares: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/channelActionsTs`.
    public var channelActionsTs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/channelActionsCount`.
    public var channelActionsCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/simplifiedHtml`.
    public var simplifiedHtml: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/mediaProgress`.
    public var mediaProgress: MediaProgress?
    /// - Remark: Generated from `#/components/schemas/File/quipThreadId`.
    public var quipThreadId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/isChannelSpace`.
    public var isChannelSpace: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/linkedChannelId`.
    public var linkedChannelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/teamsSharedWith`.
    public var teamsSharedWith: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// - Remark: Generated from `#/components/schemas/File/lastRead`.
    public var lastRead: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/titleBlocks`.
    public var titleBlocks: [BlockType]?
    /// - Remark: Generated from `#/components/schemas/File/privateChannelsWithFileAccessCount`.
    public var privateChannelsWithFileAccessCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/privateFileWithAccessCount`.
    public var privateFileWithAccessCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/dmMpdmUsersWithFileAccess`.
    public var dmMpdmUsersWithFileAccess: [DmMpdmUsersWithFileAccess]?
    /// - Remark: Generated from `#/components/schemas/File/orgOrWorkspaceAccess`.
    public var orgOrWorkspaceAccess: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/updateNotification`.
    public var updateNotification: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/canvasTemplateMode`.
    public var canvasTemplateMode: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/templateConversionTs`.
    public var templateConversionTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/templateName`.
    public var templateName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/templateTitle`.
    public var templateTitle: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/templateDescription`.
    public var templateDescription: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/templateIcon`.
    public var templateIcon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/teamPrefVersionHistoryEnabled`.
    public var teamPrefVersionHistoryEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/showBadge`.
    public var showBadge: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/listMetadata`.
    public var listMetadata: ListMetadata?
    /// - Remark: Generated from `#/components/schemas/File/listLimits`.
    public var listLimits: ListLimits?
    /// - Remark: Generated from `#/components/schemas/File/listCsvDownloadUrl`.
    public var listCsvDownloadUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/canToggleCanvasLock`.
    public var canToggleCanvasLock: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/isRestrictedSharingEnabled`.
    public var isRestrictedSharingEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/canvasPrintingEnabled`.
    public var canvasPrintingEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/botId`.
    public var botId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/File/initialComment`.
    public var initialComment: InitialComment?
    /// - Remark: Generated from `#/components/schemas/File/numStars`.
    public var numStars: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/File/isStarred`.
    public var isStarred: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/File/pinnedTo`.
    public var pinnedTo: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/File/commentsCount`.
    public var commentsCount: Swift.Int?
    /// Creates a new `File`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - created:
    ///   - timestamp:
    ///   - name:
    ///   - title:
    ///   - subject:
    ///   - mimetype:
    ///   - filetype:
    ///   - user:
    ///   - mode:
    ///   - editable:
    ///   - editor:
    ///   - updated:
    ///   - editors:
    ///   - subtype:
    ///   - transcription:
    ///   - mp4:
    ///   - vtt:
    ///   - hls:
    ///   - username:
    ///   - size:
    ///   - deanimate:
    ///   - pjpeg:
    ///   - permalink:
    ///   - preview:
    ///   - lines:
    ///   - channels:
    ///   - groups:
    ///   - ims:
    ///   - shares:
    ///   - to:
    ///   - from:
    ///   - cc:
    ///   - headers:
    ///   - saved:
    ///   - access:
    ///   - favorites:
    ///   - reactions:
    ///   - attachments:
    ///   - blocks:
    ///   - prettyType:
    ///   - userTeam:
    ///   - sourceTeam:
    ///   - nonOwnerEditable:
    ///   - lastEditor:
    ///   - fileAccess:
    ///   - editTimestamp:
    ///   - altTxt:
    ///   - mp4Low:
    ///   - hlsEmbed:
    ///   - durationMs:
    ///   - thumbVideoW:
    ///   - thumbVideoH:
    ///   - originalAttachmentCount:
    ///   - isExternal:
    ///   - externalType:
    ///   - externalId:
    ///   - externalUrl:
    ///   - urlPrivate:
    ///   - urlPrivateDownload:
    ///   - urlStaticPreview:
    ///   - appId:
    ///   - appName:
    ///   - thumb64:
    ///   - thumb64Gif:
    ///   - thumb64W:
    ///   - thumb64H:
    ///   - thumb80:
    ///   - thumb80Gif:
    ///   - thumb80W:
    ///   - thumb80H:
    ///   - thumb160:
    ///   - thumb160Gif:
    ///   - thumb160W:
    ///   - thumb160H:
    ///   - thumb360:
    ///   - thumb360Gif:
    ///   - thumb360W:
    ///   - thumb360H:
    ///   - thumb480:
    ///   - thumb480Gif:
    ///   - thumb480W:
    ///   - thumb480H:
    ///   - thumb720:
    ///   - thumb720Gif:
    ///   - thumb720W:
    ///   - thumb720H:
    ///   - thumb800:
    ///   - thumb800Gif:
    ///   - thumb800W:
    ///   - thumb800H:
    ///   - thumb960:
    ///   - thumb960Gif:
    ///   - thumb960W:
    ///   - thumb960H:
    ///   - thumb1024:
    ///   - thumb1024Gif:
    ///   - thumb1024W:
    ///   - thumb1024H:
    ///   - thumbVideo:
    ///   - thumbGif:
    ///   - thumbPdf:
    ///   - thumbPdfW:
    ///   - thumbPdfH:
    ///   - thumbTiny:
    ///   - convertedPdf:
    ///   - imageExifRotation:
    ///   - originalW:
    ///   - originalH:
    ///   - deanimateGif:
    ///   - permalinkPublic:
    ///   - editLink:
    ///   - hasRichPreview:
    ///   - mediaDisplayType:
    ///   - previewIsTruncated:
    ///   - previewHighlight:
    ///   - plainText:
    ///   - previewPlainText:
    ///   - hasMore:
    ///   - sentToSelf:
    ///   - linesMore:
    ///   - isPublic:
    ///   - publicUrlShared:
    ///   - displayAsBot:
    ///   - hasMoreShares:
    ///   - channelActionsTs:
    ///   - channelActionsCount:
    ///   - simplifiedHtml:
    ///   - mediaProgress:
    ///   - quipThreadId:
    ///   - isChannelSpace:
    ///   - linkedChannelId:
    ///   - teamsSharedWith:
    ///   - lastRead:
    ///   - titleBlocks:
    ///   - privateChannelsWithFileAccessCount:
    ///   - privateFileWithAccessCount:
    ///   - dmMpdmUsersWithFileAccess:
    ///   - orgOrWorkspaceAccess:
    ///   - updateNotification:
    ///   - canvasTemplateMode:
    ///   - templateConversionTs:
    ///   - templateName:
    ///   - templateTitle:
    ///   - templateDescription:
    ///   - templateIcon:
    ///   - teamPrefVersionHistoryEnabled:
    ///   - showBadge:
    ///   - listMetadata:
    ///   - listLimits:
    ///   - listCsvDownloadUrl:
    ///   - canToggleCanvasLock:
    ///   - isRestrictedSharingEnabled:
    ///   - canvasPrintingEnabled:
    ///   - botId:
    ///   - initialComment:
    ///   - numStars:
    ///   - isStarred:
    ///   - pinnedTo:
    ///   - commentsCount:
    public init(
        id: Swift.String? = nil,
        created: Swift.Int? = nil,
        timestamp: Swift.Int? = nil,
        name: Swift.String? = nil,
        title: Swift.String? = nil,
        subject: Swift.String? = nil,
        mimetype: Swift.String? = nil,
        filetype: Swift.String? = nil,
        user: Swift.String? = nil,
        mode: Swift.String? = nil,
        editable: Swift.Bool? = nil,
        editor: Swift.String? = nil,
        updated: Swift.Int? = nil,
        editors: [Swift.String]? = nil,
        subtype: Swift.String? = nil,
        transcription: Transcription? = nil,
        mp4: Swift.String? = nil,
        vtt: Swift.String? = nil,
        hls: Swift.String? = nil,
        username: Swift.String? = nil,
        size: Swift.Int? = nil,
        deanimate: Swift.String? = nil,
        pjpeg: Swift.String? = nil,
        permalink: Swift.String? = nil,
        preview: Swift.String? = nil,
        lines: Swift.Int? = nil,
        channels: [Swift.String]? = nil,
        groups: [Swift.String]? = nil,
        ims: [Swift.String]? = nil,
        shares: Shares? = nil,
        to: [Cc]? = nil,
        from: [Cc]? = nil,
        cc: [Cc]? = nil,
        headers: Headers? = nil,
        saved: Saved? = nil,
        access: Swift.String? = nil,
        favorites: [Favorite]? = nil,
        reactions: [Reaction]? = nil,
        attachments: [OpenAPIRuntime.OpenAPIValueContainer]? = nil,
        blocks: [BlockType]? = nil,
        prettyType: Swift.String? = nil,
        userTeam: Swift.String? = nil,
        sourceTeam: Swift.String? = nil,
        nonOwnerEditable: Swift.Bool? = nil,
        lastEditor: Swift.String? = nil,
        fileAccess: Swift.String? = nil,
        editTimestamp: Swift.Int? = nil,
        altTxt: Swift.String? = nil,
        mp4Low: Swift.String? = nil,
        hlsEmbed: Swift.String? = nil,
        durationMs: Swift.Int? = nil,
        thumbVideoW: Swift.Int? = nil,
        thumbVideoH: Swift.Int? = nil,
        originalAttachmentCount: Swift.Int? = nil,
        isExternal: Swift.Bool? = nil,
        externalType: Swift.String? = nil,
        externalId: Swift.String? = nil,
        externalUrl: Swift.String? = nil,
        urlPrivate: Swift.String? = nil,
        urlPrivateDownload: Swift.String? = nil,
        urlStaticPreview: Swift.String? = nil,
        appId: Swift.String? = nil,
        appName: Swift.String? = nil,
        thumb64: Swift.String? = nil,
        thumb64Gif: Swift.String? = nil,
        thumb64W: Swift.String? = nil,
        thumb64H: Swift.String? = nil,
        thumb80: Swift.String? = nil,
        thumb80Gif: Swift.String? = nil,
        thumb80W: Swift.String? = nil,
        thumb80H: Swift.String? = nil,
        thumb160: Swift.String? = nil,
        thumb160Gif: Swift.String? = nil,
        thumb160W: Swift.String? = nil,
        thumb160H: Swift.String? = nil,
        thumb360: Swift.String? = nil,
        thumb360Gif: Swift.String? = nil,
        thumb360W: Swift.String? = nil,
        thumb360H: Swift.String? = nil,
        thumb480: Swift.String? = nil,
        thumb480Gif: Swift.String? = nil,
        thumb480W: Swift.String? = nil,
        thumb480H: Swift.String? = nil,
        thumb720: Swift.String? = nil,
        thumb720Gif: Swift.String? = nil,
        thumb720W: Swift.String? = nil,
        thumb720H: Swift.String? = nil,
        thumb800: Swift.String? = nil,
        thumb800Gif: Swift.String? = nil,
        thumb800W: Swift.String? = nil,
        thumb800H: Swift.String? = nil,
        thumb960: Swift.String? = nil,
        thumb960Gif: Swift.String? = nil,
        thumb960W: Swift.String? = nil,
        thumb960H: Swift.String? = nil,
        thumb1024: Swift.String? = nil,
        thumb1024Gif: Swift.String? = nil,
        thumb1024W: Swift.String? = nil,
        thumb1024H: Swift.String? = nil,
        thumbVideo: Swift.String? = nil,
        thumbGif: Swift.String? = nil,
        thumbPdf: Swift.String? = nil,
        thumbPdfW: Swift.String? = nil,
        thumbPdfH: Swift.String? = nil,
        thumbTiny: Swift.String? = nil,
        convertedPdf: Swift.String? = nil,
        imageExifRotation: Swift.Int? = nil,
        originalW: Swift.String? = nil,
        originalH: Swift.String? = nil,
        deanimateGif: Swift.String? = nil,
        permalinkPublic: Swift.String? = nil,
        editLink: Swift.String? = nil,
        hasRichPreview: Swift.Bool? = nil,
        mediaDisplayType: Swift.String? = nil,
        previewIsTruncated: Swift.Bool? = nil,
        previewHighlight: Swift.String? = nil,
        plainText: Swift.String? = nil,
        previewPlainText: Swift.String? = nil,
        hasMore: Swift.Bool? = nil,
        sentToSelf: Swift.Bool? = nil,
        linesMore: Swift.Int? = nil,
        isPublic: Swift.Bool? = nil,
        publicUrlShared: Swift.Bool? = nil,
        displayAsBot: Swift.Bool? = nil,
        hasMoreShares: Swift.Bool? = nil,
        channelActionsTs: Swift.String? = nil,
        channelActionsCount: Swift.Int? = nil,
        simplifiedHtml: Swift.String? = nil,
        mediaProgress: MediaProgress? = nil,
        quipThreadId: Swift.String? = nil,
        isChannelSpace: Swift.Bool? = nil,
        linkedChannelId: Swift.String? = nil,
        teamsSharedWith: [OpenAPIRuntime.OpenAPIValueContainer]? = nil,
        lastRead: Swift.Int? = nil,
        titleBlocks: [BlockType]? = nil,
        privateChannelsWithFileAccessCount: Swift.Int? = nil,
        privateFileWithAccessCount: Swift.Int? = nil,
        dmMpdmUsersWithFileAccess: [DmMpdmUsersWithFileAccess]? = nil,
        orgOrWorkspaceAccess: Swift.String? = nil,
        updateNotification: Swift.Int? = nil,
        canvasTemplateMode: Swift.String? = nil,
        templateConversionTs: Swift.Int? = nil,
        templateName: Swift.String? = nil,
        templateTitle: Swift.String? = nil,
        templateDescription: Swift.String? = nil,
        templateIcon: Swift.String? = nil,
        teamPrefVersionHistoryEnabled: Swift.Bool? = nil,
        showBadge: Swift.Bool? = nil,
        listMetadata: ListMetadata? = nil,
        listLimits: ListLimits? = nil,
        listCsvDownloadUrl: Swift.String? = nil,
        canToggleCanvasLock: Swift.Bool? = nil,
        isRestrictedSharingEnabled: Swift.Bool? = nil,
        canvasPrintingEnabled: Swift.Bool? = nil,
        botId: Swift.String? = nil,
        initialComment: InitialComment? = nil,
        numStars: Swift.Int? = nil,
        isStarred: Swift.Bool? = nil,
        pinnedTo: [Swift.String]? = nil,
        commentsCount: Swift.Int? = nil
    ) {
        self.id = id
        self.created = created
        self.timestamp = timestamp
        self.name = name
        self.title = title
        self.subject = subject
        self.mimetype = mimetype
        self.filetype = filetype
        self.user = user
        self.mode = mode
        self.editable = editable
        self.editor = editor
        self.updated = updated
        self.editors = editors
        self.subtype = subtype
        self.transcription = transcription
        self.mp4 = mp4
        self.vtt = vtt
        self.hls = hls
        self.username = username
        self.size = size
        self.deanimate = deanimate
        self.pjpeg = pjpeg
        self.permalink = permalink
        self.preview = preview
        self.lines = lines
        self.channels = channels
        self.groups = groups
        self.ims = ims
        self.shares = shares
        self.to = to
        self.from = from
        self.cc = cc
        self.headers = headers
        self.saved = saved
        self.access = access
        self.favorites = favorites
        self.reactions = reactions
        self.attachments = attachments
        self.blocks = blocks
        self.prettyType = prettyType
        self.userTeam = userTeam
        self.sourceTeam = sourceTeam
        self.nonOwnerEditable = nonOwnerEditable
        self.lastEditor = lastEditor
        self.fileAccess = fileAccess
        self.editTimestamp = editTimestamp
        self.altTxt = altTxt
        self.mp4Low = mp4Low
        self.hlsEmbed = hlsEmbed
        self.durationMs = durationMs
        self.thumbVideoW = thumbVideoW
        self.thumbVideoH = thumbVideoH
        self.originalAttachmentCount = originalAttachmentCount
        self.isExternal = isExternal
        self.externalType = externalType
        self.externalId = externalId
        self.externalUrl = externalUrl
        self.urlPrivate = urlPrivate
        self.urlPrivateDownload = urlPrivateDownload
        self.urlStaticPreview = urlStaticPreview
        self.appId = appId
        self.appName = appName
        self.thumb64 = thumb64
        self.thumb64Gif = thumb64Gif
        self.thumb64W = thumb64W
        self.thumb64H = thumb64H
        self.thumb80 = thumb80
        self.thumb80Gif = thumb80Gif
        self.thumb80W = thumb80W
        self.thumb80H = thumb80H
        self.thumb160 = thumb160
        self.thumb160Gif = thumb160Gif
        self.thumb160W = thumb160W
        self.thumb160H = thumb160H
        self.thumb360 = thumb360
        self.thumb360Gif = thumb360Gif
        self.thumb360W = thumb360W
        self.thumb360H = thumb360H
        self.thumb480 = thumb480
        self.thumb480Gif = thumb480Gif
        self.thumb480W = thumb480W
        self.thumb480H = thumb480H
        self.thumb720 = thumb720
        self.thumb720Gif = thumb720Gif
        self.thumb720W = thumb720W
        self.thumb720H = thumb720H
        self.thumb800 = thumb800
        self.thumb800Gif = thumb800Gif
        self.thumb800W = thumb800W
        self.thumb800H = thumb800H
        self.thumb960 = thumb960
        self.thumb960Gif = thumb960Gif
        self.thumb960W = thumb960W
        self.thumb960H = thumb960H
        self.thumb1024 = thumb1024
        self.thumb1024Gif = thumb1024Gif
        self.thumb1024W = thumb1024W
        self.thumb1024H = thumb1024H
        self.thumbVideo = thumbVideo
        self.thumbGif = thumbGif
        self.thumbPdf = thumbPdf
        self.thumbPdfW = thumbPdfW
        self.thumbPdfH = thumbPdfH
        self.thumbTiny = thumbTiny
        self.convertedPdf = convertedPdf
        self.imageExifRotation = imageExifRotation
        self.originalW = originalW
        self.originalH = originalH
        self.deanimateGif = deanimateGif
        self.permalinkPublic = permalinkPublic
        self.editLink = editLink
        self.hasRichPreview = hasRichPreview
        self.mediaDisplayType = mediaDisplayType
        self.previewIsTruncated = previewIsTruncated
        self.previewHighlight = previewHighlight
        self.plainText = plainText
        self.previewPlainText = previewPlainText
        self.hasMore = hasMore
        self.sentToSelf = sentToSelf
        self.linesMore = linesMore
        self.isPublic = isPublic
        self.publicUrlShared = publicUrlShared
        self.displayAsBot = displayAsBot
        self.hasMoreShares = hasMoreShares
        self.channelActionsTs = channelActionsTs
        self.channelActionsCount = channelActionsCount
        self.simplifiedHtml = simplifiedHtml
        self.mediaProgress = mediaProgress
        self.quipThreadId = quipThreadId
        self.isChannelSpace = isChannelSpace
        self.linkedChannelId = linkedChannelId
        self.teamsSharedWith = teamsSharedWith
        self.lastRead = lastRead
        self.titleBlocks = titleBlocks
        self.privateChannelsWithFileAccessCount = privateChannelsWithFileAccessCount
        self.privateFileWithAccessCount = privateFileWithAccessCount
        self.dmMpdmUsersWithFileAccess = dmMpdmUsersWithFileAccess
        self.orgOrWorkspaceAccess = orgOrWorkspaceAccess
        self.updateNotification = updateNotification
        self.canvasTemplateMode = canvasTemplateMode
        self.templateConversionTs = templateConversionTs
        self.templateName = templateName
        self.templateTitle = templateTitle
        self.templateDescription = templateDescription
        self.templateIcon = templateIcon
        self.teamPrefVersionHistoryEnabled = teamPrefVersionHistoryEnabled
        self.showBadge = showBadge
        self.listMetadata = listMetadata
        self.listLimits = listLimits
        self.listCsvDownloadUrl = listCsvDownloadUrl
        self.canToggleCanvasLock = canToggleCanvasLock
        self.isRestrictedSharingEnabled = isRestrictedSharingEnabled
        self.canvasPrintingEnabled = canvasPrintingEnabled
        self.botId = botId
        self.initialComment = initialComment
        self.numStars = numStars
        self.isStarred = isStarred
        self.pinnedTo = pinnedTo
        self.commentsCount = commentsCount
    }
}
