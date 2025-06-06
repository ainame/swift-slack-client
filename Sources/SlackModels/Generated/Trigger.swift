@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/Trigger`.
public struct Trigger: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Trigger/customizable_input_parameters`.
    public var customizableInputParameters: [CustomizableInputParameter]?
    /// - Remark: Generated from `#/components/schemas/Trigger/url`.
    public var url: Swift.String?
    /// Creates a new `Trigger`.
    ///
    /// - Parameters:
    ///   - customizableInputParameters:
    ///   - url:
    public init(
        customizableInputParameters: [CustomizableInputParameter]? = nil,
        url: Swift.String? = nil
    ) {
        self.customizableInputParameters = customizableInputParameters
        self.url = url
    }

    public enum CodingKeys: String, CodingKey {
        case customizableInputParameters = "customizable_input_parameters"
        case url
    }
}
