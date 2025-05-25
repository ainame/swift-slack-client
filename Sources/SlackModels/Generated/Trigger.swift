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

/// - Remark: Generated from `#/components/schemas/Trigger`.
public struct Trigger: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Trigger/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Trigger/customizableInputParameters`.
    public var customizableInputParameters: [SlackModels.CustomizableInputParameter]?
    /// Creates a new `Trigger`.
    ///
    /// - Parameters:
    ///   - url:
    ///   - customizableInputParameters:
    public init(
        url: Swift.String? = nil,
        customizableInputParameters: [SlackModels.CustomizableInputParameter]? = nil
    ) {
        self.url = url
        self.customizableInputParameters = customizableInputParameters
    }
}
