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

/// - Remark: Generated from `#/components/schemas/Metadata`.
public struct Metadata: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Metadata/format`.
    public var format: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Metadata/extension`.
    public var _extension: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Metadata/rotation`.
    public var rotation: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb64`.
    public var thumb64: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb80`.
    public var thumb80: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb160`.
    public var thumb160: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Metadata/originalW`.
    public var originalW: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/originalH`.
    public var originalH: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb360W`.
    public var thumb360W: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumb360H`.
    public var thumb360H: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Metadata/thumbTiny`.
    public var thumbTiny: Swift.String?
    /// Creates a new `Metadata`.
    ///
    /// - Parameters:
    ///   - format:
    ///   - _extension:
    ///   - rotation:
    ///   - thumb64:
    ///   - thumb80:
    ///   - thumb160:
    ///   - originalW:
    ///   - originalH:
    ///   - thumb360W:
    ///   - thumb360H:
    ///   - thumbTiny:
    public init(
        format: Swift.String? = nil,
        _extension: Swift.String? = nil,
        rotation: Swift.Int? = nil,
        thumb64: Swift.Bool? = nil,
        thumb80: Swift.Bool? = nil,
        thumb160: Swift.Bool? = nil,
        originalW: Swift.Int? = nil,
        originalH: Swift.Int? = nil,
        thumb360W: Swift.Int? = nil,
        thumb360H: Swift.Int? = nil,
        thumbTiny: Swift.String? = nil
    ) {
        self.format = format
        self._extension = _extension
        self.rotation = rotation
        self.thumb64 = thumb64
        self.thumb80 = thumb80
        self.thumb160 = thumb160
        self.originalW = originalW
        self.originalH = originalH
        self.thumb360W = thumb360W
        self.thumb360H = thumb360H
        self.thumbTiny = thumbTiny
    }
}
