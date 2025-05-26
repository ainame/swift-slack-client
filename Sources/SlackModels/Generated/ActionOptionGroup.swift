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

/// - Remark: Generated from `#/components/schemas/ActionOptionGroup`.
public struct ActionOptionGroup: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ActionOptionGroup/options`.
    public var options: [SelectedOptionElement]?
    /// - Remark: Generated from `#/components/schemas/ActionOptionGroup/text`.
    public var text: Swift.String?
    /// Creates a new `ActionOptionGroup`.
    ///
    /// - Parameters:
    ///   - options:
    ///   - text:
    public init(
        options: [SelectedOptionElement]? = nil,
        text: Swift.String? = nil
    ) {
        self.options = options
        self.text = text
    }
}
