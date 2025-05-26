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
}
