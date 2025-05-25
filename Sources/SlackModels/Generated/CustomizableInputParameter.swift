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

/// - Remark: Generated from `#/components/schemas/CustomizableInputParameter`.
public struct CustomizableInputParameter: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/CustomizableInputParameter/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/CustomizableInputParameter/value`.
    public var value: Swift.String?
    /// Creates a new `CustomizableInputParameter`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - value:
    public init(
        name: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.name = name
        self.value = value
    }
}
