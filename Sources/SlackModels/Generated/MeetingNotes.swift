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

/// - Remark: Generated from `#/components/schemas/MeetingNotes`.
public struct MeetingNotes: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/MeetingNotes/file_id`.
    public var fileId: Swift.String?
    /// Creates a new `MeetingNotes`.
    ///
    /// - Parameters:
    ///   - fileId:
    public init(fileId: Swift.String? = nil) {
        self.fileId = fileId
    }

    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
    }
}
