import Foundation
@testable import SlackApp
import Testing

struct ViewInteractionPayloadTests {
    @Test
    func `decode view submission payload with function fields`() throws {
        let json = """
        {
          "type": "view_submission",
          "enterprise": { "id": "E123", "name": "Acme" },
          "team": { "id": "T123", "name": "workspace" },
          "user": { "id": "U123" },
          "api_app_id": "A123",
          "trigger_id": "13345224609.738474920.8088930838d88f008e0",
          "hash": "1711111111.abcdef",
          "view": {
            "type": "modal",
            "id": "V123",
            "callback_id": "test_view",
            "title": { "type": "plain_text", "text": "Test" },
            "blocks": []
          },
          "response_urls": [
            {
              "block_id": "b1",
              "action_id": "a1",
              "channel_id": "C123",
              "response_url": "https://hooks.slack.com/actions/T123/1/2"
            }
          ],
          "function_data": {
            "execution_id": "Fx123",
            "function": { "callback_id": "fn_callback" },
            "inputs": { "channel": { "value": "C123" } }
          },
          "interactivity": {
            "interactivity_pointer": "111.222.333",
            "interactor": {
              "id": "U123",
              "secret": "s3cr3t"
            }
          },
          "bot_access_token": "xwfp-valid"
        }
        """

        let payload = try JSONDecoder().decode(ViewSubmissionPayload.self, from: #require(json.data(using: .utf8)))

        #expect(payload._type == "view_submission")
        #expect(payload.enterprise?.id == "E123")
        #expect(payload.apiAppId == "A123")
        #expect(payload.triggerId == "13345224609.738474920.8088930838d88f008e0")
        #expect(payload.hash == "1711111111.abcdef")
        #expect(payload.callbackId == "test_view")
        #expect(payload.responseUrls?.first?.channelId == "C123")
        #expect(payload.functionData?.function?.callbackId == "fn_callback")
        #expect(payload.interactivity?.interactivityPointer == "111.222.333")
        #expect(payload.botAccessToken == "xwfp-valid")
    }

    @Test
    func `decode view closed payload with function fields`() throws {
        let json = """
        {
          "type": "view_closed",
          "enterprise": { "id": "E123", "name": "Acme" },
          "team": { "id": "T123", "name": "workspace" },
          "user": { "id": "U123" },
          "api_app_id": "A123",
          "is_enterprise_install": true,
          "is_cleared": false,
          "view": {
            "type": "modal",
            "id": "V456",
            "callback_id": "closed_view",
            "title": { "type": "plain_text", "text": "Closed" },
            "blocks": []
          },
          "function_data": {
            "execution_id": "Fx999",
            "function": { "callback_id": "fn_closed" },
            "inputs": { "foo": { "value": "bar" } }
          },
          "interactivity": {
            "interactivity_pointer": "444.555.666",
            "interactor": {
              "id": "U123",
              "secret": "s3cr3t"
            }
          },
          "bot_access_token": "xwfp-closed"
        }
        """

        let payload = try JSONDecoder().decode(ViewClosedPayload.self, from: #require(json.data(using: .utf8)))

        #expect(payload._type == "view_closed")
        #expect(payload.enterprise?.id == "E123")
        #expect(payload.apiAppId == "A123")
        #expect(payload.isEnterpriseInstall == true)
        #expect(payload.isCleared == false)
        #expect(payload.callbackId == "closed_view")
        #expect(payload.functionData?.function?.callbackId == "fn_closed")
        #expect(payload.interactivity?.interactivityPointer == "444.555.666")
        #expect(payload.botAccessToken == "xwfp-closed")
    }
}
