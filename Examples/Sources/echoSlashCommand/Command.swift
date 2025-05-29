import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

@main
struct EchoSlashCommand {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appLevelToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
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
                appLevelToken: appLevelToken,
                accessToken: accessToken,
            ),
        )

        let router = SocketModeMessageRouter()

        // Handle /echo slash command
        router.onSlashCommand("/echo") { context, payload in
            print("📨 Received /echo command:")
            print("   Text: '\(payload.text)'")
            print("   User: @\(payload.userName)")
            print("   Channel: #\(payload.channelName)")
            print("   User ID: \(payload.userId)")
            print("   Channel ID: \(payload.channelId)")

            let text = payload.text.trimmingCharacters(in: .whitespacesAndNewlines)

            let responseText: String
            let responseType: String

            if text.isEmpty {
                responseText = """
                👋 Hello <@\(payload.userId)>! I'm an echo bot.

                **Usage:** `/echo <message>`

                I'll echo your message back to the channel for everyone to see!

                **Examples:**
                • `/echo Hello, World!`
                • `/echo Testing 123`
                """
                responseType = "ephemeral" // Only visible to the user
            } else {
                responseText = "🔊 <@\(payload.userId)> says: \(text)"
                responseType = "in_channel" // Visible to everyone
            }

            // Send response
            do {
                if responseType == "in_channel" {
                    // Post to channel for everyone to see
                    let response = try await context.client.chatPostMessage(
                        body: .json(.init(
                            channel: payload.channelId,
                            text: responseText,
                            unfurlLinks: false,
                            unfurlMedia: false,
                        )),
                    )

                    let result = try response.ok.body.json
                    print("✅ Echo sent to channel: \(result.ts ?? "unknown timestamp")")
                } else {
                    // Send ephemeral message (only visible to the user)
                    let response = try await context.client.chatPostEphemeral(
                        body: .json(.init(
                            channel: payload.channelId,
                            user: payload.userId,
                            text: responseText,
                        )),
                    )

                    _ = try response.ok.body.json
                    print("✅ Help message sent privately to user")
                }
            } catch {
                print("❌ Error sending response: \(error)")

                // Try to send an error message to the user
                do {
                    _ = try await context.client.chatPostEphemeral(
                        body: .json(.init(
                            channel: payload.channelId,
                            user: payload.userId,
                            text: "❌ Sorry, I encountered an error processing your command. Please try again.",
                        )),
                    )
                    print("✅ Error message sent to user")
                } catch {
                    print("❌ Failed to send error message: \(error)")
                }
            }
        }

        // Handle /echo-private slash command (always responds privately)
        router.onSlashCommand("/echo-private") { context, payload in
            print("📨 Received /echo-private command:")
            print("   Text: '\(payload.text)'")
            print("   User: @\(payload.userName)")

            let text = payload.text.trimmingCharacters(in: .whitespacesAndNewlines)

            let responseText = if text.isEmpty {
                """
                🤫 This is the private echo command!

                **Usage:** `/echo-private <message>`

                I'll echo your message back, but only you can see it.
                """
            } else {
                "🤫 Your private echo: \(text)"
            }

            // Always send ephemeral response
            do {
                let response = try await context.client.chatPostEphemeral(
                    body: .json(.init(
                        channel: payload.channelId,
                        user: payload.userId,
                        text: responseText,
                    )),
                )

                _ = try response.ok.body.json
                print("✅ Private echo sent to user")
            } catch {
                print("❌ Error sending private echo: \(error)")
            }
        }

        // Debug: Log all socket mode messages
        router.onSocketModeMessage { _, envelope in
            print("🔍 Socket Mode message:")
            print("   Type: \(envelope._type)")
            print("   Request ID: \(envelope.envelopeId)")

            // Log slash command details
            if case let .slashCommands(payload) = envelope.payload {
                print("   Slash Command: \(payload.command)")
                print("   Text: '\(payload.text)'")
            }

            // Note: Socket Mode acknowledgment is handled automatically by the framework
        }

        await slack.addSocketModeMessageRouter(router)

        print("🔌 Connecting to Slack via Socket Mode...")
        print("💡 Ready to handle slash commands!")
        print("   • Public echo: /echo Hello, World!")
        print("   • Private echo: /echo-private Secret message")
        print("   • Get help: /echo (without text)")
        print("   Press Ctrl+C to stop the server")

        try await slack.runInSocketMode()
    }
}
