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
        status: Swift.String? = nil,
    ) {
        self.locale = locale
        self.status = status
    }

    public enum CodingKeys: String, CodingKey {
        case locale
        case status
    }
}
