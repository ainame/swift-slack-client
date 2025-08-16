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

/// - Remark: Generated from `#/components/schemas/AllowScFileUploads`.
public struct AllowScFileUploads: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/approval_type`.
    public var approvalType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/value`.
    public var value: Swift.Bool?
    /// Creates a new `AllowScFileUploads`.
    ///
    /// - Parameters:
    ///   - actor:
    ///   - approvalType:
    ///   - dateUpdate:
    ///   - source:
    ///   - value:
    public init(
        actor: Swift.String? = nil,
        approvalType: Swift.String? = nil,
        dateUpdate: Swift.Int? = nil,
        source: Swift.String? = nil,
        value: Swift.Bool? = nil,
    ) {
        self.actor = actor
        self.approvalType = approvalType
        self.dateUpdate = dateUpdate
        self.source = source
        self.value = value
    }

    public enum CodingKeys: String, CodingKey {
        case actor
        case approvalType = "approval_type"
        case dateUpdate = "date_update"
        case source
        case value
    }
}
