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

/// - Remark: Generated from `#/components/schemas/Properties`.
public struct Properties: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Properties/canvas`.
    public var canvas: Canvas?
    /// - Remark: Generated from `#/components/schemas/Properties/tabs`.
    public var tabs: [Tab]?
    /// - Remark: Generated from `#/components/schemas/Properties/tabz`.
    public var tabz: [Tab]?
    /// - Remark: Generated from `#/components/schemas/Properties/postingRestrictedTo`.
    public var postingRestrictedTo: PostingRestrictedTo?
    /// - Remark: Generated from `#/components/schemas/Properties/huddlesRestricted`.
    public var huddlesRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Properties/threadsRestrictedTo`.
    public var threadsRestrictedTo: ThreadsRestrictedTo?
    /// - Remark: Generated from `#/components/schemas/Properties/meetingNotes`.
    public var meetingNotes: MeetingNotes?
    /// Creates a new `Properties`.
    ///
    /// - Parameters:
    ///   - canvas:
    ///   - tabs:
    ///   - tabz:
    ///   - postingRestrictedTo:
    ///   - huddlesRestricted:
    ///   - threadsRestrictedTo:
    ///   - meetingNotes:
    public init(
        canvas: Canvas? = nil,
        tabs: [Tab]? = nil,
        tabz: [Tab]? = nil,
        postingRestrictedTo: PostingRestrictedTo? = nil,
        huddlesRestricted: Swift.Bool? = nil,
        threadsRestrictedTo: ThreadsRestrictedTo? = nil,
        meetingNotes: MeetingNotes? = nil
    ) {
        self.canvas = canvas
        self.tabs = tabs
        self.tabz = tabz
        self.postingRestrictedTo = postingRestrictedTo
        self.huddlesRestricted = huddlesRestricted
        self.threadsRestrictedTo = threadsRestrictedTo
        self.meetingNotes = meetingNotes
    }
}
