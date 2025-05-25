#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Properties`.
public struct Properties: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Properties/canvas`.
    public var canvas: SlackModels.Canvas?
    /// - Remark: Generated from `#/components/schemas/Properties/tabs`.
    public var tabs: [SlackModels.Tab]?
    /// - Remark: Generated from `#/components/schemas/Properties/tabz`.
    public var tabz: [SlackModels.Tab]?
    /// - Remark: Generated from `#/components/schemas/Properties/postingRestrictedTo`.
    public var postingRestrictedTo: SlackModels.PostingRestrictedTo?
    /// - Remark: Generated from `#/components/schemas/Properties/huddlesRestricted`.
    public var huddlesRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Properties/threadsRestrictedTo`.
    public var threadsRestrictedTo: SlackModels.ThreadsRestrictedTo?
    /// Creates a new `Properties`.
    ///
    /// - Parameters:
    ///   - canvas:
    ///   - tabs:
    ///   - tabz:
    ///   - postingRestrictedTo:
    ///   - huddlesRestricted:
    ///   - threadsRestrictedTo:
    public init(
        canvas: SlackModels.Canvas? = nil,
        tabs: [SlackModels.Tab]? = nil,
        tabz: [SlackModels.Tab]? = nil,
        postingRestrictedTo: SlackModels.PostingRestrictedTo? = nil,
        huddlesRestricted: Swift.Bool? = nil,
        threadsRestrictedTo: SlackModels.ThreadsRestrictedTo? = nil
    ) {
        self.canvas = canvas
        self.tabs = tabs
        self.tabz = tabz
        self.postingRestrictedTo = postingRestrictedTo
        self.huddlesRestricted = huddlesRestricted
        self.threadsRestrictedTo = threadsRestrictedTo
    }
}
