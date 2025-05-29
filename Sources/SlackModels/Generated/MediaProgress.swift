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

/// - Remark: Generated from `#/components/schemas/MediaProgress`.
public struct MediaProgress: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/MediaProgress/duration_ms`.
    public var durationMs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/MediaProgress/max_offset_ms`.
    public var maxOffsetMs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/MediaProgress/offset_ms`.
    public var offsetMs: Swift.Int?
    /// Creates a new `MediaProgress`.
    ///
    /// - Parameters:
    ///   - durationMs:
    ///   - maxOffsetMs:
    ///   - offsetMs:
    public init(
        durationMs: Swift.Int? = nil,
        maxOffsetMs: Swift.Int? = nil,
        offsetMs: Swift.Int? = nil
    ) {
        self.durationMs = durationMs
        self.maxOffsetMs = maxOffsetMs
        self.offsetMs = offsetMs
    }

    public enum CodingKeys: String, CodingKey {
        case durationMs = "duration_ms"
        case maxOffsetMs = "max_offset_ms"
        case offsetMs = "offset_ms"
    }
}
