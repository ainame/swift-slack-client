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

        let result = try await slack.client.viewsOpen(.init(body: .json(.init(view: .init()))))
        debugPrint(try result.ok.body.json)
    }
}
