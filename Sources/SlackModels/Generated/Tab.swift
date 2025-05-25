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

/// - Remark: Generated from `#/components/schemas/Tab`.
public struct Tab: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Tab/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/type`.
    public var type: Swift.String?
    /// Creates a new `Tab`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - label:
    ///   - type:
    public init(
        id: Swift.String? = nil,
        label: Swift.String? = nil,
        type: Swift.String? = nil
    ) {
        self.id = id
        self.label = label
        self.type = type
    }
}
