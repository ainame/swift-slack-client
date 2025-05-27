import Foundation
@testable import SlackBlockKit
import Testing

// Complete example showcasing the DSL

private let jsonEncoder = JSONEncoder()
private let jsonDecoder = JSONDecoder()

@Test func exampleWelcomeModal() throws {
    let view = ViewType.modal(title: "Welcome to Slack!", submit: "Get Started") {
        Header("Welcome!")

        Section(text: "We're excited to have you join our workspace. Let's get you set up.")

        Divider()

        Input(
            label: "Full Name",
            element: TextField(
                actionId: "full_name",
                placeholder: "Enter your full name"
            )
        )

        Input(
            label: "Email",
            element: TextField(
                actionId: "email",
                placeholder: "your.email@example.com"
            ),
            hint: "We'll use this for important notifications"
        )

        Input(
            label: "Department",
            element: StaticSelect(
                actionId: "department",
                placeholder: "Choose your department",
                options: [
                    Option("Engineering", value: "eng"),
                    Option("Design", value: "design"),
                    Option("Product", value: "product"),
                    Option("Marketing", value: "marketing"),
                    Option("Sales", value: "sales")
                ]
            )
        )

        Input(
            label: "Start Date",
            element: DatePicker(
                actionId: "start_date",
                placeholder: "When do you start?"
            )
        )

        Section(text: "*Communication Preferences*", markdown: true)

        Input(
            label: "Notifications",
            element: Checkboxes(
                actionId: "notifications",
                options: [
                    Option("Email digests", value: "email_digest"),
                    Option("Desktop notifications", value: "desktop"),
                    Option("Mobile push", value: "mobile")
                ],
                initialOptions: [Option("Desktop notifications", value: "desktop")]
            ),
            optional: true
        )

        Actions {
            Button("Skip", actionId: "skip")
            Button(
                "Continue",
                actionId: "continue",
                style: .primary,
                confirm: Confirm(
                    title: "Ready to continue?",
                    text: "Make sure all your information is correct.",
                    confirm: "Yes, continue",
                    deny: "Let me check",
                    style: .primary
                )
            )
        }
    }

    let json = try jsonEncoder.encode(view)
    let decodeView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodeView == view)
}

@Test func exampleHomeTab() throws {
    let userName: String = "there"
    let view = ViewType.home {
        Header("Welcome back, \(userName)! 👋")

        Section(
            text: "Here's what's happening in your workspace:",
            accessory: Button("Refresh", actionId: "refresh_home")
        )

        Divider()

        Section(fields: [
            "*📬 Unread Messages:* 12",
            "*✅ Tasks Due Today:* 3",
            "*📅 Upcoming Meetings:* 2",
            "*👥 Team Members Online:* 24"
        ], markdown: true)

        Actions {
            Button("View Messages", actionId: "view_messages", style: .primary)
            Button("My Tasks", actionId: "view_tasks")
            Button("Calendar", actionId: "view_calendar")
        }

        Divider()

        Header("Recent Activity")

        Context {
            Text("Last updated: 2 minutes ago")
        }

        Section(text: "• Sarah posted in #general\n• Mike completed \"Update documentation\"\n• New message in #design-team")
    }

    let json = try jsonEncoder.encode(view)
    let decodeView = try jsonDecoder.decode(ViewType.self, from: json)
    #expect(decodeView == view)
}
