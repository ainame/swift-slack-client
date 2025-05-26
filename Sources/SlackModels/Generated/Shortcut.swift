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

/// - Remark: Generated from `#/components/schemas/Shortcut`.
public struct Shortcut: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Shortcut/callback_id`.
    public var callbackId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Shortcut/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Shortcut/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Shortcut/type`.
    public var _type: Swift.String
    /// Creates a new `Shortcut`.
    ///
    /// - Parameters:
    ///   - callbackId:
    ///   - description:
    ///   - name:
    ///   - _type:
    public init(
        callbackId: Swift.String? = nil,
        description: Swift.String? = nil,
        name: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.callbackId = callbackId
        self.description = description
        self.name = name
        self._type = _type
    }
    public enum CodingKeys: String, CodingKey {
        case callbackId = "callback_id"
        case description
        case name
        case _type = "type"
    }
}
