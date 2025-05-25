#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/ID`.
@frozen public enum Id: String, Codable, Hashable, Sendable, CaseIterable {
    case b00000000 = "B00000000"
    case _empty_ = ""
}
