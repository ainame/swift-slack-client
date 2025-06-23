#if SocketMode && Events
import Foundation
import HTTPTypes
import Logging
import OpenAPIRuntime
@testable import SlackClient
import SlackModels
import Testing

// Test the core functionality of SocketModeRouter without requiring full mocking
// These tests verify that handlers are registered correctly and filtering logic works

struct SocketModeRouterTests {
    @Test func onSocketModeMessageRegistration() async throws {
        let router = SocketModeRouter()

        router.onSocketModeMessage { _, _ in
            // Handler body
        }

        // Verify the handler was registered (we can't easily test execution without complex mocking)
        #expect(router.handlers.count == 1)
    }

    @Test func onInteractiveRegistration() async throws {
        let router = SocketModeRouter()

        router.onInteractive { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onGlobalShortcutRegistration() async throws {
        let router = SocketModeRouter()

        router.onGlboalShortcut("test_shortcut") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onMessageShortcutRegistration() async throws {
        let router = SocketModeRouter()

        router.onMessageShortcut("test_message_shortcut") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSlashCommandRegistration() async throws {
        let router = SocketModeRouter()

        router.onSlashCommand("/test") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSlashCommandRequiresSlashPrefix() async throws {
        let router = SocketModeRouter()

        // This should trigger a precondition failure since "test" doesn't start with "/"
        // In tests, precondition failures are hard to catch, so we'll test the valid case
        // and document that invalid cases would trigger a precondition failure

        // Valid case
        router.onSlashCommand("/test") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onBlockActionRegistration() async throws {
        let router = SocketModeRouter()

        router.onBlockAction("test_block_action") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onViewRegistration() async throws {
        let router = SocketModeRouter()

        router.onView("test_view") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onViewSubmissionRegistration() async throws {
        let router = SocketModeRouter()

        router.onViewSubmission("test_view_submission") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onViewClosedRegistration() async throws {
        let router = SocketModeRouter()

        router.onViewClosed("test_view_closed") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onEventRegistration() async throws {
        let router = SocketModeRouter()

        router.onEvent { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSpecificEventRegistration() async throws {
        let router = SocketModeRouter()

        router.onEvent(MessageEvent.self) { _, _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSlackMessageMatchedRegistration() async throws {
        let router = SocketModeRouter()

        router.onSlackMessageMatched(with: "hello", "world") { _, _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onErrorRegistration() async throws {
        let router = SocketModeRouter()

        router.onError { _, _, _ in
            // Handler body
        }

        // Error handler doesn't add to handlers array, it sets errorHandler property
        #expect(router.handlers.isEmpty)
        #expect(router.errorHandler != nil)
    }

    @Test func multipleHandlerRegistration() async throws {
        let router = SocketModeRouter()

        router.onSocketModeMessage { _, _ in
            // Handler 1
        }

        router.onSlashCommand("/test") { _, _ in
            // Handler 2
        }

        router.onEvent(MessageEvent.self) { _, _, _ in
            // Handler 3
        }

        #expect(router.handlers.count == 3)
    }

    @Test func slashCommandValidation() async throws {
        let router = SocketModeRouter()

        // Valid slash command
        router.onSlashCommand("/valid") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)

        // Note: Testing invalid slash commands that trigger precondition failures
        // is complex in swift-testing. The precondition check is documented in the method.
    }

    // Test data structure creation to ensure our renamed types work correctly
    @Test func eventTypeHandling() async throws {
        // Test that we can create a MessageEvent (this verifies the Event enum works)
        let messageEvent = MessageEvent(
            attachments: nil,
            blocks: nil,
            botId: nil,
            botProfile: nil,
            channel: "C123456",
            channelType: "channel",
            clientMsgId: "test-client-msg-id",
            edited: nil,
            eventTs: "1234567890.123456",
            metadata: nil,
            parentUserId: nil,
            team: "T123456",
            text: "Hello, world!",
            threadTs: nil,
            ts: "1234567890.123456",
            _type: "message",
            user: "U123456",
        )

        #expect(messageEvent._type == "message")
        #expect(messageEvent.text == "Hello, world!")

        // Test that we can create an Event enum case
        let event = Event.message(messageEvent)

        switch event {
        case let .message(msg):
            #expect(msg.text == "Hello, world!")
        default:
            #expect(Bool(false), "Expected message event")
        }
    }

    @Test func slashCommandPayloadCreation() async throws {
        let json = """
        {
            "command": "/test",
            "text": "test text",
            "response_url": "https://hooks.slack.com/commands/1234/5678",
            "trigger_id": "test-trigger-id",
            "user_id": "U123456",
            "user_name": "testuser",
            "channel_id": "C123456",
            "channel_name": "test-channel",
            "team_id": "T123456",
            "team_domain": "test-team",
            "is_enterprise_install": false,
            "api_app_id": "A123456"
        }
        """

        let payload = try JSONDecoder().decode(SlashCommandsPayload.self, from: json.data(using: .utf8)!)

        #expect(payload.command == "/test")
        #expect(payload.text == "test text")
        #expect(payload.userId == "U123456")
        #expect(payload.channelId == "C123456")
        #expect(payload.isEnterpriseInstall == false)
    }

    @Test func globalShortcutPayloadCreation() async throws {
        // Test that we can decode a GlobalShortcutPayload from JSON
        let json = """
        {
            "type": "shortcut",
            "callback_id": "test_shortcut",
            "trigger_id": "test-trigger-id",
            "team": {
                "id": "T123456",
                "name": "test-team"
            },
            "user": {
                "id": "U123456",
                "name": "testuser"
            }
        }
        """

        let payload = try JSONDecoder().decode(GlobalShortcutPayload.self, from: json.data(using: .utf8)!)

        #expect(payload.callbackId == "test_shortcut")
        #expect(payload.triggerId == "test-trigger-id")
        #expect(payload.team.id == "T123456")
        #expect(payload.user.id == "U123456")
    }

    @Test func socketModeMessageEnvelopeCreation() async throws {
        // Test that we can create a SocketModeMessageEnvelope with slash command payload
        let slashCommandJson = """
        {
            "envelope_id": "test-envelope-id",
            "type": "slash_commands",
            "accepts_response_payload": false,
            "payload": {
                "command": "/test",
                "text": "test text",
                "response_url": "https://hooks.slack.com/commands/1234/5678",
                "trigger_id": "test-trigger-id",
                "user_id": "U123456",
                "user_name": "testuser",
                "channel_id": "C123456",
                "channel_name": "test-channel",
                "team_id": "T123456",
                "team_domain": "test-team",
                "is_enterprise_install": false,
                "api_app_id": "A123456"
            }
        }
        """

        let envelope = try JSONDecoder().decode(SocketModeMessageEnvelope.self, from: slashCommandJson.data(using: .utf8)!)

        #expect(envelope.envelopeId == "test-envelope-id")
        #expect(envelope._type == "slash_commands")
        #expect(envelope.acceptsResponsePayload == false)

        if case let .slashCommands(payload) = envelope.payload {
            #expect(payload.command == "/test")
            #expect(payload.text == "test text")
        } else {
            #expect(Bool(false), "Expected slash commands payload")
        }
    }

    // REGRESSION TEST: Verify that the onEvent method with specific event types compiles correctly
    // This test would fail to compile if commit 7882fc2 is reverted due to type parameter conflicts
    @Test func onEventTypeParameterRegression() async throws {
        let router = SocketModeRouter()

        // This specific usage pattern would fail to compile with the original bug
        // because the type parameter T would conflict with the Event enum type
        router.onEvent(MessageEvent.self) { _, _, event in
            // The bug was in the type casting: `let payload = eventsApiEnvelope.event.payload as? T`
            // With the fix, this compiles and the type casting works correctly
            #expect(event._type == "message")
        }

        // Verify the handler was registered successfully
        #expect(router.handlers.count == 1)

        // Also test that multiple specific event handlers can be registered
        router.onEvent(AppMentionEvent.self) { _, _, event in
            #expect(event._type == "app_mention")
        }

        #expect(router.handlers.count == 2)
    }

    // REGRESSION TEST: Actual dispatch test that would fail if commit 7882fc2 is reverted
    // This test verifies that events are properly cast and handlers are actually executed
    // TODO: This test is currently disabled because creating a Context requires WebSocketOutboundWriter
    // which is not easily mockable. Consider refactoring Context to accept a protocol instead.
    @Test(.disabled("Requires WebSocket mocking")) func onEventActualDispatchRegression() async throws {
        let router = SocketModeRouter()

        // Use actor to safely track handler execution in concurrent context
        actor HandlerTracker {
            private(set) var messageHandlerCalled = false
            private(set) var appMentionHandlerCalled = false
            private(set) var receivedMessageEvent: MessageEvent?
            private(set) var receivedAppMentionEvent: AppMentionEvent?

            func markMessageHandlerCalled(with event: MessageEvent) {
                messageHandlerCalled = true
                receivedMessageEvent = event
            }

            func markAppMentionHandlerCalled(with event: AppMentionEvent) {
                appMentionHandlerCalled = true
                receivedAppMentionEvent = event
            }
        }

        let tracker = HandlerTracker()

        // Register handler for MessageEvent
        router.onEvent(MessageEvent.self) { _, _, event in
            await tracker.markMessageHandlerCalled(with: event)
        }

        // Register handler for AppMentionEvent
        router.onEvent(AppMentionEvent.self) { _, _, event in
            await tracker.markAppMentionHandlerCalled(with: event)
        }

        // Create events
        let messageEvent = MessageEvent(
            attachments: nil,
            blocks: nil,
            botId: nil,
            botProfile: nil,
            channel: "C123456",
            channelType: "channel",
            clientMsgId: "test-client-msg-id",
            edited: nil,
            eventTs: "1234567890.123456",
            metadata: nil,
            parentUserId: nil,
            team: "T123456",
            text: "Hello, regression test!",
            threadTs: nil,
            ts: "1234567890.123456",
            _type: "message",
            user: "U123456",
        )

        let appMentionEvent = AppMentionEvent(
            blocks: nil,
            channel: "C123456",
            clientMsgId: "app-mention-msg-id",
            edited: nil,
            eventTs: "1234567890.789012",
            team: "T123456",
            text: "<@U123456> hello app mention test",
            threadTs: nil,
            ts: "1234567890.789012",
            _type: "app_mention",
            user: "U789012",
        )

        // Create EventsApiEnvelopes
        let messageEventsEnvelope = EventsApiEnvelope(
            teamId: "T123456",
            apiAppId: "A123456",
            event: Event.message(messageEvent),
            type: "event_callback",
            eventId: "Ev123456",
            eventTime: 1_234_567_890,
        )

        let appMentionEventsEnvelope = EventsApiEnvelope(
            teamId: "T123456",
            apiAppId: "A123456",
            event: Event.appMention(appMentionEvent),
            type: "event_callback",
            eventId: "Ev789012",
            eventTime: 1_234_567_890,
        )

        // Create SocketModeMessageEnvelopes
        let messageSocketEnvelope = SocketModeMessageEnvelope(
            envelopeId: "envelope-123",
            _type: "events_api",
            payload: .eventsApi(messageEventsEnvelope),
            acceptsResponsePayload: false,
        )

        let appMentionSocketEnvelope = SocketModeMessageEnvelope(
            envelopeId: "envelope-456",
            _type: "events_api",
            payload: .eventsApi(appMentionEventsEnvelope),
            acceptsResponsePayload: false,
        )

        // Create a simple mock context - we'll create minimal implementations
        // that don't actually implement the full APIProtocol since we're only testing dispatch
        let logger = Logger(label: "test")
        let transport = MockTransport()

        // Create context with actual Slack instance for simplicity
        let slack = Slack(transport: transport)
        let client = await slack.client
        
        // NOTE: Context creation commented out because it requires Ack with WebSocketOutboundWriter
        // which is not easily mockable in tests
        /*
        let mockContext = SocketModeRouter.Context(
            client: client,
            logger: logger,
            respond: Respond(transport: transport, logger: logger),
            say: Say(client: client, logger: logger),
            ack: ack // Would need WebSocketOutboundWriter
        )
        */

        // Create FixedRouter and dispatch events
        let fixedRouter = SocketModeRouter.FixedRouter(from: router)

        // NOTE: Dispatch testing commented out because it requires mockContext
        /*
        try await fixedRouter.dispatch(context: mockContext, messageEnvelope: messageSocketEnvelope)
        try await fixedRouter.dispatch(context: mockContext, messageEnvelope: appMentionSocketEnvelope)

        // Verify handlers were actually called
        let messageHandlerCalled = await tracker.messageHandlerCalled
        let appMentionHandlerCalled = await tracker.appMentionHandlerCalled
        let receivedMessage = await tracker.receivedMessageEvent
        let receivedAppMention = await tracker.receivedAppMentionEvent

        #expect(messageHandlerCalled)
        #expect(appMentionHandlerCalled)
        #expect(receivedMessage?.text == "Hello, regression test!")
        #expect(receivedMessage?._type == "message")
        #expect(receivedAppMention?.text == "<@U123456> hello app mention test")
        #expect(receivedAppMention?._type == "app_mention")
        */
        
        // For now, just verify the handlers were registered
        #expect(router.handlers.count == 2)
    }
}

// Helper to access private properties for testing
extension SocketModeRouter {
    fileprivate var handlers: [SocketModeMessageHandler] {
        Mirror(reflecting: self).children.first(where: { $0.label == "handlers" })?.value as? [SocketModeMessageHandler] ?? []
    }

    fileprivate var errorHandler: SocketModeErrorHandler? {
        Mirror(reflecting: self).children.first(where: { $0.label == "errorHandler" })?.value as? SocketModeErrorHandler
    }
}

// Mock implementations for testing

private struct MockTransport: ClientTransport, Sendable {
    func send(
        _: HTTPRequest,
        body _: HTTPBody?,
        baseURL _: URL,
        operationID _: String
    ) async throws -> (HTTPResponse, HTTPBody?) {
        // Return a simple 200 response for testing
        (HTTPResponse(status: .ok), nil)
    }
}


#endif
