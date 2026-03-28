import Crypto
import Foundation
import HTTPTypes

enum HTTPRequestVerificationError: Error {
    case missingSigningSecret
    case missingSignature
    case missingTimestamp
    case invalidTimestamp
    case expiredTimestamp
    case invalidSignature
}

struct HTTPRequestVerifier {
    private static let signatureField = HTTPField.Name("x-slack-signature")!
    private static let timestampField = HTTPField.Name("x-slack-request-timestamp")!
    private static let maxAge: TimeInterval = 60 * 5

    let signingSecret: String
    let now: @Sendable () -> Date

    init(signingSecret: String, now: @escaping @Sendable () -> Date = Date.init) {
        self.signingSecret = signingSecret
        self.now = now
    }

    func verify(headerFields: HTTPFields, body: Data) throws {
        guard !signingSecret.isEmpty else {
            throw HTTPRequestVerificationError.missingSigningSecret
        }
        guard let signature = headerFields[values: Self.signatureField].first else {
            throw HTTPRequestVerificationError.missingSignature
        }
        guard let timestamp = headerFields[values: Self.timestampField].first else {
            throw HTTPRequestVerificationError.missingTimestamp
        }
        guard let unixTimestamp = Double(timestamp) else {
            throw HTTPRequestVerificationError.invalidTimestamp
        }
        guard abs(now().timeIntervalSince1970 - unixTimestamp) <= Self.maxAge else {
            throw HTTPRequestVerificationError.expiredTimestamp
        }

        let base = "v0:\(timestamp):" + String(decoding: body, as: UTF8.self)
        let key = SymmetricKey(data: Data(signingSecret.utf8))
        let digest = HMAC<SHA256>.authenticationCode(for: Data(base.utf8), using: key)
        let hex = digest.map { String(format: "%02x", $0) }.joined()
        guard signature == "v0=\(hex)" else {
            throw HTTPRequestVerificationError.invalidSignature
        }
    }
}
