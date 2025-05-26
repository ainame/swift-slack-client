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

/// - Remark: Generated from `#/components/schemas/ActionConfirm`.
public struct ActionConfirm: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/dismiss_text`.
    public var dismissText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/ok_text`.
    public var okText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/title`.
    public var title: Swift.String?
    /// Creates a new `ActionConfirm`.
    ///
    /// - Parameters:
    ///   - dismissText:
    ///   - okText:
    ///   - text:
    ///   - title:
    public init(
        dismissText: Swift.String? = nil,
        okText: Swift.String? = nil,
        text: Swift.String? = nil,
        title: Swift.String? = nil
    ) {
        self.dismissText = dismissText
        self.okText = okText
        self.text = text
        self.title = title
    }
}
