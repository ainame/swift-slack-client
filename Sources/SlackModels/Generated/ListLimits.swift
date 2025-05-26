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

/// - Remark: Generated from `#/components/schemas/ListLimits`.
public struct ListLimits: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListLimits/column_count`.
    public var columnCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/column_count_limit`.
    public var columnCountLimit: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/max_attachments_per_cell`.
    public var maxAttachmentsPerCell: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/over_column_maximum`.
    public var overColumnMaximum: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListLimits/over_row_maximum`.
    public var overRowMaximum: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListLimits/over_view_maximum`.
    public var overViewMaximum: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListLimits/row_count`.
    public var rowCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/row_count_limit`.
    public var rowCountLimit: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/view_count`.
    public var viewCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ListLimits/view_count_limit`.
    public var viewCountLimit: Swift.Int?
    /// Creates a new `ListLimits`.
    ///
    /// - Parameters:
    ///   - columnCount:
    ///   - columnCountLimit:
    ///   - maxAttachmentsPerCell:
    ///   - overColumnMaximum:
    ///   - overRowMaximum:
    ///   - overViewMaximum:
    ///   - rowCount:
    ///   - rowCountLimit:
    ///   - viewCount:
    ///   - viewCountLimit:
    public init(
        columnCount: Swift.Int? = nil,
        columnCountLimit: Swift.Int? = nil,
        maxAttachmentsPerCell: Swift.Int? = nil,
        overColumnMaximum: Swift.Bool? = nil,
        overRowMaximum: Swift.Bool? = nil,
        overViewMaximum: Swift.Bool? = nil,
        rowCount: Swift.Int? = nil,
        rowCountLimit: Swift.Int? = nil,
        viewCount: Swift.Int? = nil,
        viewCountLimit: Swift.Int? = nil
    ) {
        self.columnCount = columnCount
        self.columnCountLimit = columnCountLimit
        self.maxAttachmentsPerCell = maxAttachmentsPerCell
        self.overColumnMaximum = overColumnMaximum
        self.overRowMaximum = overRowMaximum
        self.overViewMaximum = overViewMaximum
        self.rowCount = rowCount
        self.rowCountLimit = rowCountLimit
        self.viewCount = viewCount
        self.viewCountLimit = viewCountLimit
    }
    public enum CodingKeys: String, CodingKey {
        case columnCount = "column_count"
        case columnCountLimit = "column_count_limit"
        case maxAttachmentsPerCell = "max_attachments_per_cell"
        case overColumnMaximum = "over_column_maximum"
        case overRowMaximum = "over_row_maximum"
        case overViewMaximum = "over_view_maximum"
        case rowCount = "row_count"
        case rowCountLimit = "row_count_limit"
        case viewCount = "view_count"
        case viewCountLimit = "view_count_limit"
    }
}
