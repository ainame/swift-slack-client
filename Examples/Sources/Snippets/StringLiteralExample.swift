import SlackBlockKit
import SlackBlockKitDSL

enum StringLiteralExamples {
    // MARK: - Clean String Literal Syntax Examples

    // ✅ Before: Verbose .asTextObject() calls
    struct OldStyleModal: SlackModalView {
        var title: TextObject {
            TextObject(type: .plainText, text: "Old Style")
        }

        var submit: TextObject? {
            TextObject(type: .plainText, text: "Submit")
        }

        var blocks: [Block] {
            Section {
                Text("This was the old verbose way")
            }
        }
    }

    // ✨ After: Clean string literals (ExpressibleByStringLiteral)
    struct NewStyleModal: SlackModalView {
        var title: TextObject {
            "Clean Style" // ✨ String literal becomes TextObject automatically!
        }

        var submit: TextObject? {
            "Submit" // ✨ So much cleaner!
        }

        var blocks: [Block] {
            Section {
                Text("This is the new clean way!")
            }
        }
    }

    // MARK: - Real-World Examples

    struct UserProfileModal: SlackModalView {
        let user: User

        struct User {
            let name: String
            let email: String
            let role: String
            let isActive: Bool
        }

        var title: TextObject {
            TextObject(type: .plainText, text: "User Profile: \(user.name)") // ✨ String interpolation works!
        }

        var submit: TextObject? {
            "Save Changes"
        }

        var close: TextObject? {
            "Cancel"
        }

        var callbackId: String? {
            "user_profile_modal"
        }

        var blocks: [Block] {
            Header {
                Text("👤 \(user.name)")
            }

            Section {
                Text("**Email:** \(user.email)")
                    .type(.mrkdwn)
                Text("**Role:** \(user.role)")
                    .type(.mrkdwn)
                Text("**Status:** \(user.isActive ? "Active" : "Inactive")")
                    .type(.mrkdwn)
            }

            Divider()

            Input(
                element: {
                    PlainTextInput()
                        .actionId("user_name")
                        .initialValue(user.name)
                        .placeholder(Text("Enter user name"))
                },
                label: {
                    Text("Full Name") // ✨ Direct string works here too!
                },
            )

            Actions {
                Button("Reset to Default")
                    .actionId("reset_user")
                    .style(.danger)

                Button(user.isActive ? "Deactivate" : "Activate")
                    .actionId("toggle_status")
            }
        }
    }

    struct TeamDashboard: SlackHomeTabView {
        let teamName: String
        let members: [String]
        let metrics: Metrics

        struct Metrics {
            let totalMessages: Int
            let activeProjects: Int
            let completedTasks: Int
        }

        var externalId: String? {
            "team_dashboard_\(teamName.lowercased())"
        }

        var blocks: [Block] {
            Header {
                Text("🏢 \(teamName) Dashboard")
            }

            Section {
                Text("*📊 Team Metrics*")
                    .type(.mrkdwn)
            }

            Section {
                Text("💬 Messages: \(metrics.totalMessages)")
                Text("🚀 Active Projects: \(metrics.activeProjects)")
                Text("✅ Completed Tasks: \(metrics.completedTasks)")
            }

            Divider()

            Header {
                Text("👥 Team Members (\(members.count))")
            }

            for member in members {
                Section {
                    Text("• \(member)")
                }
            }

            Actions {
                Button("Add Member")
                    .actionId("add_member")
                    .style(.primary)

                Button("View Analytics")
                    .actionId("view_analytics")
            }
        }
    }

    // MARK: - Usage Demonstration

    static func demonstrateStringLiterals() {
        // ✨ All string literals work seamlessly
        let oldModal = OldStyleModal()
        let newModal = NewStyleModal()

        print("Old style title: '\(oldModal.title.text)'")
        print("New style title: '\(newModal.title.text)'") // Same result, cleaner code!

        // ✨ Real-world examples
        let user = UserProfileModal.User(
            name: "Alice Johnson",
            email: "alice@company.com",
            role: "Senior Developer",
            isActive: true,
        )

        let profileModal = UserProfileModal(user: user)
        let profileView = profileModal.render()

        print("Profile modal title: '\(profileView.title.text)'")

        // ✨ Home tab example
        let metrics = TeamDashboard.Metrics(
            totalMessages: 1247,
            activeProjects: 8,
            completedTasks: 156,
        )

        let dashboard = TeamDashboard(
            teamName: "Engineering",
            members: ["Alice", "Bob", "Charlie", "Diana"],
            metrics: metrics,
        )

        let dashboardView = dashboard.render()
        print("Dashboard has \(dashboardView.blocks.count) blocks")

        // ✨ String literals work everywhere
        print("String literals make the API much cleaner!")
    }
}
