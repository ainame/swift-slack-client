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

/// - Remark: Generated from `#/components/schemas/Trigger`.
public struct Trigger: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Trigger/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Trigger/customizableInputParameters`.
    public var customizableInputParameters: [CustomizableInputParameter]?
    /// Creates a new `Trigger`.
    ///
    /// - Parameters:
    ///   - url:
    ///   - customizableInputParameters:
    public init(
        url: Swift.String? = nil,
        customizableInputParameters: [CustomizableInputParameter]? = nil
    ) {
        self.url = url
        self.customizableInputParameters = customizableInputParameters
    }
}
