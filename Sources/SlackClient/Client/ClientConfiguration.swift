public struct ClientConfiguration: Sendable {
    public var userAgent: String?
    public var appLevelToken: String?
    public var accessToken: String?

    public init(
        userAgent: String? = nil,
        appLevelToken: String? = nil,
        accessToken: String? = nil
    ) {
        self.userAgent = userAgent
        self.appLevelToken = appLevelToken
        self.accessToken = accessToken
    }
}
