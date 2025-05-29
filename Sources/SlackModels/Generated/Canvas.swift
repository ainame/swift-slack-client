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

/// - Remark: Generated from `#/components/schemas/Canvas`.
public struct Canvas: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Canvas/file_id`.
    public var fileId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Canvas/is_empty`.
    public var isEmpty: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Canvas/is_migrated`.
    public var isMigrated: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Canvas/quip_thread_id`.
    public var quipThreadId: Swift.String?
    /// Creates a new `Canvas`.
    ///
    /// - Parameters:
    ///   - fileId:
    ///   - isEmpty:
    ///   - isMigrated:
    ///   - quipThreadId:
    public init(
        fileId: Swift.String? = nil,
        isEmpty: Swift.Bool? = nil,
        isMigrated: Swift.Bool? = nil,
        quipThreadId: Swift.String? = nil
    ) {
        self.fileId = fileId
        self.isEmpty = isEmpty
        self.isMigrated = isMigrated
        self.quipThreadId = quipThreadId
    }

    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case isEmpty = "is_empty"
        case isMigrated = "is_migrated"
        case quipThreadId = "quip_thread_id"
    }
}
