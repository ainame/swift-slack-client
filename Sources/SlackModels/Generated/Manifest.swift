@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Manifest`.
public struct Manifest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Manifest/settings`.
    public var settings: Settings?
    /// - Remark: Generated from `#/components/schemas/Manifest/features`.
    public var features: Features?
    /// - Remark: Generated from `#/components/schemas/Manifest/functions`.
    public var functions: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Manifest/Metadata`.
    public var metadata: Metadata?
    /// - Remark: Generated from `#/components/schemas/Manifest/displayInformation`.
    public var displayInformation: DisplayInformation?
    /// - Remark: Generated from `#/components/schemas/Manifest/oauthConfig`.
    public var oauthConfig: OauthConfig?
    /// Creates a new `Manifest`.
    ///
    /// - Parameters:
    ///   - settings:
    ///   - features:
    ///   - functions:
    ///   - metadata:
    ///   - displayInformation:
    ///   - oauthConfig:
    public init(
        settings: Settings? = nil,
        features: Features? = nil,
        functions: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        metadata: Metadata? = nil,
        displayInformation: DisplayInformation? = nil,
        oauthConfig: OauthConfig? = nil
    ) {
        self.settings = settings
        self.features = features
        self.functions = functions
        self.metadata = metadata
        self.displayInformation = displayInformation
        self.oauthConfig = oauthConfig
    }
}
