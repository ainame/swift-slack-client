#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/ActionOptionGroup`.
public struct ActionOptionGroup: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ActionOptionGroup/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActionOptionGroup/options`.
    public var options: [SlackModels.SelectedOptionElement]?
    /// Creates a new `ActionOptionGroup`.
    ///
    /// - Parameters:
    ///   - text:
    ///   - options:
    public init(
        text: Swift.String? = nil,
        options: [SlackModels.SelectedOptionElement]? = nil
    ) {
        self.text = text
        self.options = options
    }
}
