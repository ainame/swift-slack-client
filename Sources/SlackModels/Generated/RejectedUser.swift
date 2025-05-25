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

/// - Remark: Generated from `#/components/schemas/RejectedUser`.
public struct RejectedUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/RejectedUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RejectedUser/error`.
    public var error: Swift.String?
    /// Creates a new `RejectedUser`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - error:
    public init(
        id: Swift.String? = nil,
        error: Swift.String? = nil
    ) {
        self.id = id
        self.error = error
    }
}
