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

/// - Remark: Generated from `#/components/schemas/Credentials`.
public struct Credentials: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Credentials/client_id`.
    public var clientId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Credentials/client_secret`.
    public var clientSecret: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Credentials/signing_secret`.
    public var signingSecret: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Credentials/verification_token`.
    public var verificationToken: Swift.String?
    /// Creates a new `Credentials`.
    ///
    /// - Parameters:
    ///   - clientId:
    ///   - clientSecret:
    ///   - signingSecret:
    ///   - verificationToken:
    public init(
        clientId: Swift.String? = nil,
        clientSecret: Swift.String? = nil,
        signingSecret: Swift.String? = nil,
        verificationToken: Swift.String? = nil
    ) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.signingSecret = signingSecret
        self.verificationToken = verificationToken
    }

    public enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case signingSecret = "signing_secret"
        case verificationToken = "verification_token"
    }
}
