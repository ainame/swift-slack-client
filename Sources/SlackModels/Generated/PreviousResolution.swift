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

/// - Remark: Generated from `#/components/schemas/PreviousResolution`.
public struct PreviousResolution: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/PreviousResolution/scopes`.
    public var scopes: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// - Remark: Generated from `#/components/schemas/PreviousResolution/status`.
    public var status: Swift.String?
    /// Creates a new `PreviousResolution`.
    ///
    /// - Parameters:
    ///   - scopes:
    ///   - status:
    public init(
        scopes: [OpenAPIRuntime.OpenAPIValueContainer]? = nil,
        status: Swift.String? = nil
    ) {
        self.scopes = scopes
        self.status = status
    }

    public enum CodingKeys: String, CodingKey {
        case scopes
        case status
    }
}
