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

/// - Remark: Generated from `#/components/schemas/Section`.
public struct Section: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Section/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/is_hidden`.
    public var isHidden: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Section/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/order`.
    public var order: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Section/section_type`.
    public var sectionType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/team_id`.
    public var teamId: Swift.String?
    /// Creates a new `Section`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - isHidden:
    ///   - label:
    ///   - order:
    ///   - sectionType:
    ///   - teamId:
    public init(
        id: Swift.String? = nil,
        isHidden: Swift.Bool? = nil,
        label: Swift.String? = nil,
        order: Swift.Int? = nil,
        sectionType: Swift.String? = nil,
        teamId: Swift.String? = nil
    ) {
        self.id = id
        self.isHidden = isHidden
        self.label = label
        self.order = order
        self.sectionType = sectionType
        self.teamId = teamId
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case isHidden = "is_hidden"
        case label
        case order
        case sectionType = "section_type"
        case teamId = "team_id"
    }
}
