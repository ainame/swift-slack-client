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

/// - Remark: Generated from `#/components/schemas/ID`.
@frozen public enum Id: String, Codable, Hashable, Sendable, CaseIterable {
    case b00000000 = "B00000000"
    case _empty_ = ""
}
