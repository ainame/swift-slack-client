extension Slack {
    public struct Configuration: Sendable {
        public var userAgent: String?
        public var appToken: String?
        public var token: String?
        public var signingSecret: String?

        public init(
            userAgent: String? = nil,
            appToken: String? = nil,
            token: String? = nil,
            signingSecret: String? = nil,
        ) {
            self.userAgent = userAgent
            self.appToken = appToken
            self.token = token
            self.signingSecret = signingSecret
        }
    }
}
