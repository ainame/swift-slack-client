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

/// - Remark: Generated from `#/components/schemas/Canvas`.
public struct Canvas: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Canvas/fileId`.
    public var fileId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Canvas/isEmpty`.
    public var isEmpty: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Canvas/quipThreadId`.
    public var quipThreadId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Canvas/isMigrated`.
    public var isMigrated: Swift.Bool?
    /// Creates a new `Canvas`.
    ///
    /// - Parameters:
    ///   - fileId:
    ///   - isEmpty:
    ///   - quipThreadId:
    ///   - isMigrated:
    public init(
        fileId: Swift.String? = nil,
        isEmpty: Swift.Bool? = nil,
        quipThreadId: Swift.String? = nil,
        isMigrated: Swift.Bool? = nil
    ) {
        self.fileId = fileId
        self.isEmpty = isEmpty
        self.quipThreadId = quipThreadId
        self.isMigrated = isMigrated
    }
}
