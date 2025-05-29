import Foundation
import SlackBlockKit
@testable import SlackBlockKitDSL
import Testing

// Tests for the SwiftUI-like DSL

private let jsonEncoder = JSONEncoder()
private let jsonDecoder = JSONDecoder()

@Test func improvedModal() throws {
    let view = Modal(
        title: Text("App Settings"),
    ) {
        Header {
            Text("General Settings")
        }

        Input(
            element: {
                PlainTextInput()
                    .placeholder(Text("Enter your display name"))
                    .actionId("display_name")
                    .maxLength(80)
            },
            label: {
                Text("Display Name")
            },
        )
        .hint("This is how you'll appear to others")
        .blockId("display_name_input")

        Divider()

        Section {
            Text("*Communication Preferences*").style(.mrkdwn)
        }

        Input(
            element: {
                Checkboxes {
                    Option(Text("**Email digests**").style(.mrkdwn))
                        .value("email_digest")
                        .description("Get daily summaries of activity")
                    Option(Text("Desktop notifications"))
                        .value("desktop")
                        .description("Real-time alerts on your computer")
                    Option("Mobile push")
                        .value("mobile")
                        .description("Notifications on your phone")
                }
                .initialOptions([
                    Option("Desktop notifications").value("desktop"),
                ])
                .actionId("notifications")
            },
            label: {
                Text("Notifications")
            },
        )
        .optional(true)
        .blockId("notifications_input")

        Divider()

        Actions {
            Button("Email Settings")
                .actionId("email_settings")
                .style(.primary)

            Button("Reset to Defaults")
                .actionId("reset")
                .style(.danger)
                .confirm(
                    ConfirmationDialog(
                        title: Text("Reset Settings?"),
                        text: Text("This will reset all your preferences to default values."),
                        confirm: Text("Yes, Reset"),
                        deny: Text("Cancel"),
                    ).style(.danger),
                )
        }
        .blockId("action_buttons")

        Context {
            Text("Last updated: *3 hours ago*").style(.mrkdwn)
            ContextImage(
                imageUrl: URL(string: "https://example.com/icon.png")!,
                altText: "Settings icon",
            )
        }
    }
    .submit(Text("Save Changes"))
    .close(Text("Cancel"))
    .privateMetadata("user_settings")
    .callbackId("settings_modal")
    .clearOnClose(false)
    .asView()

    let json = try jsonEncoder.encode(view)
    let decodedView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodedView == view)
}

@Test func advancedForm() throws {
    let view = Modal(
        title: Text("Employee Survey"),
    ) {
        Section {
            Text("Please complete this *quarterly survey* to help us improve.").style(.mrkdwn)
        }

        Input(
            element: {
                PlainTextInput()
                    .placeholder("John Doe")
                    .actionId("full_name")
            },
            label: {
                Text("Full Name")
            },
        )

        Input(
            element: {
                PlainTextInput()
                    .multiline()
                    .minLength(50)
                    .maxLength(500)
                    .placeholder("Share your thoughts...")
                    .actionId("feedback")
                    .dispatchActionConfig(
                        DispatchActionConfig(triggerActionsOn: [.onEnterPressed]),
                    )
            },
            label: {
                Text("Feedback")
            },
        )
        .hint("Please be specific and constructive")
        .optional(false)

        Section()
            .accessory(
                Button(Text("Rate: 5 ⭐️").style(.mrkdwn))
                    .actionId("rate_5")
                    .value("5"),
            )

        Context {
            Text("Your feedback is *anonymous* and helps us improve").style(.mrkdwn)
        }
    }
    .submit(Text("Submit Survey"))
    .notifyOnClose(true)
    .asView()

    let json = try jsonEncoder.encode(view)
    let decodedView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodedView == view)
}

@Test func simpleModal() throws {
    let view = Modal(title: Text("Settings")) {
        Section {
            Text("Configure your *notification preferences*").style(.mrkdwn)
        }

        Input(
            element: {
                Checkboxes {
                    Option(Text("Email notifications").style(.plainText))
                        .value("email")
                    Option(Text("Push notifications"))
                        .value("push")
                }
                .actionId("notification_types")
            },
            label: {
                Text("Notification Types")
            },
        )
        .optional(true)

        Divider()

        Actions {
            Button("Save")
                .style(.primary)
                .actionId("save_settings")

            Button("Cancel")
                .actionId("cancel")
        }
    }
    .submit(Text("Apply"))
    .close(Text("Close"))
    .asView()

    let json = try jsonEncoder.encode(view)
    let decodedView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodedView == view)
}

@Test func textStyling() throws {
    let view = Modal(title: Text("Text Styling Demo")) {
        Section {
            Text("This is *bold* text with _italics_").style(.mrkdwn)
        }

        Section {
            Text("**Field 1**").style(.mrkdwn)
            Text("Plain text field").style(.plainText)
            Text("~Strikethrough~ text").style(.mrkdwn)
        }

        Context {
            Text("Context with *markdown*").style(.mrkdwn)
            Text("Plain context text")
        }
    }
    .asView()

    let json = try jsonEncoder.encode(view)
    let decodedView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodedView == view)
}

@Test func sectionIntelligentTextFields() throws {
    let view = Modal(title: Text("Section Examples")) {
        // Single text becomes section.text
        Section {
            Text("This single text becomes the section's main text").style(.mrkdwn)
        }

        Divider()

        // Multiple texts become section.fields
        Section {
            Text("**Name:** John Doe").style(.mrkdwn)
            Text("**Role:** Developer").style(.mrkdwn)
            Text("**Team:** Platform").style(.mrkdwn)
        }

        Divider()

        // Section with accessory only
        Section()
            .accessory(
                Button("View Profile")
                    .actionId("view_profile")
                    .style(.primary),
            )

        // Section with text and accessory
        Section {
            Text("Click the button to learn more →").style(.mrkdwn)
        }
        .accessory(
            Button("Learn More")
                .actionId("learn_more")
                .url(URL(string: "https://example.com/docs")!),
        )
    }
    .asView()

    let json = try jsonEncoder.encode(view)
    let decodedView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodedView == view)
}

@Test func textModifiers() throws {
    // Test plain text with emoji
    let plainText = Text("Hello 👋")
        .style(.plainText)
        .emoji(true)

    let plainTextObject = plainText.render()
    #expect(plainTextObject.type == .plainText)
    #expect(plainTextObject.text == "Hello 👋")
    #expect(plainTextObject.emoji == true)
    #expect(plainTextObject.verbatim == nil)

    // Test markdown with verbatim
    let markdownText = Text("*Bold* and _italic_")
        .style(.mrkdwn)
        .verbatim(true)

    let markdownTextObject = markdownText.render()
    #expect(markdownTextObject.type == .mrkdwn)
    #expect(markdownTextObject.text == "*Bold* and _italic_")
    #expect(markdownTextObject.emoji == nil)
    #expect(markdownTextObject.verbatim == true)
}

@Test func optionBuilding() throws {
    let option = Option(Text("Email notifications").style(.mrkdwn))
        .value("email")
        .description("Get daily email summaries")
        .url(URL(string: "https://example.com/settings")!)

    let optionObject = option.render()
    #expect(optionObject.text.text == "Email notifications")
    #expect(optionObject.value == "email")
    #expect(optionObject.description?.text == "Get daily email summaries")
    #expect(optionObject.url?.absoluteString == "https://example.com/settings")
}

@Test func buttonModifiers() throws {
    let button = Button("Click me")
        .actionId("click_action")
        .style(.primary)
        .value("clicked")
        .accessibilityLabel("Click this button")

    let actionElement = button.asActionElement()

    switch actionElement {
    case let .button(buttonElement):
        #expect(buttonElement.text.text == "Click me")
        #expect(buttonElement.actionId == "click_action")
        #expect(buttonElement.style == .primary)
        #expect(buttonElement.value == "clicked")
        #expect(buttonElement.accessibilityLabel == "Click this button")
    default:
        Issue.record("Expected button element")
    }
}

@Test func checkboxesInitialOptions() throws {
    let checkboxes = Checkboxes {
        Option("Option A").value("a")
        Option("Option B").value("b")
        Option("Option C").value("c")
    }
    .initialOptions([
        Option("Option A").value("a"),
        Option("Option B").value("b"),
    ])
    .actionId("multi_select")
    .focusOnLoad(true)

    let inputElement = checkboxes.asInputElement()

    switch inputElement {
    case let .checkboxes(checkboxesElement):
        #expect(checkboxesElement.options.count == 3)
        #expect(checkboxesElement.initialOptions?.count == 2)
        #expect(checkboxesElement.actionId == "multi_select")
        #expect(checkboxesElement.focusOnLoad == true)
    default:
        Issue.record("Expected checkboxes element")
    }
}

@Test func autoclosureModifiers() throws {
    // Test Button with autoclosure confirm
    let button = Button("Delete")
        .actionId("delete_action")
        .style(.danger)
        .confirm(
            ConfirmationDialog(
                title: Text("Are you sure?"),
                text: Text("This action cannot be undone."),
                confirm: Text("Yes, delete"),
                deny: Text("Cancel"),
            ).style(.danger),
        )

    let actionElement = button.asActionElement()
    switch actionElement {
    case let .button(buttonElement):
        #expect(buttonElement.confirm != nil)
        #expect(buttonElement.confirm?.title.text == "Are you sure?")
        #expect(buttonElement.confirm?.style == .danger)
    default:
        Issue.record("Expected button element")
    }

    // Test PlainTextInput with autoclosure placeholder
    let input = PlainTextInput()
        .placeholder(Text("Enter your email address").emoji(false))
        .actionId("email_input")

    let inputElement = input.asInputElement()
    switch inputElement {
    case let .plainTextInput(plainTextElement):
        #expect(plainTextElement.placeholder?.text == "Enter your email address")
        #expect(plainTextElement.placeholder?.emoji == false)
    default:
        Issue.record("Expected plain text input element")
    }

    // Test Checkboxes with autoclosure confirm
    let checkboxes = Checkboxes {
        Option("Delete all data").value("delete_all")
    }
    .confirm(
        ConfirmationDialog(
            title: Text("Confirm deletion"),
            text: Text("This will delete all your data permanently."),
            confirm: Text("Delete"),
            deny: Text("Keep my data"),
        ).style(.danger),
    )

    let checkboxElement = checkboxes.asActionElement()
    switch checkboxElement {
    case let .checkboxes(element):
        #expect(element.confirm?.title.text == "Confirm deletion")
    default:
        Issue.record("Expected checkboxes element")
    }

    // Test Section with autoclosure accessory
    let section = Section {
        Text("Click to continue →").style(.mrkdwn)
    }
    .accessory(
        Button("Continue")
            .actionId("continue_action")
            .style(.primary),
    )

    let sectionBlock = section.render()
    switch sectionBlock {
    case let .section(block):
        #expect(block.accessory != nil)
        switch block.accessory {
        case let .button(button)?:
            #expect(button.text.text == "Continue")
            #expect(button.style == .primary)
        default:
            Issue.record("Expected button accessory")
        }
    default:
        Issue.record("Expected section block")
    }
}
