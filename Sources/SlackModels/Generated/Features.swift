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

/// - Remark: Generated from `#/components/schemas/Features`.
public struct Features: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Features/shortcuts`.
    public var shortcuts: [Shortcut]?
    /// - Remark: Generated from `#/components/schemas/Features/appHome`.
    public var appHome: AppHome?
    /// - Remark: Generated from `#/components/schemas/Features/botUser`.
    public var botUser: BotUser?
    /// - Remark: Generated from `#/components/schemas/Features/slashCommands`.
    public var slashCommands: [SlashCommand]?
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
        shortcuts: [Shortcut]? = nil,
        appHome: AppHome? = nil,
        botUser: BotUser? = nil,
        slashCommands: [SlashCommand]? = nil,
        unfurlDomains: [Swift.String]? = nil
    ) {
        self.shortcuts = shortcuts
        self.appHome = appHome
        self.botUser = botUser
        self.slashCommands = slashCommands
        self.unfurlDomains = unfurlDomains
    }
}
