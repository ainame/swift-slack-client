import Foundation
import HTTPTypes
import OpenAPIRuntime
@testable import SlackApp
import SlackClient
import Testing

struct SlackAppTests {
    @Test func `run preparing executes before HTTP mode starts`() async throws {
        let transport = RecordingTransport()
        let slack = Slack(
            transport: transport,
            configuration: .init(token: "xoxb-test"),
        )
        let adapter = RecordingAdapter()
        let app = SlackApp(slack: slack, router: Router(), mode: .http(adapter))

        try await app.run { slack in
            await adapter.recordPrepare()
            let client = await slack.client
            _ = try await client.authTest()
        }

        let events = await adapter.events
        #expect(events == ["prepare", "adapter"])
    }
}

private actor RecordingAdapter: HTTPServerAdapter {
    private(set) var events: [String] = []

    func run(
        handler _: @escaping HTTPServerHandler,
    ) async throws {
        events.append("adapter")
    }

    func recordPrepare() {
        events.append("prepare")
    }
}

private actor RecordingTransport: ClientTransport {
    func send(
        _ request: HTTPRequest,
        body _: HTTPBody?,
        baseURL _: URL,
        operationID: String,
    ) async throws -> (HTTPResponse, HTTPBody?) {
        if operationID == "authTest" {
            let body = HTTPBody(#"{"ok":true,"url":"https://example.slack.com/","team":"Example","user":"example","team_id":"T123","user_id":"U123","bot_id":"B123"}"#)
            return (HTTPResponse(status: .ok), body)
        }

        Issue.record("Unexpected request: \(request.method.rawValue) \(operationID)")
        return (HTTPResponse(status: .internalServerError), nil)
    }
}
