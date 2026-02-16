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

/// - Remark: Generated from `#/components/schemas/Manifest`.
public struct Manifest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Manifest/_metadata`.
    public var _metadata: Metadata?
    /// - Remark: Generated from `#/components/schemas/Manifest/display_information`.
    public var displayInformation: DisplayInformation?
    /// - Remark: Generated from `#/components/schemas/Manifest/features`.
    public var features: Features?
    /// - Remark: Generated from `#/components/schemas/Manifest/functions`.
    public var functions: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Manifest/oauth_config`.
    public var oauthConfig: OauthConfig?
    /// - Remark: Generated from `#/components/schemas/Manifest/settings`.
    public var settings: Settings?
    /// Creates a new `Manifest`.
    ///
    /// - Parameters:
    ///   - _metadata:
    ///   - displayInformation:
    ///   - features:
    ///   - functions:
    ///   - oauthConfig:
    ///   - settings:
    public init(
        _metadata: Metadata? = nil,
        displayInformation: DisplayInformation? = nil,
        features: Features? = nil,
        functions: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        oauthConfig: OauthConfig? = nil,
        settings: Settings? = nil,
    ) {
        self._metadata = _metadata
        self.displayInformation = displayInformation
        self.features = features
        self.functions = functions
        self.oauthConfig = oauthConfig
        self.settings = settings
    }

    public enum CodingKeys: String, CodingKey {
        case _metadata
        case displayInformation = "display_information"
        case features
        case functions
        case oauthConfig = "oauth_config"
        case settings
    }
}
