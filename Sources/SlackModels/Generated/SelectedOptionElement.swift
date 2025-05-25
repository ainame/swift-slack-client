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

/// - Remark: Generated from `#/components/schemas/SelectedOptionElement`.
public struct SelectedOptionElement: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SelectedOptionElement/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelectedOptionElement/value`.
    public var value: Swift.String?
    /// Creates a new `SelectedOptionElement`.
    ///
    /// - Parameters:
    ///   - text:
    ///   - value:
    public init(
        text: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.text = text
        self.value = value
    }
}
