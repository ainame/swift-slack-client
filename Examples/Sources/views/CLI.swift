import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackBlockKit

@main
struct CLI {
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

        router.onSocketModeMessage { api, envelope in
            print("onMessage")
        }

        router.onEvent { api, envelope in
            switch envelope.event {
            case .appMention:
                print("global onEvent appMention")
            case .message:
                print("global onEvent meessage")
            default:
                break
            }
        }

        router.onEvent(AppMentionEvent.self) { api, envelope, payload in
            print("onEvent(AppMentionEvent.self)")
        }

        router.onInteractive { context, envelope in
            switch envelope.body {
            case .shortcut(let payload):
                print(payload)
                let view: ModalView  = ModalView(
                    title: .init(type: .plainText, text: "Modal test"),
                    blocks: [
                        .section(.init(text: .init(type: .plainText, text: "Section")))
                    ]
                )
                let resp = try await context.client.viewsOpen(.init(body: .json(.init(view: .modal(view), triggerId: payload.triggerId))))
                print(try resp.ok.body.json)
            default:
                break
            }
        }

        router.onGlboalShortcut("run-something") { api, payload in
            print("onGlobalShortcut: \(payload.type) \(payload.callbackId!)")
        }

        router.onBlockAction("run-something") { api, payload in
            print("onGlobalShortcut: \(payload.type) \(payload.callbackId!)")
        }

        router.onSlackMessageMatched(with: "Hello", "World") { api, envelope, payload in
            print("onSlackMessageMatched: \(payload.text!)")
        }

        await slack.addSocketModeMessageRouter(router)

        try await slack.runInSocketMode()
    }
}
