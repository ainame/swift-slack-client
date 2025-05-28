import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

@main
struct ThreadExpander {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appLevelToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("❌ Please set SLACK_OAUTH_TOKEN and SLACK_APP_LEVEL_TOKEN")
            exit(1)
        }

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                appLevelToken: appLevelToken,
                accessToken: accessToken
            )
        )

        let authResponse = try await slack.client.authTest()
        guard let workspaceUrl = try authResponse.ok.body.json.url else {
            print("❌ Could not get workspace url")
            exit(1)
        }

        let workspace = workspaceUrl
            .replacingOccurrences(of: "https://", with: "")
            .replacingOccurrences(of: ".slack.com/", with: "")

        let router = SocketModeMessageRouter()

        router.onEvent(MessageEvent.self) { context, envelope, messageEvent in
            guard let threadTs = messageEvent.threadTs,
                  let messageTs = messageEvent.ts,
                  threadTs != messageTs,
                  messageEvent.botId == nil,
                  let channel = messageEvent.channel else { return }

            let permalink = messageTs.replacingOccurrences(of: ".", with: "")
            let threadLink = "https://\(workspace).slack.com/archives/\(channel)/p\(permalink)?thread_ts=\(threadTs)"

            _ = try await context.client.chatPostMessage(
                body: .json(.init(
                    channel: channel,
                    text: threadLink
                ))
            )
        }

        await slack.addSocketModeMessageRouter(router)

        print("🧵 Thread Expander started. Press Ctrl+C to stop.")
        try await slack.runInSocketMode()
    }
}
