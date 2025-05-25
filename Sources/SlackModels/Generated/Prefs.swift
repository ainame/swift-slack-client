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

/// - Remark: Generated from `#/components/schemas/Prefs`.
public struct Prefs: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Prefs/channels`.
    public var channels: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Prefs/groups`.
    public var groups: [Swift.String]?
    /// Creates a new `Prefs`.
    ///
    /// - Parameters:
    ///   - channels:
    ///   - groups:
    public init(
        channels: [Swift.String]? = nil,
        groups: [Swift.String]? = nil
    ) {
        self.channels = channels
        self.groups = groups
    }
}
