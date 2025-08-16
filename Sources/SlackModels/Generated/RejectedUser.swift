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

/// - Remark: Generated from `#/components/schemas/RejectedUser`.
public struct RejectedUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/RejectedUser/error`.
    public var error: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RejectedUser/id`.
    public var id: Swift.String?
    /// Creates a new `RejectedUser`.
    ///
    /// - Parameters:
    ///   - error:
    ///   - id:
    public init(
        error: Swift.String? = nil,
        id: Swift.String? = nil,
    ) {
        self.error = error
        self.id = id
    }

    public enum CodingKeys: String, CodingKey {
        case error
        case id
    }
}
