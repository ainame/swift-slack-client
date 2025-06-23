import Foundation
import OpenAPIAsyncHTTPClient
import SlackBlockKitDSL
import SlackClient

@main
struct Command {
    static func main() async throws {
        guard let token = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("Prepare SLACK_OAUTH_TOKEN to run this script")
            exit(1)
        }

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "SwiftBot",
                appToken: appToken,
                token: token,
            ),
        )

        let router = SocketModeRouter()

        router.onSocketModeMessage { _, _ in
            print("onMessage")
        }

        router.onEvent { context, envelope in
            try await context.ack()

            switch envelope.event {
            case .appMention:
                print("onEvent: appMention")
            case .message:
                print("onEvent: meessage")
            default:
                break
            }
        }

        router.onEvent(AppMentionEvent.self) { context, _, _ in
            try await context.ack()
            print("onEvent: AppMentionEvent")
        }

        router.onInteractive { context, envelope in
            try await context.ack()

            switch envelope.body {
            case .shortcut:
                print("onInteractive: .shortcut")
            case .messageAction:
                print("onInteractive: .messageAction")
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
            try await context.ack()
            print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
        }

        router.onBlockAction("run-something") { context, payload in
            try await context.ack()
            print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
        }

        router.onSlackMessageMatched(with: "Hello", "World") { context, _, payload in
            try await context.ack()
            print("onSlackMessageMatched: \(payload.text!)")
        }

        await slack.addSocketModeRouter(router)

        try await slack.runInSocketMode()
    }
}
