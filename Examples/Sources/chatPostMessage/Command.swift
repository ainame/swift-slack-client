import Foundation
import SlackClient
import OpenAPIAsyncHTTPClient

@main
struct Command {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"] else {
            print("Prepare SLACK_OAUTH_TOKEN to run this script")
            exit(1)
        }

        guard CommandLine.arguments.count >= 3 else {
            print("Pass a channel and a message")
            exit(1)
        }

        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "SwiftBot",
                accessToken: accessToken
            )
        )

        let channel = CommandLine.arguments[1]
        let message = CommandLine.arguments[2]
        let result = try await slack.client.chatPostMessage(
            body: .json(
                .init(channel: channel, text: message)
            )
        )
        debugPrint(try result.ok.body.json)
    }
}
