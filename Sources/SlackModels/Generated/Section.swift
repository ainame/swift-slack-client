@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Section`.
public struct Section: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Section/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/order`.
    public var order: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Section/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/sectionType`.
    public var sectionType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Section/isHidden`.
    public var isHidden: Swift.Bool?
    /// Creates a new `Section`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - label:
    ///   - order:
    ///   - teamId:
    ///   - sectionType:
    ///   - isHidden:
    public init(
        id: Swift.String? = nil,
        label: Swift.String? = nil,
        order: Swift.Int? = nil,
        teamId: Swift.String? = nil,
        sectionType: Swift.String? = nil,
        isHidden: Swift.Bool? = nil
    ) {
        self.id = id
        self.label = label
        self.order = order
        self.teamId = teamId
        self.sectionType = sectionType
        self.isHidden = isHidden
    }
}
