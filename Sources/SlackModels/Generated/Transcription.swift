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

/// - Remark: Generated from `#/components/schemas/Transcription`.
public struct Transcription: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Transcription/status`.
    public var status: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Transcription/locale`.
    public var locale: Swift.String?
    /// Creates a new `Transcription`.
    ///
    /// - Parameters:
    ///   - status:
    ///   - locale:
    public init(
        status: Swift.String? = nil,
        locale: Swift.String? = nil
    ) {
        self.status = status
        self.locale = locale
    }
}
