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
            // Create a modal using the new SwiftUI-like DSL
            let view = Modal(
                title: Text("Welcome!")
            ) {
                Header {
                    Text("Quick Form")
                }

                Section {
                    Text("Please fill out this quick form to continue.")
                }

                Divider()

                Input(
                    element: {
                        PlainTextInput()
                            .actionId("name_field")
                            .placeholder("Enter your name")
                    },
                    label: {
                        Text("Your Name")
                    }
                )

                Input(
                    element: {
                        StaticSelect()
                            .actionId("color_select")
                            .placeholder(Text("Choose a color"))
                            .options([
                                Option("Red").value("red"),
                                Option("Green").value("green"),
                                Option("Blue").value("blue")
                            ])
                    },
                    label: {
                        Text("Favorite Color")
                    }
                )

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
                    triggerId: payload.triggerId
                )))
            )

            print("Modal opened: \(response)")
        }

        // Handle app home opened events
        router.onEvent(AppHomeOpenedEvent.self) { context, envelope, event in
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
                        .style(.primary)
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
                        altText: "App Home"
                    )
                }
            }
            .asView()

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
        router.onBlockAction("quick_form_modal") { context, payload in
            // Create a success message modal
            let view = Modal(
                title: Text("Complete ✅")
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
                                deny: Text("Cancel")
                            )
                        )
                }
            }
            .clearOnClose(true)
            .asView()

            // Update the view
            let response = try await context.client.viewsUpdate(
                .init(body: .json(.init(
                    view: view,
                    viewId: payload.container.value["view_id"] as? String ?? ""
                )))
            )

            print("View updated: \(response)")
        }

        // Handle button actions
        router.onBlockAction("done") { context, payload in
            // Close the modal
            print("Done button clicked, closing modal")
        }

        await slack.addSocketModeMessageRouter(router)

        print("Starting Socket Mode connection...")
        try await slack.runInSocketMode()
    }
}

// MARK: - Additional DSL Components

// Extension to create StaticSelect for the DSL
public struct StaticSelect: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var options: [Option]?
    private var optionGroups: [OptionGroup]?
    private var actionId: String?
    private var initialOption: Option?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?
    
    public init() {}
    
    public func options(_ options: [Option]) -> StaticSelect {
        var copy = self
        copy.options = options
        return copy
    }
    
    public func actionId(_ id: String) -> StaticSelect {
        var copy = self
        copy.actionId = id
        return copy
    }
    
    public func placeholder(_ placeholder: Text) -> StaticSelect {
        var copy = self
        copy.placeholder = placeholder
        return copy
    }
    
    public func placeholder(_ placeholder: String) -> StaticSelect {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }
    
    public func initialOption(_ option: Option) -> StaticSelect {
        var copy = self
        copy.initialOption = option
        return copy
    }
    
    public func focusOnLoad(_ focus: Bool = true) -> StaticSelect {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }
    
    public func asInputElement() -> InputElementType {
        .staticSelect(StaticSelectElement(
            options: options?.map { $0.render() },
            optionGroups: nil,
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
    
    public func asActionElement() -> ActionElementType {
        .staticSelect(StaticSelectElement(
            options: options?.map { $0.render() },
            optionGroups: nil,
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
    
    public func asSectionAccessory() -> SectionAccessory {
        .staticSelect(StaticSelectElement(
            options: options?.map { $0.render() },
            optionGroups: nil,
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// Extension for OptionGroup support
public struct OptionGroup {
    private var label: Text
    private var options: [Option]
    
    public init(label: Text, @OptionBuilder options: () -> [Option]) {
        self.label = label
        self.options = options()
    }
    
    public func render() -> OptionGroupObject {
        OptionGroupObject(
            label: label.render(),
            options: options.map { $0.render() }
        )
    }
}

// Extension to create HomeTab for the DSL
public struct HomeTab: ViewConvertible {
    private var blocks: [BlockType]
    private var privateMetadata: String?
    private var callbackId: String?
    private var externalId: String?
    
    public init(@BlockBuilder blocks: () -> [BlockType]) {
        self.blocks = blocks()
    }
    
    public func privateMetadata(_ metadata: String) -> HomeTab {
        var copy = self
        copy.privateMetadata = metadata
        return copy
    }
    
    public func callbackId(_ id: String) -> HomeTab {
        var copy = self
        copy.callbackId = id
        return copy
    }
    
    public func externalId(_ id: String) -> HomeTab {
        var copy = self
        copy.externalId = id
        return copy
    }
    
    public func asView() -> ViewType {
        .homeTab(HomeTabView(
            blocks: blocks,
            privateMetadata: privateMetadata,
            callbackId: callbackId,
            externalId: externalId
        ))
    }
}
