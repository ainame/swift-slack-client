#if Events
import Foundation
import HTTPTypes
import Logging
import OpenAPIRuntime
import SlackClient
@testable import SlackApp
import Testing

struct AppRouterTests {
    @Test func slashCommandRegistrationUsesLastHandler() async throws {
        actor Tracker {
            private(set) var value: String?
            func set(_ value: String) { self.value = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onSlashCommand("/test") { _, _ in await tracker.set("first") }
        router.onSlashCommand("/test") { _, _ in await tracker.set("second") }

        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(
            context: .request(await makeRequestContext()),
            request: .slashCommand(try makeSlashCommandPayload(command: "/test"))
        )

        #expect(await tracker.value == "second")
    }

    @Test func specificEventDispatchUsesLastTypedHandler() async throws {
        actor Tracker {
            private(set) var text: String?
            func setText(_ value: String?) { text = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onEvent(MessageEvent.self) { _, _, _ in
            await tracker.setText("first")
        }
        router.onEvent(MessageEvent.self) { _, _, event in
            await tracker.setText(event.text)
        }

        let envelope = try makeMessageEventEnvelope(text: "hello")
        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(
            context: .event(await makeEventContext()),
            request: .event(envelope)
        )

        #expect(await tracker.text == "hello")
    }

    @Test func broadEventDispatchUsesLastHandler() async throws {
        actor Tracker {
            private(set) var value: String?
            func set(_ value: String) { self.value = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onEvent { _, _ in await tracker.set("first") }
        router.onEvent { _, _ in await tracker.set("second") }

        let envelope = try makeMessageEventEnvelope(text: "hello")
        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(
            context: .event(await makeEventContext()),
            request: .event(envelope)
        )

        #expect(await tracker.value == "second")
    }

    @Test func typedEventTakesPrecedenceOverBroadEventHandler() async throws {
        actor Tracker {
            private(set) var value: String?
            func set(_ value: String) { self.value = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onEvent { _, _ in await tracker.set("broad") }
        router.onEvent(MessageEvent.self) { _, _, _ in await tracker.set("typed") }

        let envelope = try makeMessageEventEnvelope(text: "hello")
        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(
            context: .event(await makeEventContext()),
            request: .event(envelope)
        )

        #expect(await tracker.value == "typed")
    }

    @Test func interactiveDispatchUsesSpecificHandlerOverBroadInteractiveHandler() async throws {
        actor Tracker {
            private(set) var callbackId: String?
            func setCallbackId(_ value: String) { callbackId = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onInteractive { _, _ in
            await tracker.setCallbackId("broad")
        }
        router.onBlockAction("button-id") { _, payload in
            await tracker.setCallbackId(payload.callbackId ?? "")
        }

        let body = try makeBlockActionEnvelope(callbackId: "button-id")
        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(context: .request(await makeRequestContext()), request: .interactive(body))

        #expect(await tracker.callbackId == "button-id")
    }

    @Test func interactiveDispatchUsesLastBroadHandler() async throws {
        actor Tracker {
            private(set) var value: String?
            func set(_ value: String) { self.value = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onInteractive { _, _ in await tracker.set("first") }
        router.onInteractive { _, _ in await tracker.set("second") }

        let body = try makeBlockActionEnvelope(callbackId: nil)
        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(context: .request(await makeRequestContext()), request: .interactive(body))

        #expect(await tracker.value == "second")
    }

    @Test func viewHandlersShareNamespaceByCallbackId() async throws {
        actor Tracker {
            private(set) var value: String?
            func set(_ value: String) { self.value = value }
        }

        let tracker = Tracker()
        let router = Router()
        router.onView("modal") { _, _ in await tracker.set("view") }
        router.onViewSubmission("modal") { _, _ in await tracker.set("submission") }

        let body = try makeViewSubmissionEnvelope(callbackId: "modal")
        let fixedRouter = Router.FixedRouter(from: router)
        try await fixedRouter.dispatch(context: .request(await makeRequestContext()), request: .interactive(body))

        #expect(await tracker.value == "submission")
    }
}

private func makeSlashCommandPayload(command: String) throws -> SlashCommandsPayload {
    let bodyData = try #require(
        """
        {
          "trigger_id": "trigger",
          "command": "\(command)",
          "text": "",
          "user_id": "U123",
          "user_name": "ainame",
          "team_id": "T123",
          "team_domain": "example",
          "channel_id": "C123",
          "channel_name": "general",
          "response_url": "https://hooks.slack.com/commands/T123/1/2",
          "api_app_id": "A123",
          "token": "legacy"
        }
        """.data(using: .utf8)
    )
    return try JSONDecoder().decode(SlashCommandsPayload.self, from: bodyData)
}

private func makeMessageEventEnvelope(text: String) throws -> EventsApiEnvelope<Event> {
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
            "text": "\(text)",
            "ts": "123",
            "user": "U123"
          },
          "type": "event_callback",
          "event_id": "Ev123",
          "event_time": 123
        }
        """.data(using: .utf8)
    )
    return try JSONDecoder().decode(EventsApiEnvelope<Event>.self, from: eventData)
}

private func makeBlockActionEnvelope(callbackId: String?) throws -> InteractiveEnvelope {
    let rawJSON = """
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
        "callback_id": "__VIEW_CALLBACK_ID__",
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
      __CALLBACK_ID_FIELD__
      "state": {"values": {}}
    }
    """
    let bodyData = try #require(
        rawJSON
            .replacingOccurrences(of: "__VIEW_CALLBACK_ID__", with: callbackId ?? "fallback-modal")
            .replacingOccurrences(
                of: "__CALLBACK_ID_FIELD__",
                with: callbackId.map { "\"callback_id\": \"\($0)\",\n      " } ?? ""
            )
            .data(using: .utf8)
    )
    return try JSONDecoder().decode(InteractiveEnvelope.self, from: bodyData)
}

private func makeViewSubmissionEnvelope(callbackId: String) throws -> InteractiveEnvelope {
    let bodyData = try #require(
        """
        {
          "type": "view_submission",
          "user": { "id": "U123" },
          "api_app_id": "A123",
          "token": "legacy-token",
          "trigger_id": "13345224609.738474920.8088930838d88f008e0",
          "team": { "id": "T123", "domain": "example" },
          "view": {
            "id": "V123",
            "team_id": "T123",
            "type": "modal",
            "callback_id": "\(callbackId)",
            "title": { "type": "plain_text", "text": "Test" },
            "blocks": [],
            "state": {"values": {}}
          }
        }
        """.data(using: .utf8)
    )
    return try JSONDecoder().decode(InteractiveEnvelope.self, from: bodyData)
}

private func makeEventContext() async -> SlackApp.EventContext {
    let logger = Logger(label: "test")
    let transport = MockTransport()
    let slack = Slack(transport: transport)
    let client = await slack.client

    return SlackApp.EventContext(
        client: client,
        logger: logger,
        respond: Respond(transport: transport, logger: logger),
        say: Say(client: client, logger: logger)
    )
}

private func makeRequestContext() async -> SlackApp.Context {
    let logger = Logger(label: "test")
    let transport = MockTransport()
    let slack = Slack(transport: transport)
    let client = await slack.client

    return SlackApp.Context(
        client: client,
        logger: logger,
        respond: Respond(transport: transport, logger: logger),
        say: Say(client: client, logger: logger),
        ack: Ack(
            basicHandler: {},
            viewHandler: { _, _ in },
            errorHandler: { _ in }
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
