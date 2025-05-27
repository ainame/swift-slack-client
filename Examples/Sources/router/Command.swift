import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackBlockKit

@main
struct Command {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appLevelToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("Prepare SLACK_OAUTH_TOKEN to run this script")
            exit(1)
        }

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "SwiftBot",
                appLevelToken: appLevelToken,
                accessToken: accessToken
            )
        )

        let router = SocketModeMessageRouter()

        router.onSocketModeMessage { context, envelope in
            print("onMessage")
        }

        router.onEvent { context, envelope in
            switch envelope.event {
            case .appMention:
                print("onEvent: appMention")
            case .message:
                print("onEvent: meessage")
            default:
                break
            }
        }

        router.onEvent(AppMentionEvent.self) { context, envelope, payload in
            print("onEvent: AppMentionEvent")
        }

        router.onInteractive { context, envelope in
            switch envelope.body {
            case .shortcut:
                print("onInteractive: .shortcut")
            case .blockActions:
                print("onInteractive: .blockActions")
            case .viewSubmission:
                print("onInteractive: .viewSubmission")
            case .viewClosed:
                print("onInteractive: .viewClosed")
            case .unsupported:
                print("onInteractive: .unsupported")
            }
        }

        router.onGlboalShortcut("run-something") { context, payload in
            print("onGlobalShortcut: \(payload.type) \(payload.callbackId!)")
        }

        router.onBlockAction("run-something") { context, payload in
            print("onGlobalShortcut: \(payload.type) \(payload.callbackId!)")
        }

        router.onSlackMessageMatched(with: "Hello", "World") { context, envelope, payload in
            print("onSlackMessageMatched: \(payload.text!)")
        }

        await slack.addSocketModeMessageRouter(router)

        try await slack.runInSocketMode()
    }
}
