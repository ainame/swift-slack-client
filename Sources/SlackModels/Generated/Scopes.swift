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

/// - Remark: Generated from `#/components/schemas/Scopes`.
public struct Scopes: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Scopes/app_home`.
    public var appHome: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Scopes/channel`.
    public var channel: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Scopes/group`.
    public var group: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Scopes/im`.
    public var im: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Scopes/mpim`.
    public var mpim: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Scopes/team`.
    public var team: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Scopes/user`.
    public var user: [Swift.String]?
    /// Creates a new `Scopes`.
    ///
    /// - Parameters:
    ///   - appHome:
    ///   - channel:
    ///   - group:
    ///   - im:
    ///   - mpim:
    ///   - team:
    ///   - user:
    public init(
        appHome: [Swift.String]? = nil,
        channel: [Swift.String]? = nil,
        group: [Swift.String]? = nil,
        im: [Swift.String]? = nil,
        mpim: [Swift.String]? = nil,
        team: [Swift.String]? = nil,
        user: [Swift.String]? = nil
    ) {
        self.appHome = appHome
        self.channel = channel
        self.group = group
        self.im = im
        self.mpim = mpim
        self.team = team
        self.user = user
    }

    public enum CodingKeys: String, CodingKey {
        case appHome = "app_home"
        case channel
        case group
        case im
        case mpim
        case team
        case user
    }
}
