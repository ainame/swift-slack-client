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

/// - Remark: Generated from `#/components/schemas/Icon`.
public struct Icon: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Icon/image34`.
    public var image34: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image44`.
    public var image44: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image68`.
    public var image68: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image88`.
    public var image88: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image102`.
    public var image102: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image132`.
    public var image132: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image230`.
    public var image230: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/imageOriginal`.
    public var imageOriginal: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/imageDefault`.
    public var imageDefault: Swift.Bool?
    /// Creates a new `Icon`.
    ///
    /// - Parameters:
    ///   - image34:
    ///   - image44:
    ///   - image68:
    ///   - image88:
    ///   - image102:
    ///   - image132:
    ///   - image230:
    ///   - imageOriginal:
    ///   - imageDefault:
    public init(
        image34: Swift.String? = nil,
        image44: Swift.String? = nil,
        image68: Swift.String? = nil,
        image88: Swift.String? = nil,
        image102: Swift.String? = nil,
        image132: Swift.String? = nil,
        image230: Swift.String? = nil,
        imageOriginal: Swift.String? = nil,
        imageDefault: Swift.Bool? = nil
    ) {
        self.image34 = image34
        self.image44 = image44
        self.image68 = image68
        self.image88 = image88
        self.image102 = image102
        self.image132 = image132
        self.image230 = image230
        self.imageOriginal = imageOriginal
        self.imageDefault = imageDefault
    }
}
