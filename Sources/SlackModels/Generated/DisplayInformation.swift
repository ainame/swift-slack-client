@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/DisplayInformation`.
public struct DisplayInformation: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/longDescription`.
    public var longDescription: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/backgroundColor`.
    public var backgroundColor: Swift.String?
    /// Creates a new `DisplayInformation`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - description:
    ///   - longDescription:
    ///   - backgroundColor:
    public init(
        name: Swift.String? = nil,
        description: Swift.String? = nil,
        longDescription: Swift.String? = nil,
        backgroundColor: Swift.String? = nil
    ) {
        self.name = name
        self.description = description
        self.longDescription = longDescription
        self.backgroundColor = backgroundColor
    }
}
