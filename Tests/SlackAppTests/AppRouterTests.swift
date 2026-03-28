#if Events
import Foundation
import HTTPTypes
import Logging
import OpenAPIRuntime
import SlackClient
@testable import SlackApp
import Testing

struct AppRouterTests {
    @Test func slashCommandRegistration() {
        let router = AppRouter()

        router.onSlashCommand("/test") { _, _ in }

        #expect(router.handlers.count == 1)
    }

    @Test func specificEventDispatch() async throws {
        actor Tracker {
            private(set) var text: String?

            func setText(_ value: String?) {
                text = value
            }
        }

        let tracker = Tracker()
        let router = AppRouter()
        router.onEvent(MessageEvent.self) { _, _, event in
            await tracker.setText(event.text)
        }

        let eventData = try #require(
            """
            {
              "team_id": "T123",
              "api_app_id": "A123",
              "event": {
                "type": "message",
                "channel": "C123",
                "channel_type": "channel",
                "event_ts": "123",
                "team": "T123",
                "text": "hello",
                "ts": "123",
                "user": "U123"
              },
              "type": "event_callback",
              "event_id": "Ev123",
              "event_time": 123
            }
            """.data(using: .utf8)
        )
        let envelope = try JSONDecoder().decode(EventsApiEnvelope<Event>.self, from: eventData)

        let fixedRouter = AppRouter.FixedRouter(from: router)
        try await fixedRouter.dispatch(
            context: await makeContext(),
            request: .event(envelope)
        )

        #expect(await tracker.text == "hello")
    }

    @Test func interactiveDispatch() async throws {
        actor Tracker {
            private(set) var callbackId: String?

            func setCallbackId(_ value: String) {
                callbackId = value
            }
        }

        let tracker = Tracker()
        let router = AppRouter()
        router.onBlockAction("button-id") { _, payload in
            await tracker.setCallbackId(payload.callbackId ?? "")
        }

        let bodyData = try #require(
            """
            {
              "type": "block_actions",
              "user": { "id": "U123" },
              "api_app_id": "A123",
              "token": "legacy-token",
              "container": {
                "type": "message",
                "message_ts": "123.456",
                "channel_id": "C123",
                "is_ephemeral": false
              },
              "trigger_id": "13345224609.738474920.8088930838d88f008e0",
              "team": { "id": "T123", "domain": "example" },
              "channel": { "id": "C123", "name": "general" },
              "view": {
                "type": "modal",
                "callback_id": "button-id",
                "title": { "type": "plain_text", "text": "Test" },
                "blocks": []
              },
              "response_url": "https://hooks.slack.com/actions/T123/1/2",
              "actions": [{
                "action_id": "button-id",
                "block_id": "block-1",
                "text": { "type": "plain_text", "text": "Click" },
                "value": "test",
                "type": "button",
                "action_ts": "123.456"
              }],
              "callback_id": "button-id"
            }
            """.data(using: .utf8)
        )
        let body = try JSONDecoder().decode(
            InteractiveEnvelope.self,
            from: bodyData
        )

        let fixedRouter = AppRouter.FixedRouter(from: router)
        try await fixedRouter.dispatch(context: await makeContext(), request: .interactive(body))

        #expect(await tracker.callbackId == "button-id")
    }
}

extension AppRouter {
    fileprivate var handlers: [AppRequestHandler] {
        Mirror(reflecting: self).children.first(where: { $0.label == "handlers" })?.value as? [AppRequestHandler] ?? []
    }
}

private func makeContext() async -> AppContext {
    let logger = Logger(label: "test")
    let transport = MockTransport()
    let slack = Slack(transport: transport)
    let client = await slack.client

    return AppContext(
        client: client,
        logger: logger,
        respond: Respond(transport: transport, logger: logger),
        say: Say(client: client, logger: logger),
        ack: Ack(
            basicHandler: {},
            viewHandler: { _, _ in },
            errorHandler: { _ in },
        )
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
#endif
