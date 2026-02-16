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

/// - Remark: Generated from `#/components/schemas/Profile`.
public struct Profile: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Profile/avatar_hash`.
    public var avatarHash: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_1024`.
    public var image1024: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_192`.
    public var image192: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_24`.
    public var image24: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_32`.
    public var image32: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_48`.
    public var image48: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_512`.
    public var image512: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_72`.
    public var image72: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image_original`.
    public var imageOriginal: Swift.String?
    /// Creates a new `Profile`.
    ///
    /// - Parameters:
    ///   - avatarHash:
    ///   - image1024:
    ///   - image192:
    ///   - image24:
    ///   - image32:
    ///   - image48:
    ///   - image512:
    ///   - image72:
    ///   - imageOriginal:
    public init(
        avatarHash: Swift.String? = nil,
        image1024: Swift.String? = nil,
        image192: Swift.String? = nil,
        image24: Swift.String? = nil,
        image32: Swift.String? = nil,
        image48: Swift.String? = nil,
        image512: Swift.String? = nil,
        image72: Swift.String? = nil,
        imageOriginal: Swift.String? = nil,
    ) {
        self.avatarHash = avatarHash
        self.image1024 = image1024
        self.image192 = image192
        self.image24 = image24
        self.image32 = image32
        self.image48 = image48
        self.image512 = image512
        self.image72 = image72
        self.imageOriginal = imageOriginal
    }

    public enum CodingKeys: String, CodingKey {
        case avatarHash = "avatar_hash"
        case image1024 = "image_1024"
        case image192 = "image_192"
        case image24 = "image_24"
        case image32 = "image_32"
        case image48 = "image_48"
        case image512 = "image_512"
        case image72 = "image_72"
        case imageOriginal = "image_original"
    }
}
