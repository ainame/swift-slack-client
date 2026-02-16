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

/// - Remark: Generated from `#/components/schemas/ThreadsRestrictedTo`.
public struct ThreadsRestrictedTo: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ThreadsRestrictedTo/type`.
    public var _type: [Swift.String]?
    /// Creates a new `ThreadsRestrictedTo`.
    ///
    /// - Parameters:
    ///   - _type:
    public init(_type: [Swift.String]? = nil) {
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case _type = "type"
    }
}
