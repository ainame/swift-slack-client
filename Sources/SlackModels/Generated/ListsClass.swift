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

/// - Remark: Generated from `#/components/schemas/ListsClass`.
public struct ListsClass: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListsClass/totalCount`.
    public var totalCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListsClass/ownershipDetails`.
    public var ownershipDetails: [OwnershipDetail]?
    /// Creates a new `ListsClass`.
    ///
    /// - Parameters:
    ///   - totalCount:
    ///   - ownershipDetails:
    public init(
        totalCount: Swift.Int? = nil,
        ownershipDetails: [OwnershipDetail]? = nil
    ) {
        self.totalCount = totalCount
        self.ownershipDetails = ownershipDetails
    }
}
