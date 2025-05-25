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

/// - Remark: Generated from `#/components/schemas/Tab`.
public struct Tab: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Tab/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/data`.
    public var data: Data?
    /// - Remark: Generated from `#/components/schemas/Tab/isDisabled`.
    public var isDisabled: Swift.Bool?
    /// Creates a new `Tab`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - label:
    ///   - type:
    ///   - data:
    ///   - isDisabled:
    public init(
        id: Swift.String? = nil,
        label: Swift.String? = nil,
        type: Swift.String? = nil,
        data: Data? = nil,
        isDisabled: Swift.Bool? = nil
    ) {
        self.id = id
        self.label = label
        self.type = type
        self.data = data
        self.isDisabled = isDisabled
    }
}
