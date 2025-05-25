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

/// - Remark: Generated from `#/components/schemas/Manifest`.
public struct Manifest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Manifest/settings`.
    public var settings: SlackModels.Settings?
    /// - Remark: Generated from `#/components/schemas/Manifest/features`.
    public var features: SlackModels.Features?
    /// - Remark: Generated from `#/components/schemas/Manifest/functions`.
    public var functions: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Manifest/Metadata`.
    public var metadata: SlackModels.Metadata?
    /// - Remark: Generated from `#/components/schemas/Manifest/displayInformation`.
    public var displayInformation: SlackModels.DisplayInformation?
    /// - Remark: Generated from `#/components/schemas/Manifest/oauthConfig`.
    public var oauthConfig: SlackModels.OauthConfig?
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
        settings: SlackModels.Settings? = nil,
        features: SlackModels.Features? = nil,
        functions: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        metadata: SlackModels.Metadata? = nil,
        displayInformation: SlackModels.DisplayInformation? = nil,
        oauthConfig: SlackModels.OauthConfig? = nil
    ) {
        self.settings = settings
        self.features = features
        self.functions = functions
        self.metadata = metadata
        self.displayInformation = displayInformation
        self.oauthConfig = oauthConfig
    }
}
