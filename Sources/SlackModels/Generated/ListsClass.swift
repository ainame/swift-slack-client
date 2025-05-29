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

/// - Remark: Generated from `#/components/schemas/ListsClass`.
public struct ListsClass: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListsClass/ownership_details`.
    public var ownershipDetails: [OwnershipDetail]?
    /// - Remark: Generated from `#/components/schemas/ListsClass/total_count`.
    public var totalCount: Swift.Int?
    /// Creates a new `ListsClass`.
    ///
    /// - Parameters:
    ///   - ownershipDetails:
    ///   - totalCount:
    public init(
        ownershipDetails: [OwnershipDetail]? = nil,
        totalCount: Swift.Int? = nil
    ) {
        self.ownershipDetails = ownershipDetails
        self.totalCount = totalCount
    }

    public enum CodingKeys: String, CodingKey {
        case ownershipDetails = "ownership_details"
        case totalCount = "total_count"
    }
}
