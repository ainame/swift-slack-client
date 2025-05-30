import Foundation
import OpenAPIAsyncHTTPClient
import SlackBlockKitDSL
import SlackClient

@main
struct Command {
    static func main() async throws {
        guard let token = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("Prepare SLACK_OAUTH_TOKEN and SLACK_APP_LEVEL_TOKEN to run this script")
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

        let router = SocketModeMessageRouter()

        // Handle global shortcuts
        router.onGlboalShortcut("run-something") {
            context,
                payload in
            // Create a modal using the new SwiftUI-like DSL
            let view = Modal(
                title: Text("Welcome!"),
            ) {
                Header {
                    Text("Quick Form")
                }

                Section {
                    Text("Please fill out this quick form to continue.")
                }

                Divider()

                Input {
                    PlainTextInput()
                        .actionId("name_field")
                        .placeholder("Enter your name")
                } label: {
                    Text("Your Name")
                }

                Input {
                    StaticSelect {
                        Option("Red").value("red")
                        Option("Green").value("green")
                        Option("Blue").value("blue")
                    }
                    .actionId("color_select")
                    .placeholder(Text("Choose a color"))
                } label: {
                    Text("Favorite Color")
                }

                Input {
                    RadioButtons {
                        Option("Small").value("small")
                        Option("Medium").value("medium")
                        Option("Large").value("large")
                    }
                    .actionId("size_select")
                } label: {
                    Text("Size Preference")
                }

                Input {
                    Checkboxes {
                        Option("📧 Email notifications").value("email")
                        Option("📱 Push notifications").value("push")
                        Option("🔔 Desktop notifications").value("desktop")
                        Option("📊 Weekly reports").value("reports")
                    }
                    .actionId("notifications")
                } label: {
                    Text("Notification Preferences")
                }

                Input {
                    UsersSelect()
                        .actionId("manager_select")
                        .placeholder("Select your manager")
                } label: {
                    Text("Manager")
                }
                .optional(true)

                Input {
                    DatePicker()
                        .actionId("start_date")
                        .placeholder("Select start date")
                } label: {
                    Text("Start Date")
                }

                Actions {
                    Button("Cancel")
                        .actionId("cancel")
                        .style(.danger)

                    Button("Submit")
                        .actionId("submit")
                        .style(.primary)
                }
            }
            .submit(Text("Submit"))
            .callbackId("quick_form_modal")
            .asView()

            // Open the modal
            let response = try await context.client.viewsOpen(
                .init(body: .json(.init(
                    view: view,
                    triggerId: payload.triggerId,
                ))),
            )

            print("Modal opened: \(response)")
        }

        // Handle app home opened events
        router.onEvent(AppHomeOpenedEvent.self) { context, _, event in
            // Create a home tab view using the new DSL
            let view = HomeTab {
                Header {
                    Text("Welcome to the App Home! 🏠")
                }

                Section {
                    Text("Here's what you can do:")
                }
                .accessory(
                    Button("Get Started")
                        .actionId("get_started")
                        .style(.primary),
                )

                Divider()

                Section {
                    Text("*📊 View Analytics*\nCheck your team's performance").style(.mrkdwn)
                    Text("*📝 Create Reports*\nGenerate custom reports").style(.mrkdwn)
                    Text("*👥 Team Management*\nManage your team members").style(.mrkdwn)
                    Text("*⚙️ Settings*\nConfigure your preferences").style(.mrkdwn)
                }

                Actions {
                    Button("View Analytics")
                        .actionId("view_analytics")
                        .style(.primary)

                    Button("Create Report")
                        .actionId("create_report")

                    Button("Settings")
                        .actionId("settings")
                }

                Context {
                    Text("Last updated: just now")
                    ContextImage(
                        imageUrl: URL(string: "https://api.slack.com/img/blocks/bkb_template_images/appHomeNewUser.png")!,
                        altText: "App Home",
                    )
                }
            }
            .asView()

            // Publish the home tab
            let response = try await context.client.viewsPublish(
                .init(body: .json(.init(
                    userId: event.user ?? "",
                    view: view,
                ))),
            )

            print("Home tab published: \(response)")
        }

        // Handle interactive components
        router.onBlockAction("quick_form_modal") { context, payload in
            // Create a success message modal
            let view = Modal(
                title: Text("Complete ✅"),
            ) {
                Header {
                    Text("Success! 🎉")
                }

                Section {
                    Text("Your form has been submitted successfully.").style(.plainText)
                }

                Divider()

                Section {
                    Text("*What happens next?*").style(.mrkdwn)
                    Text("• Your data has been saved").style(.mrkdwn)
                    Text("• You'll receive a confirmation email").style(.mrkdwn)
                    Text("• Our team will review your submission").style(.mrkdwn)
                }

                Actions {
                    Button("Done")
                        .actionId("done")
                        .style(.primary)
                        .confirm(
                            ConfirmationDialog(
                                title: Text("Are you sure?"),
                                text: Text("This will close the form."),
                                confirm: Text("Yes, close it"),
                                deny: Text("Cancel"),
                            ),
                        )
                }
            }
            .clearOnClose(true)
            .asView()

            // Update the view
            let response = try await context.client.viewsUpdate(
                .init(body: .json(.init(
                    view: view,
                    viewId: payload.container.viewId,
                ))),
            )

            print("View updated: \(response)")
        }

        // Handle button actions
        router.onBlockAction("done") { _, _ in
            // Close the modal
            print("Done button clicked, closing modal")
        }

        // Handle additional interactive actions
        router.onBlockAction("get_started") { context, payload in
            // Create an advanced form modal showcasing option groups
            let view = Modal(
                title: Text("Advanced Settings"),
            ) {
                Header {
                    Text("Configure Your Preferences")
                }

                Section {
                    Text("*Choose your preferred settings from the organized categories below.*").style(.mrkdwn)
                }

                Input {
                    StaticSelect {
                        OptionGroup(label: "Development") {
                            Option("🐍 Python").value("python")
                            Option("☕ Java").value("java")
                            Option("🦀 Rust").value("rust")
                            Option("🔷 TypeScript").value("typescript")
                        }
                        OptionGroup(label: "Design") {
                            Option("🎨 Figma").value("figma")
                            Option("✨ Sketch").value("sketch")
                            Option("🌈 Adobe XD").value("xd")
                        }
                        OptionGroup(label: "Management") {
                            Option("📊 Jira").value("jira")
                            Option("📝 Notion").value("notion")
                            Option("📋 Trello").value("trello")
                        }
                    }
                    .actionId("category_select")
                    .placeholder("Select from categories")
                } label: {
                    Text("Primary Tool")
                }

                Input {
                    ConversationsSelect()
                        .actionId("channel_select")
                        .placeholder("Select a channel")
                        .defaultToCurrentConversation(false)
                } label: {
                    Text("Default Channel")
                }

                Input {
                    NumberInput()
                        .actionId("hours_input")
                        .placeholder("Enter hours per week")
                        .minValue("1")
                        .maxValue("168")
                } label: {
                    Text("Work Hours Per Week")
                }

                Actions {
                    Button("Cancel")
                        .actionId("cancel_advanced")

                    Button("Save Settings")
                        .actionId("save_advanced")
                        .style(.primary)
                }
            }
            .callbackId("advanced_settings_modal")
            .asView()

            // Open the advanced modal
            let response = try await context.client.viewsOpen(
                .init(body: .json(.init(
                    view: view,
                    triggerId: payload.triggerId,
                ))),
            )

            print("Advanced modal opened: \(response)")
        }

        await slack.addSocketModeMessageRouter(router)

        // This is demo so this doesn't automatically reconnect to socket when disconnected
        print("Starting Socket Mode connection...")
        try await slack.runInSocketMode()
    }
}
