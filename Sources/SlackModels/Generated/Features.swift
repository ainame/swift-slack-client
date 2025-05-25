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

/// - Remark: Generated from `#/components/schemas/Features`.
public struct Features: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Features/shortcuts`.
    public var shortcuts: [SlackModels.Shortcut]?
    /// - Remark: Generated from `#/components/schemas/Features/appHome`.
    public var appHome: SlackModels.AppHome?
    /// - Remark: Generated from `#/components/schemas/Features/botUser`.
    public var botUser: SlackModels.BotUser?
    /// - Remark: Generated from `#/components/schemas/Features/slashCommands`.
    public var slashCommands: [SlackModels.SlashCommand]?
    /// - Remark: Generated from `#/components/schemas/Features/unfurlDomains`.
    public var unfurlDomains: [Swift.String]?
    /// Creates a new `Features`.
    ///
    /// - Parameters:
    ///   - shortcuts:
    ///   - appHome:
    ///   - botUser:
    ///   - slashCommands:
    ///   - unfurlDomains:
    public init(
        shortcuts: [SlackModels.Shortcut]? = nil,
        appHome: SlackModels.AppHome? = nil,
        botUser: SlackModels.BotUser? = nil,
        slashCommands: [SlackModels.SlashCommand]? = nil,
        unfurlDomains: [Swift.String]? = nil
    ) {
        self.shortcuts = shortcuts
        self.appHome = appHome
        self.botUser = botUser
        self.slashCommands = slashCommands
        self.unfurlDomains = unfurlDomains
    }
}
