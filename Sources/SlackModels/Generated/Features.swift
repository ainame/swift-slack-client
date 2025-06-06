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

/// - Remark: Generated from `#/components/schemas/Features`.
public struct Features: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Features/app_home`.
    public var appHome: AppHome?
    /// - Remark: Generated from `#/components/schemas/Features/bot_user`.
    public var botUser: BotUser?
    /// - Remark: Generated from `#/components/schemas/Features/shortcuts`.
    public var shortcuts: [Shortcut]?
    /// - Remark: Generated from `#/components/schemas/Features/slash_commands`.
    public var slashCommands: [SlashCommand]?
    /// - Remark: Generated from `#/components/schemas/Features/unfurl_domains`.
    public var unfurlDomains: [Swift.String]?
    /// Creates a new `Features`.
    ///
    /// - Parameters:
    ///   - appHome:
    ///   - botUser:
    ///   - shortcuts:
    ///   - slashCommands:
    ///   - unfurlDomains:
    public init(
        appHome: AppHome? = nil,
        botUser: BotUser? = nil,
        shortcuts: [Shortcut]? = nil,
        slashCommands: [SlashCommand]? = nil,
        unfurlDomains: [Swift.String]? = nil
    ) {
        self.appHome = appHome
        self.botUser = botUser
        self.shortcuts = shortcuts
        self.slashCommands = slashCommands
        self.unfurlDomains = unfurlDomains
    }

    public enum CodingKeys: String, CodingKey {
        case appHome = "app_home"
        case botUser = "bot_user"
        case shortcuts
        case slashCommands = "slash_commands"
        case unfurlDomains = "unfurl_domains"
    }
}
