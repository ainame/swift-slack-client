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

    func verify(headerFields: HTTPFields, body: Foundation.Data) throws {
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

        guard signature.hasPrefix("v0=") else {
            throw HTTPRequestVerificationError.invalidSignature
        }
        let hexSignature = String(signature.dropFirst(3))
        guard let signatureBytes = Self.decodeHex(hexSignature) else {
            throw HTTPRequestVerificationError.invalidSignature
        }

        let base = "v0:\(timestamp):" + String(decoding: body, as: UTF8.self)
        let key = SymmetricKey(data: Foundation.Data(signingSecret.utf8))
        let baseData = Foundation.Data(base.utf8)

        guard HMAC<SHA256>.isValidAuthenticationCode(signatureBytes, authenticating: baseData, using: key) else {
            throw HTTPRequestVerificationError.invalidSignature
        }
    }
}

extension HTTPRequestVerifier {
    private static func decodeHex(_ hex: String) -> Foundation.Data? {
        let length = hex.utf8.count
        guard length.isMultiple(of: 2) else { return nil }

        var data = Foundation.Data(capacity: length / 2)
        var index = hex.startIndex

        while index < hex.endIndex {
            let nextIndex = hex.index(index, offsetBy: 2)
            guard nextIndex <= hex.endIndex else { return nil }
            let byteString = hex[index ..< nextIndex]
            guard let byte = UInt8(byteString, radix: 16) else { return nil }
            data.append(byte)
            index = nextIndex
        }

        return data
    }
}
