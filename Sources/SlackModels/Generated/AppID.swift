#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/AppID`.
@frozen public enum AppID: String, Codable, Hashable, Sendable, CaseIterable {
    case a00000000 = "A00000000"
    case _empty_ = ""
}
