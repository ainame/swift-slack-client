import Foundation
@testable import SlackClient
import SlackModels
import Testing

struct BlockActionsPayloadTests {
    @Test
    func containerDecodesMessageContainer() throws {
        let json = """
        {
            "type": "message",
            "message_ts": "1771366531.702529",
            "channel_id": "C0AFCSU2AKD",
            "is_ephemeral": false
        }
        """

        let container = try JSONDecoder().decode(Container.self, from: #require(json.data(using: .utf8)))

        #expect(container._type == "message")
        #expect(container.viewId == nil)
        #expect(container.messageTs == "1771366531.702529")
        #expect(container.channelId == "C0AFCSU2AKD")
        #expect(container.isEphemeral == false)
    }

    @Test
    func containerDecodesViewContainer() throws {
        let json = """
        {
            "type": "view",
            "view_id": "V123456"
        }
        """

        let container = try JSONDecoder().decode(Container.self, from: #require(json.data(using: .utf8)))

        #expect(container._type == "view")
        #expect(container.viewId == "V123456")
        #expect(container.messageTs == nil)
        #expect(container.channelId == nil)
        #expect(container.isEphemeral == nil)
    }

    @Test
    func containerRoundTripsForMessageShape() throws {
        let original = Container(messageTs: "123.456", channelId: "C123", isEphemeral: true)

        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Container.self, from: encoded)

        #expect(decoded._type == "message")
        #expect(decoded.viewId == nil)
        #expect(decoded.messageTs == "123.456")
        #expect(decoded.channelId == "C123")
        #expect(decoded.isEphemeral == true)
    }

    @Test
    func blockActionsPayloadDecodesMessageBasedInteraction() throws {
        let json = """
        {
            "type": "block_actions",
            "user": {
                "id": "U03TQQSQH25"
            },
            "team": {
                "id": "T03T5HH7T9U"
            },
            "container": {
                "type": "message",
                "message_ts": "1771366531.702529",
                "channel_id": "C0AFCSU2AKD",
                "is_ephemeral": false
            },
            "response_url": "https://hooks.slack.com/actions/T03T5HH7T9U/123/abc"
        }
        """

        let payload = try JSONDecoder().decode(BlockActionsPaylaod.self, from: #require(json.data(using: .utf8)))

        #expect(payload._type == "block_actions")
        #expect(payload.container._type == "message")
        #expect(payload.container.viewId == nil)
        #expect(payload.container.messageTs == "1771366531.702529")
        #expect(payload.container.channelId == "C0AFCSU2AKD")
        #expect(payload.view == nil)
        #expect(payload.callbackId == nil)
        #expect(payload.responseUrl?.absoluteString == "https://hooks.slack.com/actions/T03T5HH7T9U/123/abc")
    }

    @Test
    func blockActionsPayloadDecodesViewBasedInteraction() throws {
        let json = """
        {
            "type": "block_actions",
            "user": {
                "id": "U03TQQSQH25"
            },
            "team": {
                "id": "T03T5HH7T9U"
            },
            "container": {
                "type": "view",
                "view_id": "V123"
            },
            "view": {
                "type": "modal",
                "callback_id": "nag_modal",
                "title": {
                    "type": "plain_text",
                    "text": "Test"
                },
                "blocks": []
            }
        }
        """

        let payload = try JSONDecoder().decode(BlockActionsPaylaod.self, from: #require(json.data(using: .utf8)))

        #expect(payload.container._type == "view")
        #expect(payload.container.viewId == "V123")
        #expect(payload.view != nil)
        #expect(payload.callbackId == "nag_modal")
        #expect(payload.responseUrl == nil)
    }

    #if SocketMode
    @Test
    func socketModeEnvelopeDecodesInteractiveMessageBlockActionWithoutViewId() throws {
        let json = """
        {
            "envelope_id": "a0c09927-b555-498c-b84f-59de62cc81b3",
            "type": "interactive",
            "payload": {
                "type": "block_actions",
                "user": {
                    "id": "U03TQQSQH25"
                },
                "team": {
                    "id": "T03T5HH7T9U"
                },
                "container": {
                    "type": "message",
                    "message_ts": "1771366531.702529",
                    "channel_id": "C0AFCSU2AKD",
                    "is_ephemeral": false
                },
                "response_url": "https://hooks.slack.com/actions/T03T5HH7T9U/123/abc"
            },
            "accepts_response_payload": false
        }
        """

        let envelope = try JSONDecoder().decode(SocketModeMessageEnvelope.self, from: #require(json.data(using: .utf8)))

        #expect(envelope._type == "interactive")

        if case let .interactive(interactive) = envelope.payload {
            if case let .blockActions(payload) = interactive.body {
                #expect(payload.container._type == "message")
                #expect(payload.container.viewId == nil)
                #expect(payload.container.channelId == "C0AFCSU2AKD")
            } else {
                Issue.record("Expected block_actions interactive body")
            }
        } else {
            Issue.record("Expected interactive socket mode payload")
        }
    }
    #endif
}
