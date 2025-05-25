@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/ListLimits`.
public struct ListLimits: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListLimits/overRowMaximum`.
    public var overRowMaximum: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListLimits/rowCountLimit`.
    public var rowCountLimit: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/rowCount`.
    public var rowCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/overColumnMaximum`.
    public var overColumnMaximum: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListLimits/columnCount`.
    public var columnCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/columnCountLimit`.
    public var columnCountLimit: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/overViewMaximum`.
    public var overViewMaximum: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListLimits/viewCount`.
    public var viewCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/viewCountLimit`.
    public var viewCountLimit: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/maxAttachmentsPerCell`.
    public var maxAttachmentsPerCell: Swift.Int?
    /// Creates a new `ListLimits`.
    ///
    /// - Parameters:
    ///   - overRowMaximum:
    ///   - rowCountLimit:
    ///   - rowCount:
    ///   - overColumnMaximum:
    ///   - columnCount:
    ///   - columnCountLimit:
    ///   - overViewMaximum:
    ///   - viewCount:
    ///   - viewCountLimit:
    ///   - maxAttachmentsPerCell:
    public init(
        overRowMaximum: Swift.Bool? = nil,
        rowCountLimit: Swift.Int? = nil,
        rowCount: Swift.Int? = nil,
        overColumnMaximum: Swift.Bool? = nil,
        columnCount: Swift.Int? = nil,
        columnCountLimit: Swift.Int? = nil,
        overViewMaximum: Swift.Bool? = nil,
        viewCount: Swift.Int? = nil,
        viewCountLimit: Swift.Int? = nil,
        maxAttachmentsPerCell: Swift.Int? = nil
    ) {
        self.overRowMaximum = overRowMaximum
        self.rowCountLimit = rowCountLimit
        self.rowCount = rowCount
        self.overColumnMaximum = overColumnMaximum
        self.columnCount = columnCount
        self.columnCountLimit = columnCountLimit
        self.overViewMaximum = overViewMaximum
        self.viewCount = viewCount
        self.viewCountLimit = viewCountLimit
        self.maxAttachmentsPerCell = maxAttachmentsPerCell
    }
}
