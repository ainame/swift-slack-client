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

    public enum CodingKeys: String, CodingKey {
        case channels
        case groups
    }
}
