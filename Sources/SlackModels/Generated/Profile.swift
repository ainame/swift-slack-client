#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/Profile`.
public struct Profile: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Profile/image24`.
    public var image24: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image32`.
    public var image32: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image48`.
    public var image48: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image72`.
    public var image72: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image192`.
    public var image192: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image512`.
    public var image512: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/image1024`.
    public var image1024: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/imageOriginal`.
    public var imageOriginal: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Profile/avatarHash`.
    public var avatarHash: Swift.String?
    /// Creates a new `Profile`.
    ///
    /// - Parameters:
    ///   - image24:
    ///   - image32:
    ///   - image48:
    ///   - image72:
    ///   - image192:
    ///   - image512:
    ///   - image1024:
    ///   - imageOriginal:
    ///   - avatarHash:
    public init(
        image24: Swift.String? = nil,
        image32: Swift.String? = nil,
        image48: Swift.String? = nil,
        image72: Swift.String? = nil,
        image192: Swift.String? = nil,
        image512: Swift.String? = nil,
        image1024: Swift.String? = nil,
        imageOriginal: Swift.String? = nil,
        avatarHash: Swift.String? = nil
    ) {
        self.image24 = image24
        self.image32 = image32
        self.image48 = image48
        self.image72 = image72
        self.image192 = image192
        self.image512 = image512
        self.image1024 = image1024
        self.imageOriginal = imageOriginal
        self.avatarHash = avatarHash
    }
}
