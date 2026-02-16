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
    /// - Remark: Generated from `#/components/schemas/Properties/huddles_restricted`.
    public var huddlesRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Properties/is_dormant`.
    public var isDormant: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Properties/meeting_notes`.
    public var meetingNotes: MeetingNotes?
    /// - Remark: Generated from `#/components/schemas/Properties/posting_restricted_to`.
    public var postingRestrictedTo: PostingRestrictedTo?
    /// - Remark: Generated from `#/components/schemas/Properties/tabs`.
    public var tabs: [Tab]?
    /// - Remark: Generated from `#/components/schemas/Properties/tabz`.
    public var tabz: [Tab]?
    /// - Remark: Generated from `#/components/schemas/Properties/threads_restricted_to`.
    public var threadsRestrictedTo: ThreadsRestrictedTo?
    /// Creates a new `Properties`.
    ///
    /// - Parameters:
    ///   - canvas:
    ///   - huddlesRestricted:
    ///   - isDormant:
    ///   - meetingNotes:
    ///   - postingRestrictedTo:
    ///   - tabs:
    ///   - tabz:
    ///   - threadsRestrictedTo:
    public init(
        canvas: Canvas? = nil,
        huddlesRestricted: Swift.Bool? = nil,
        isDormant: Swift.Bool? = nil,
        meetingNotes: MeetingNotes? = nil,
        postingRestrictedTo: PostingRestrictedTo? = nil,
        tabs: [Tab]? = nil,
        tabz: [Tab]? = nil,
        threadsRestrictedTo: ThreadsRestrictedTo? = nil
    ) {
        self.canvas = canvas
        self.huddlesRestricted = huddlesRestricted
        self.isDormant = isDormant
        self.meetingNotes = meetingNotes
        self.postingRestrictedTo = postingRestrictedTo
        self.tabs = tabs
        self.tabz = tabz
        self.threadsRestrictedTo = threadsRestrictedTo
    }
    public enum CodingKeys: String, CodingKey {
        case canvas
        case huddlesRestricted = "huddles_restricted"
        case isDormant = "is_dormant"
        case meetingNotes = "meeting_notes"
        case postingRestrictedTo = "posting_restricted_to"
        case tabs
        case tabz
        case threadsRestrictedTo = "threads_restricted_to"
    }
}
