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

/// - Remark: Generated from `#/components/schemas/PostingRestrictedTo`.
public struct PostingRestrictedTo: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/PostingRestrictedTo/type`.
    public var _type: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/PostingRestrictedTo/user`.
    public var user: [Swift.String]?
    /// Creates a new `PostingRestrictedTo`.
    ///
    /// - Parameters:
    ///   - _type:
    ///   - user:
    public init(
        _type: [Swift.String]? = nil,
        user: [Swift.String]? = nil
    ) {
        self._type = _type
        self.user = user
    }

    public enum CodingKeys: String, CodingKey {
        case _type = "type"
        case user
    }
}
