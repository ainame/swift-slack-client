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

/// - Remark: Generated from `#/components/schemas/Metadata`.
public struct Metadata: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Metadata/extension`.
    public var _extension: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Metadata/format`.
    public var format: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Metadata/original_h`.
    public var originalH: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/original_w`.
    public var originalW: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/rotation`.
    public var rotation: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb_160`.
    public var thumb160: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb_360_h`.
    public var thumb360H: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb_360_w`.
    public var thumb360W: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb_64`.
    public var thumb64: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb_80`.
    public var thumb80: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb_tiny`.
    public var thumbTiny: Swift.String?
    /// Creates a new `Metadata`.
    ///
    /// - Parameters:
    ///   - _extension:
    ///   - format:
    ///   - originalH:
    ///   - originalW:
    ///   - rotation:
    ///   - thumb160:
    ///   - thumb360H:
    ///   - thumb360W:
    ///   - thumb64:
    ///   - thumb80:
    ///   - thumbTiny:
    public init(
        _extension: Swift.String? = nil,
        format: Swift.String? = nil,
        originalH: Swift.Int? = nil,
        originalW: Swift.Int? = nil,
        rotation: Swift.Int? = nil,
        thumb160: Swift.Bool? = nil,
        thumb360H: Swift.Int? = nil,
        thumb360W: Swift.Int? = nil,
        thumb64: Swift.Bool? = nil,
        thumb80: Swift.Bool? = nil,
        thumbTiny: Swift.String? = nil
    ) {
        self._extension = _extension
        self.format = format
        self.originalH = originalH
        self.originalW = originalW
        self.rotation = rotation
        self.thumb160 = thumb160
        self.thumb360H = thumb360H
        self.thumb360W = thumb360W
        self.thumb64 = thumb64
        self.thumb80 = thumb80
        self.thumbTiny = thumbTiny
    }
    public enum CodingKeys: String, CodingKey {
        case _extension = "extension"
        case format
        case originalH = "original_h"
        case originalW = "original_w"
        case rotation
        case thumb160 = "thumb_160"
        case thumb360H = "thumb_360_h"
        case thumb360W = "thumb_360_w"
        case thumb64 = "thumb_64"
        case thumb80 = "thumb_80"
        case thumbTiny = "thumb_tiny"
    }
}
