import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackBlockKit

@main
struct Command {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appLevelToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("Prepare SLACK_OAUTH_TOKEN and SLACK_APP_LEVEL_TOKEN to run this script")
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

        // Handle global shortcuts
        router.onGlboalShortcut("run-something") { context, payload in
            // Create a modal using the DSL
            let view = ViewType.modal(title: "Welcome!", submit: "Submit") {
                Header("Quick Form")

                Section(text: "Please fill out this quick form to continue.")

                Divider()

                Input(
                    label: "Your Name",
                    element: TextField(
                        actionId: "name_field",
                        placeholder: "Enter your name"
                    )
                )

                Input(
                    label: "Favorite Color",
                    element: StaticSelect(
                        actionId: "color_select",
                        placeholder: "Choose a color",
                        options: [
                            Option("Red", value: "red"),
                            Option("Green", value: "green"),
                            Option("Blue", value: "blue")
                        ]
                    )
                )

                Actions {
                    Button("Cancel", actionId: "cancel", style: .danger)
                    Button("Submit", actionId: "submit", style: .primary)
                }
            }

            // Open the modal
            let response = try await context.client.viewsOpen(
                .init(body: .json(.init(
                    view: view,
                    triggerId: payload.triggerId
                )))
            )

            print("Modal opened: \(response)")
        }

        // Handle app home opened events
        router.onEvent(AppHomeOpenedEvent.self) { context, envelope, event in
            // Create a home tab view using the DSL
            let view = ViewType.home {
                Header("Welcome to the App Home!")

                Section(
                    text: "Here's what you can do:",
                    accessory: Button("Get Started", actionId: "get_started")
                )

                Divider()

                Section(fields: [
                    "*📊 View Analytics*\nCheck your team's performance",
                    "*📝 Create Reports*\nGenerate custom reports",
                    "*👥 Team Management*\nManage your team members",
                    "*⚙️ Settings*\nConfigure your preferences"
                ], markdown: true)

                Actions {
                    Button("View Analytics", actionId: "view_analytics", style: .primary)
                    Button("Create Report", actionId: "create_report")
                    Button("Settings", actionId: "settings")
                }

                Context {
                    Text("Last updated: just now")
                }
            }

            // Publish the home tab
            let response = try await context.client.viewsPublish(
                .init(body: .json(.init(
                    userId: event.user ?? "",
                    view: view
                )))
            )

            print("Home tab published: \(response)")
        }

        // Handle interactive components
        router.onViewSubmission("") { context, payload in
            // Create a success message
            let blocks: [BlockType] = [
                Header("Success! 🎉").render(),
                Section(text: "Your form has been submitted successfully.").render(),
                Divider().render(),
                Actions {
                    Button("Done", actionId: "done", style: .primary)
                }.render()
            ]

            // Update the view
            let response = try await context.client.viewsUpdate(
                .init(body: .json(.init(
                    view: ViewType.modal(ModalView(
                        title: TextObject(type: .plainText, text: "Complete"),
                        blocks: blocks
                    )),
                    viewId: payload.view.callbackId
                )))
            )

            print("View updated: \(response)")
        }

        await slack.addSocketModeMessageRouter(router)

        print("Starting Socket Mode connection...")
        try await slack.runInSocketMode()
    }
}
