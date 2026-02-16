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

/// - Remark: Generated from `#/components/schemas/Record`.
public struct Record: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Record/created_by`.
    public var createdBy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Record/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Record/fields`.
    public var fields: [Field]?
    /// - Remark: Generated from `#/components/schemas/Record/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Record/is_subscribed`.
    public var isSubscribed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Record/list_id`.
    public var listId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Record/updated_by`.
    public var updatedBy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Record/updated_timestamp`.
    public var updatedTimestamp: Swift.String?
    /// Creates a new `Record`.
    ///
    /// - Parameters:
    ///   - createdBy:
    ///   - dateCreated:
    ///   - fields:
    ///   - id:
    ///   - isSubscribed:
    ///   - listId:
    ///   - updatedBy:
    ///   - updatedTimestamp:
    public init(
        createdBy: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        fields: [Field]? = nil,
        id: Swift.String? = nil,
        isSubscribed: Swift.Bool? = nil,
        listId: Swift.String? = nil,
        updatedBy: Swift.String? = nil,
        updatedTimestamp: Swift.String? = nil,
    ) {
        self.createdBy = createdBy
        self.dateCreated = dateCreated
        self.fields = fields
        self.id = id
        self.isSubscribed = isSubscribed
        self.listId = listId
        self.updatedBy = updatedBy
        self.updatedTimestamp = updatedTimestamp
    }

    public enum CodingKeys: String, CodingKey {
        case createdBy = "created_by"
        case dateCreated = "date_created"
        case fields
        case id
        case isSubscribed = "is_subscribed"
        case listId = "list_id"
        case updatedBy = "updated_by"
        case updatedTimestamp = "updated_timestamp"
    }
}
