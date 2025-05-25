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

/// - Remark: Generated from `#/components/schemas/PreviousResolution`.
public struct PreviousResolution: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/PreviousResolution/status`.
    public var status: Swift.String?
    /// - Remark: Generated from `#/components/schemas/PreviousResolution/scopes`.
    public var scopes: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// Creates a new `PreviousResolution`.
    ///
    /// - Parameters:
    ///   - status:
    ///   - scopes:
    public init(
        status: Swift.String? = nil,
        scopes: [OpenAPIRuntime.OpenAPIValueContainer]? = nil
    ) {
        self.status = status
        self.scopes = scopes
    }
}
