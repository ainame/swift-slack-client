import Foundation
@testable import SlackClient
import Testing

struct BlockActionsPayloadTests {
    @Test
    func decodeMessageContainerBlockActionsWithoutView() throws {
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
          }
        }
        """

        let payload = try JSONDecoder().decode(BlockActionsPaylaod.self, from: #require(json.data(using: .utf8)))

        #expect(payload._type == "block_actions")
        #expect(payload.container._type == "message")
        #expect(payload.view == nil)
        #expect(payload.callbackId == nil)
    }

    @Test
    func decodeViewContainerBlockActionsWithView() throws {
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
    }

    @Test
    func decodeBlockActionsWithOptionalFields() throws {
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
            "channel_id": "C0AFCSU2AKD"
          },
          "enterprise": {
            "id": "E123",
            "name": "Acme Org"
          },
          "message": {
            "type": "message",
            "text": "optional fields test"
          },
          "state": {
            "values": {
              "note_block": {
                "note_action": {
                  "type": "plain_text_input",
                  "value": "hello"
                }
              }
            }
          },
          "response_url": "https://hooks.slack.com/actions/T000/B000/abc"
        }
        """

        let payload = try JSONDecoder().decode(BlockActionsPaylaod.self, from: #require(json.data(using: .utf8)))

        #expect(payload.enterprise?.id == "E123")
        #expect(payload.enterprise?.name == "Acme Org")
        #expect(payload.message?.text == "optional fields test")
        #expect(payload.state?["note_block", "note_action"]?.value == "hello")
        #expect(payload.responseUrl?.absoluteString == "https://hooks.slack.com/actions/T000/B000/abc")
    }
}
