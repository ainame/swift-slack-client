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

/// - Remark: Generated from `#/components/schemas/Credentials`.
public struct Credentials: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Credentials/clientId`.
    public var clientId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Credentials/clientSecret`.
    public var clientSecret: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Credentials/verificationToken`.
    public var verificationToken: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Credentials/signingSecret`.
    public var signingSecret: Swift.String?
    /// Creates a new `Credentials`.
    ///
    /// - Parameters:
    ///   - clientId:
    ///   - clientSecret:
    ///   - verificationToken:
    ///   - signingSecret:
    public init(
        clientId: Swift.String? = nil,
        clientSecret: Swift.String? = nil,
        verificationToken: Swift.String? = nil,
        signingSecret: Swift.String? = nil
    ) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.verificationToken = verificationToken
        self.signingSecret = signingSecret
    }
}
