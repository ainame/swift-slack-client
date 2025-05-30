import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

@main
struct EchoSlashCommand {
    static func main() async throws {
        guard let token = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("❌ Please set SLACK_OAUTH_TOKEN and SLACK_APP_LEVEL_TOKEN environment variables")
            print("   SLACK_OAUTH_TOKEN: Bot token (starts with xoxb-)")
            print("   SLACK_APP_LEVEL_TOKEN: App-level token (starts with xapp-)")
            exit(1)
        }

        print("🚀 Starting Echo Slash Command Server...")

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "EchoSlashCommand/1.0",
                appToken: appToken,
                token: token,
            ),
        )

        let router = SocketModeMessageRouter()

        router.onSlashCommand("/echo") { context, payload in
            // `respond` uses response_url
            try await context.respond(to: payload.responseUrl, text: payload.text)

            // `say` uses chat.postMessage
            try await context.say(
                text: "Echoing via chat.postMessage: \(payload.text)",
                channel: "#\(payload.channelName)",
                username: "Echo bot",
                iconEmoji: ":speaker:",
            )

            try await Task.sleep(for: .seconds(1))

            // response_url can be re-used up-to 5 times
            try await context.respond(
                to: payload.responseUrl,
                text: "2nd post: \(payload.text)"
            )
        }

        router.onSlashCommand("/echo-private") { context, payload in
            try await context.respond(to: payload.responseUrl, text: payload.text, responseType: .ephemeral)
        }

        await slack.addSocketModeMessageRouter(router)
        try await slack.runInSocketMode()
    }
}
