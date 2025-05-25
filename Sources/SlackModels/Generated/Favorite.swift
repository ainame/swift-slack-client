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

/// - Remark: Generated from `#/components/schemas/Favorite`.
public struct Favorite: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Favorite/position`.
    public var position: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Favorite/collectionId`.
    public var collectionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Favorite/collectionName`.
    public var collectionName: Swift.String?
    /// Creates a new `Favorite`.
    ///
    /// - Parameters:
    ///   - position:
    ///   - collectionId:
    ///   - collectionName:
    public init(
        position: Swift.String? = nil,
        collectionId: Swift.String? = nil,
        collectionName: Swift.String? = nil
    ) {
        self.position = position
        self.collectionId = collectionId
        self.collectionName = collectionName
    }
}
