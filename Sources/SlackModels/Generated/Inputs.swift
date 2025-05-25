#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Inputs`.
public typealias Inputs = OpenAPIRuntime.OpenAPIObjectContainer
