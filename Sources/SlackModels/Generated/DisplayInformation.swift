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

/// - Remark: Generated from `#/components/schemas/DisplayInformation`.
public struct DisplayInformation: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/background_color`.
    public var backgroundColor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/long_description`.
    public var longDescription: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DisplayInformation/name`.
    public var name: Swift.String?
    /// Creates a new `DisplayInformation`.
    ///
    /// - Parameters:
    ///   - backgroundColor:
    ///   - description:
    ///   - longDescription:
    ///   - name:
    public init(
        backgroundColor: Swift.String? = nil,
        description: Swift.String? = nil,
        longDescription: Swift.String? = nil,
        name: Swift.String? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.description = description
        self.longDescription = longDescription
        self.name = name
    }

    public enum CodingKeys: String, CodingKey {
        case backgroundColor = "background_color"
        case description
        case longDescription = "long_description"
        case name
    }
}
