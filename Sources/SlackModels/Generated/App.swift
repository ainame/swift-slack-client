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

/// - Remark: Generated from `#/components/schemas/App`.
public struct App: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/App/additional_info`.
    public var additionalInfo: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/app_directory_url`.
    public var appDirectoryUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/app_homepage_url`.
    public var appHomepageUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/help_url`.
    public var helpUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/icons`.
    public var icons: Icons?
    /// - Remark: Generated from `#/components/schemas/App/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/is_app_directory_approved`.
    public var isAppDirectoryApproved: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/App/is_granular_bot_app`.
    public var isGranularBotApp: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/App/is_internal`.
    public var isInternal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/App/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/privacy_policy_url`.
    public var privacyPolicyUrl: Swift.String?
    /// Creates a new `App`.
    ///
    /// - Parameters:
    ///   - additionalInfo:
    ///   - appDirectoryUrl:
    ///   - appHomepageUrl:
    ///   - description:
    ///   - helpUrl:
    ///   - icons:
    ///   - id:
    ///   - isAppDirectoryApproved:
    ///   - isGranularBotApp:
    ///   - isInternal:
    ///   - name:
    ///   - privacyPolicyUrl:
    public init(
        additionalInfo: Swift.String? = nil,
        appDirectoryUrl: Swift.String? = nil,
        appHomepageUrl: Swift.String? = nil,
        description: Swift.String? = nil,
        helpUrl: Swift.String? = nil,
        icons: Icons? = nil,
        id: Swift.String? = nil,
        isAppDirectoryApproved: Swift.Bool? = nil,
        isGranularBotApp: Swift.Bool? = nil,
        isInternal: Swift.Bool? = nil,
        name: Swift.String? = nil,
        privacyPolicyUrl: Swift.String? = nil
    ) {
        self.additionalInfo = additionalInfo
        self.appDirectoryUrl = appDirectoryUrl
        self.appHomepageUrl = appHomepageUrl
        self.description = description
        self.helpUrl = helpUrl
        self.icons = icons
        self.id = id
        self.isAppDirectoryApproved = isAppDirectoryApproved
        self.isGranularBotApp = isGranularBotApp
        self.isInternal = isInternal
        self.name = name
        self.privacyPolicyUrl = privacyPolicyUrl
    }

    public enum CodingKeys: String, CodingKey {
        case additionalInfo = "additional_info"
        case appDirectoryUrl = "app_directory_url"
        case appHomepageUrl = "app_homepage_url"
        case description
        case helpUrl = "help_url"
        case icons
        case id
        case isAppDirectoryApproved = "is_app_directory_approved"
        case isGranularBotApp = "is_granular_bot_app"
        case isInternal = "is_internal"
        case name
        case privacyPolicyUrl = "privacy_policy_url"
    }
}
