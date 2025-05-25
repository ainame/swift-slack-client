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

/// - Remark: Generated from `#/components/schemas/AppID`.
@frozen public enum AppID: String, Codable, Hashable, Sendable, CaseIterable {
    case a00000000 = "A00000000"
    case _empty_ = ""
}
