@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/AllowScFileUploads`.
public struct AllowScFileUploads: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/value`.
    public var value: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/AllowScFileUploads/approvalType`.
    public var approvalType: Swift.String?
    /// Creates a new `AllowScFileUploads`.
    ///
    /// - Parameters:
    ///   - value:
    ///   - actor:
    ///   - source:
    ///   - type:
    ///   - dateUpdate:
    ///   - approvalType:
    public init(
        value: Swift.Bool? = nil,
        actor: Swift.String? = nil,
        source: Swift.String? = nil,
        type: Swift.String? = nil,
        dateUpdate: Swift.Int? = nil,
        approvalType: Swift.String? = nil
    ) {
        self.value = value
        self.actor = actor
        self.source = source
        self.type = type
        self.dateUpdate = dateUpdate
        self.approvalType = approvalType
    }
}
