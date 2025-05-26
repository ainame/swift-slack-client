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

/// - Remark: Generated from `#/components/schemas/Preview`.
public struct Preview: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Preview/can_remove`.
    public var canRemove: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Preview/icon_url`.
    public var iconUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Preview/subtitle`.
    public var subtitle: Description?
    /// - Remark: Generated from `#/components/schemas/Preview/title`.
    public var title: Description?
    /// - Remark: Generated from `#/components/schemas/Preview/type`.
    public var type: Swift.String?
    /// Creates a new `Preview`.
    ///
    /// - Parameters:
    ///   - canRemove:
    ///   - iconUrl:
    ///   - subtitle:
    ///   - title:
    ///   - type:
    public init(
        canRemove: Swift.Bool? = nil,
        iconUrl: Swift.String? = nil,
        subtitle: Description? = nil,
        title: Description? = nil,
        type: Swift.String? = nil
    ) {
        self.canRemove = canRemove
        self.iconUrl = iconUrl
        self.subtitle = subtitle
        self.title = title
        self.type = type
    }
}
