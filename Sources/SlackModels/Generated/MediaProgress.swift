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

/// - Remark: Generated from `#/components/schemas/MediaProgress`.
public struct MediaProgress: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/MediaProgress/offsetMs`.
    public var offsetMs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/MediaProgress/maxOffsetMs`.
    public var maxOffsetMs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/MediaProgress/durationMs`.
    public var durationMs: Swift.Int?
    /// Creates a new `MediaProgress`.
    ///
    /// - Parameters:
    ///   - offsetMs:
    ///   - maxOffsetMs:
    ///   - durationMs:
    public init(
        offsetMs: Swift.Int? = nil,
        maxOffsetMs: Swift.Int? = nil,
        durationMs: Swift.Int? = nil
    ) {
        self.offsetMs = offsetMs
        self.maxOffsetMs = maxOffsetMs
        self.durationMs = durationMs
    }
}
