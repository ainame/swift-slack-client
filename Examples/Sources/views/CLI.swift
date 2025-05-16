import Foundation
import SlackClient
import OpenAPIAsyncHTTPClient

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

        let result = try await slack.client.viewsOpen(
            body: .json(
                .init(view: "view", triggerId: "")
            )
        )

        debugPrint(try result.ok.body.json)
    }
}
