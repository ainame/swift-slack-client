import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

@main
struct CLI {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"] else {
            print("Prepare SLACK_OAUTH_TOKEN to run this script")
            exit(1)
        }

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "SwiftBot",
                accessToken: accessToken
            )
        )

        let router = SlackMessageRouter()
        router.onInteractive { client, envelope in
            switch envelope.body {
            case .shortcut(let payload):
                print(payload.callbackId ?? "callback id")
            default:
                break
            }
        }
        await slack.addMessageRouter(router)

        try await slack.runInSocketMode()
    }
}
