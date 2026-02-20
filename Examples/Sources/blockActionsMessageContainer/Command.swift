import Foundation
import SlackClient

@main
struct Command {
    static func main() throws {
        let messageContainerJSON = """
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

        let data = Data(messageContainerJSON.utf8)

        do {
            _ = try JSONDecoder().decode(SocketModeMessageEnvelope.self, from: data)
            print("Unexpected success: payload decoded without error.")
            print("This means the bug is not reproducible on the current checkout.")
            Foundation.exit(1)
        } catch {
            print("Bug reproduced: message-container block_actions fails to decode.")
            print("Decoder error: \(error)")
        }
    }
}
