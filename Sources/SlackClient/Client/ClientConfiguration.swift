public struct ClientConfiguration: Sendable {
    public var userAgent: String?
    public var accessToken: String?

    public init(
        userAgent: String? = nil,
        accessToken: String? = nil
    ) {
        self.userAgent = userAgent
        self.accessToken = accessToken
    }
}
