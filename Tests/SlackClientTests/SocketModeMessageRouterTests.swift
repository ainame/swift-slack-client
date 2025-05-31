#if SocketMode && Events
import Foundation
import Logging
@testable import SlackClient
import SlackModels
import Testing

// Test the core functionality of SocketModeMessageRouter without requiring full mocking
// These tests verify that handlers are registered correctly and filtering logic works

struct SocketModeMessageRouterTests {
    @Test func onSocketModeMessageRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onSocketModeMessage { _, _ in
            // Handler body
        }

        // Verify the handler was registered (we can't easily test execution without complex mocking)
        #expect(router.handlers.count == 1)
    }

    @Test func onInteractiveRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onInteractive { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onGlobalShortcutRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onGlboalShortcut("test_shortcut") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onMessageShortcutRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onMessageShortcut("test_message_shortcut") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSlashCommandRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onSlashCommand("/test") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSlashCommandRequiresSlashPrefix() async throws {
        let router = SocketModeMessageRouter()

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
        let router = SocketModeMessageRouter()

        router.onBlockAction("test_block_action") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onViewRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onView("test_view") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onViewSubmissionRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onViewSubmission("test_view_submission") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onViewClosedRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onViewClosed("test_view_closed") { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onEventRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onEvent { _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSpecificEventRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onEvent(MessageEvent.self) { _, _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onSlackMessageMatchedRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onSlackMessageMatched(with: "hello", "world") { _, _, _ in
            // Handler body
        }

        #expect(router.handlers.count == 1)
    }

    @Test func onErrorRegistration() async throws {
        let router = SocketModeMessageRouter()

        router.onError { _, _, _ in
            // Handler body
        }

        // Error handler doesn't add to handlers array, it sets errorHandler property
        #expect(router.handlers.isEmpty)
        #expect(router.errorHandler != nil)
    }

    @Test func multipleHandlerRegistration() async throws {
        let router = SocketModeMessageRouter()

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
        let router = SocketModeMessageRouter()

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

}

// Helper to access private properties for testing
private extension SocketModeMessageRouter {
    var handlers: [SocketModeMessageHandler] {
        Mirror(reflecting: self).children.first(where: { $0.label == "handlers" })?.value as? [SocketModeMessageHandler] ?? []
    }

    var errorHandler: SocketModeErrorHandler? {
        Mirror(reflecting: self).children.first(where: { $0.label == "errorHandler" })?.value as? SocketModeErrorHandler
    }
}

#endif
