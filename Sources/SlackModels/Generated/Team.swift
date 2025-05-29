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

/// - Remark: Generated from `#/components/schemas/Team`.
public struct Team: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Team/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Team/name`.
    public var name: Swift.String?
    /// Creates a new `Team`.
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

    public enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
