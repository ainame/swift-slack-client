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

/// - Remark: Generated from `#/components/schemas/App`.
public struct App: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/App/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/icons`.
    public var icons: SlackModels.Icons?
    /// - Remark: Generated from `#/components/schemas/App/helpUrl`.
    public var helpUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/privacyPolicyUrl`.
    public var privacyPolicyUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/appHomepageUrl`.
    public var appHomepageUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/appDirectoryUrl`.
    public var appDirectoryUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/App/isAppDirectoryApproved`.
    public var isAppDirectoryApproved: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/App/isInternal`.
    public var isInternal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/App/isGranularBotApp`.
    public var isGranularBotApp: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/App/additionalInfo`.
    public var additionalInfo: Swift.String?
    /// Creates a new `App`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - description:
    ///   - icons:
    ///   - helpUrl:
    ///   - privacyPolicyUrl:
    ///   - appHomepageUrl:
    ///   - appDirectoryUrl:
    ///   - isAppDirectoryApproved:
    ///   - isInternal:
    ///   - isGranularBotApp:
    ///   - additionalInfo:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        description: Swift.String? = nil,
        icons: SlackModels.Icons? = nil,
        helpUrl: Swift.String? = nil,
        privacyPolicyUrl: Swift.String? = nil,
        appHomepageUrl: Swift.String? = nil,
        appDirectoryUrl: Swift.String? = nil,
        isAppDirectoryApproved: Swift.Bool? = nil,
        isInternal: Swift.Bool? = nil,
        isGranularBotApp: Swift.Bool? = nil,
        additionalInfo: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.icons = icons
        self.helpUrl = helpUrl
        self.privacyPolicyUrl = privacyPolicyUrl
        self.appHomepageUrl = appHomepageUrl
        self.appDirectoryUrl = appDirectoryUrl
        self.isAppDirectoryApproved = isAppDirectoryApproved
        self.isInternal = isInternal
        self.isGranularBotApp = isGranularBotApp
        self.additionalInfo = additionalInfo
    }
}
