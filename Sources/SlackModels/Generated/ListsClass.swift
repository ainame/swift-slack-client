#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/ListsClass`.
public struct ListsClass: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListsClass/totalCount`.
    public var totalCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListsClass/ownershipDetails`.
    public var ownershipDetails: [SlackModels.OwnershipDetail]?
    /// Creates a new `ListsClass`.
    ///
    /// - Parameters:
    ///   - totalCount:
    ///   - ownershipDetails:
    public init(
        totalCount: Swift.Int? = nil,
        ownershipDetails: [SlackModels.OwnershipDetail]? = nil
    ) {
        self.totalCount = totalCount
        self.ownershipDetails = ownershipDetails
    }
}
