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
    /// - Remark: Generated from `#/components/schemas/Transcription/locale`.
    public var locale: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Transcription/status`.
    public var status: Swift.String?
    /// Creates a new `Transcription`.
    ///
    /// - Parameters:
    ///   - locale:
    ///   - status:
    public init(
        locale: Swift.String? = nil,
        status: Swift.String? = nil
    ) {
        self.locale = locale
        self.status = status
    }
}
