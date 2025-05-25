#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/ActionConfirm`.
public struct ActionConfirm: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/okText`.
    public var okText: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionConfirm/dismissText`.
    public var dismissText: Swift.String?
    /// Creates a new `ActionConfirm`.
    ///
    /// - Parameters:
    ///   - title:
    ///   - text:
    ///   - okText:
    ///   - dismissText:
    public init(
        title: Swift.String? = nil,
        text: Swift.String? = nil,
        okText: Swift.String? = nil,
        dismissText: Swift.String? = nil
    ) {
        self.title = title
        self.text = text
        self.okText = okText
        self.dismissText = dismissText
    }
}
