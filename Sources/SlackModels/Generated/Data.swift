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

/// - Remark: Generated from `#/components/schemas/Data`.
public struct Data: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Data/file_id`.
    public var fileId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Data/shared_ts`.
    public var sharedTs: Swift.String?
    /// Creates a new `Data`.
    ///
    /// - Parameters:
    ///   - fileId:
    ///   - sharedTs:
    public init(
        fileId: Swift.String? = nil,
        sharedTs: Swift.String? = nil
    ) {
        self.fileId = fileId
        self.sharedTs = sharedTs
    }
}
