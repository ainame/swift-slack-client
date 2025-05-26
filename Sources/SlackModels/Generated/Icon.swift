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

/// - Remark: Generated from `#/components/schemas/Icon`.
public struct Icon: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Icon/image_102`.
    public var image102: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_132`.
    public var image132: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_230`.
    public var image230: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_34`.
    public var image34: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_44`.
    public var image44: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_68`.
    public var image68: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_88`.
    public var image88: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icon/image_default`.
    public var imageDefault: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Icon/image_original`.
    public var imageOriginal: Swift.String?
    /// Creates a new `Icon`.
    ///
    /// - Parameters:
    ///   - image102:
    ///   - image132:
    ///   - image230:
    ///   - image34:
    ///   - image44:
    ///   - image68:
    ///   - image88:
    ///   - imageDefault:
    ///   - imageOriginal:
    public init(
        image102: Swift.String? = nil,
        image132: Swift.String? = nil,
        image230: Swift.String? = nil,
        image34: Swift.String? = nil,
        image44: Swift.String? = nil,
        image68: Swift.String? = nil,
        image88: Swift.String? = nil,
        imageDefault: Swift.Bool? = nil,
        imageOriginal: Swift.String? = nil
    ) {
        self.image102 = image102
        self.image132 = image132
        self.image230 = image230
        self.image34 = image34
        self.image44 = image44
        self.image68 = image68
        self.image88 = image88
        self.imageDefault = imageDefault
        self.imageOriginal = imageOriginal
    }
}
