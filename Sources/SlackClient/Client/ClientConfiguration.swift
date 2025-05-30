public struct ClientConfiguration: Sendable {
    public var userAgent: String?
    public var appToken: String?
    public var token: String?

    public init(
        userAgent: String? = nil,
        appToken: String? = nil,
        token: String? = nil
    ) {
        self.userAgent = userAgent
        self.appToken = appToken
        self.token = token
    }
}
