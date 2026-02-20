import Foundation
import OpenAPIAsyncHTTPClient
import SlackBlockKit
import SlackClient

@main
struct Command {
    static func main() async throws {
        guard let token = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"],
              let channel = ProcessInfo.processInfo.environment["SLACK_REPRO_CHANNEL_ID"] else {
            print("Please set SLACK_OAUTH_TOKEN, SLACK_APP_LEVEL_TOKEN, and SLACK_REPRO_CHANNEL_ID.")
            print("SLACK_REPRO_CHANNEL_ID should be a channel ID like C0123456789.")
            Foundation.exit(1)
        }

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "BlockActionsMessageContainerRepro/1.0",
                appToken: appToken,
                token: token,
            ),
        )

        let router = SocketModeRouter()

        router.onSocketModeMessage { _, envelope in
            print("SocketMode envelope received: \(envelope._type)")
        }

        router.onInteractive { context, interactive in
            try await context.ack()
            switch interactive.body {
            case let .blockActions(payload):
                print("block_actions received")
                print("container.type: \(payload.container._type)")
                print("container.viewId: \(payload.container.viewId)")
                print("callbackId: \(payload.callbackId ?? "nil")")
            default:
                print("interactive payload type: \(interactive._type)")
            }
        }

        await slack.addSocketModeRouter(router)

        let blocks: [Block] = [
            .section(
                .init(
                    text: .init(
                        type: .mrkdwn,
                        text: "Click the button below to send a `block_actions` payload from a message container.",
                    ),
                ),
            ),
            .actions(
                .init(
                    elements: [
                        .button(
                            .init(
                                text: "Reproduce bug",
                                actionId: "repro_message_container",
                                value: "repro",
                            ),
                        ),
                    ],
                    blockId: "repro_message_container",
                ),
            ),
        ]

        _ = try await slack.client.chatPostMessage(
            body: .json(
                .init(
                    blocks: blocks,
                    channel: channel,
                    text: "message-container block_actions repro",
                ),
            ),
        )

        print("Posted a repro message to channel \(channel). Click the button in Slack.")
        print("If you are on the buggy revision, Socket Mode will log a parse error for missing view_id.")

        try await slack.runInSocketMode()
    }
}
