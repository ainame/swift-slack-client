@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Enterprise`.
public struct Enterprise: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Enterprise/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Enterprise/name`.
    public var name: Swift.String?
    /// Creates a new `Enterprise`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
    }
}
