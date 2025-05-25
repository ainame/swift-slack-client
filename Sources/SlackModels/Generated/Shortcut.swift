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

/// - Remark: Generated from `#/components/schemas/Shortcut`.
public struct Shortcut: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Shortcut/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Shortcut/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Shortcut/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Shortcut/callbackId`.
    public var callbackId: Swift.String?
    /// Creates a new `Shortcut`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - name:
    ///   - description:
    ///   - callbackId:
    public init(
        type: Swift.String? = nil,
        name: Swift.String? = nil,
        description: Swift.String? = nil,
        callbackId: Swift.String? = nil
    ) {
        self.type = type
        self.name = name
        self.description = description
        self.callbackId = callbackId
    }
}
