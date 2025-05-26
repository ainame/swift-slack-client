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

        let router = SlackMessageRouter()
        router.onInteractive { client, envelope in
            switch envelope.body {
            case .shortcut(let payload):
                print(payload)
                let view: ModalView  = ModalView(
                    title: .init(type: .plainText, text: "Modal test"),
                    blocks: [
                        .section(.init(text: .init(type: .plainText, text: "Section")))
                    ]
                )
                let resp = try await client.viewsOpen(.init(body: .json(.init(view: .modal(view), triggerId: payload.triggerId))))
                print(try resp.ok.body.json)
            default:
                break
            }
        }
        await slack.addMessageRouter(router)

        try await slack.runInSocketMode()
    }
}
