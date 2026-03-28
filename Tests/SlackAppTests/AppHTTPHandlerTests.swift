import Crypto
import Foundation
import HTTPTypes
import OpenAPIRuntime
import SlackClient
@testable import SlackApp
import Testing

struct AppHTTPHandlerTests {
    @Test func rejectsInvalidSignature() async throws {
        let app = AppHTTPHandler(slack: makeSlack(signingSecret: "secret"), router: AppRouter())
        let timestamp = currentTimestamp()
        let response = try await app.handle(
            HTTPServerRequest(
                method: .post,
                path: "/slack/events",
                headerFields: HTTPFields([
                    HTTPField(name: .contentType, value: "application/json"),
                    HTTPField(name: HTTPField.Name("x-slack-request-timestamp")!, value: timestamp),
                    HTTPField(name: HTTPField.Name("x-slack-signature")!, value: "v0=bad"),
                ]),
                body: Data(#"{"type":"url_verification","challenge":"abc"}"#.utf8)
            )
        )

        #expect(response.status == .unauthorized)
    }

    @Test func urlVerificationReturnsChallenge() async throws {
        let body = Data(#"{"type":"url_verification","challenge":"abc"}"#.utf8)
        let timestamp = currentTimestamp()
        let request = signedRequest(
            secret: "secret",
            method: .post,
            path: "/slack/events",
            contentType: "application/json",
            body: body,
            timestamp: timestamp
        )
        let app = AppHTTPHandler(slack: makeSlack(signingSecret: "secret"), router: AppRouter())

        let response = try await app.handle(request)

        #expect(response.status == .ok)
        let responseBody = try #require(response.body)
        #expect(String(decoding: responseBody, as: UTF8.self).contains(#""challenge":"abc""#))
    }

    @Test func slashCommandDispatchesHandler() async throws {
        actor Tracker {
            private(set) var text: String?

            func setText(_ value: String) {
                text = value
            }
        }

        let tracker = Tracker()
        let router = AppRouter()
        router.onSlashCommand("/echo") { context, payload in
            await tracker.setText(payload.text)
            try await context.ack()
        }

        let body = Data(
            "command=%2Fecho&text=hello+world&response_url=https%3A%2F%2Fhooks.slack.com%2Fcommands%2F123%2F456&trigger_id=trigger&user_id=U123&user_name=tester&channel_id=C123&channel_name=general&team_id=T123&team_domain=example&is_enterprise_install=false&api_app_id=A123".utf8
        )
        let timestamp = currentTimestamp()
        let request = signedRequest(
            secret: "secret",
            method: .post,
            path: "/slack/events",
            contentType: "application/x-www-form-urlencoded",
            body: body,
            timestamp: timestamp
        )
        let app = AppHTTPHandler(slack: makeSlack(signingSecret: "secret"), router: router)

        let response = try await app.handle(request)

        #expect(response.status == .ok)
        #expect(await tracker.text == "hello world")
    }
}

private func currentTimestamp() -> String {
    String(Int(Date().timeIntervalSince1970))
}

private func makeSlack(signingSecret: String) -> Slack {
    Slack(
        transport: MockTransport(),
        configuration: .init(token: "xoxb-test", signingSecret: signingSecret)
    )
}

private func signedRequest(
    secret: String,
    method: HTTPRequest.Method,
    path: String,
    contentType: String,
    body: Data,
    timestamp: String
) -> HTTPServerRequest {
    let base = "v0:\(timestamp):" + String(decoding: body, as: UTF8.self)
    let key = SymmetricKey(data: Data(secret.utf8))
    let digest = HMAC<SHA256>.authenticationCode(for: Data(base.utf8), using: key)
    let signature = "v0=" + digest.map { String(format: "%02x", $0) }.joined()

    return HTTPServerRequest(
        method: method,
        path: path,
        headerFields: HTTPFields([
            HTTPField(name: .contentType, value: contentType),
            HTTPField(name: HTTPField.Name("x-slack-request-timestamp")!, value: timestamp),
            HTTPField(name: HTTPField.Name("x-slack-signature")!, value: signature),
        ]),
        body: body
    )
}

private struct MockTransport: ClientTransport, Sendable {
    func send(
        _: HTTPRequest,
        body _: HTTPBody?,
        baseURL _: URL,
        operationID _: String
    ) async throws -> (HTTPResponse, HTTPBody?) {
        (HTTPResponse(status: .ok), nil)
    }
}
