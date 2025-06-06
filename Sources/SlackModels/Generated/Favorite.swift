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

/// - Remark: Generated from `#/components/schemas/Favorite`.
public struct Favorite: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Favorite/collection_id`.
    public var collectionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Favorite/collection_name`.
    public var collectionName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Favorite/position`.
    public var position: Swift.String?
    /// Creates a new `Favorite`.
    ///
    /// - Parameters:
    ///   - collectionId:
    ///   - collectionName:
    ///   - position:
    public init(
        collectionId: Swift.String? = nil,
        collectionName: Swift.String? = nil,
        position: Swift.String? = nil
    ) {
        self.collectionId = collectionId
        self.collectionName = collectionName
        self.position = position
    }

    public enum CodingKeys: String, CodingKey {
        case collectionId = "collection_id"
        case collectionName = "collection_name"
        case position
    }
}
