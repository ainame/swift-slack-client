import Foundation
import SlackBlockKit
import SlackBlockKitDSL

enum SlackViewExamples {
    // MARK: - Example SlackViews

    /// A reusable user profile card view
    struct UserProfileCard: SlackView {
        let name: String
        let email: String
        let avatarUrl: String?

        var blocks: [Block] {
            Section {
                Text("*\(name)*").type(.mrkdwn)
                Text(email)
            }
            // Note: Image elements need to use ImageAccessory for section accessories
            .accessory(
                ImageAccessory(
                    altText: "\(name)'s avatar",
                    imageUrl: URL(string: avatarUrl ?? "https://via.placeholder.com/150")!,
                ),
            )
        }
    }

    /// A settings form view
    struct UserSettingsForm: SlackView {
        let user: User

        struct User {
            let name: String
            let email: String
            let notifications: Bool
            let timezone: String
        }

        var blocks: [Block] {
            // Header
            Section {
                Text("*User Settings*").type(.mrkdwn)
                Text("Configure your preferences below")
            }

            Divider()

            // Profile section - embedding another SlackView
            UserProfileCard(
                name: user.name,
                email: user.email,
                avatarUrl: nil,
            )

            Divider()

            // Settings inputs
            Input(
                element: {
                    Checkboxes {
                        Option("Email notifications")
                            .value("email")
                        // Note: Option doesn't have initiallySelected
                        Option("Push notifications")
                            .value("push")
                        Option("SMS notifications")
                            .value("sms")
                    }
                    .actionId("notification_settings")
                },
                label: {
                    Text("*Notification Preferences*").type(.mrkdwn)
                },
            )
            .optional(true)

            Input(
                element: {
                    StaticSelect {
                        Option("Pacific Time (PT)").value("PT")
                        Option("Mountain Time (MT)").value("MT")
                        Option("Central Time (CT)").value("CT")
                        Option("Eastern Time (ET)").value("ET")
                    }
                    .actionId("timezone")
                    .placeholder("Select timezone...")
                },
                label: {
                    Text("*Timezone*").type(.mrkdwn)
                },
            )

            // Action buttons
            Actions {
                Button("Save Changes")
                    .style(.primary)
                    .actionId("save_settings")
                    .confirm(
                        ConfirmationDialog(
                            title: Text("Save Settings"),
                            text: Text("Are you sure you want to save these changes?"),
                            confirm: Text("Save"),
                            deny: Text("Cancel"),
                        ),
                    )

                Button("Reset to Defaults")
                    .style(.danger)
                    .actionId("reset_settings")
                    .confirm(
                        ConfirmationDialog(
                            title: Text("Reset Settings"),
                            text: Text("This will reset all settings to their default values. This action cannot be undone."),
                            confirm: Text("Reset"),
                            deny: Text("Cancel"),
                        )
                        .style(.danger),
                    )
            }
        }
    }

    /// A dashboard view with multiple sections
    struct ProjectDashboard: SlackView {
        let projectName: String
        let tasks: [Task]
        let teamMembers: [String]

        struct Task {
            let id: String
            let title: String
            let status: String
            let assignee: String
        }

        var blocks: [Block] {
            // Header
            Header {
                Text("📊 \(projectName) Dashboard")
            }

            Divider()

            // Project overview
            Section {
                Text("*Project Overview*").type(.mrkdwn)
                Text("Total tasks: \(tasks.count)")
                Text("Team members: \(teamMembers.count)")
                Text("Completed: \(tasks.count(where: { $0.status == "completed" }))")
            }

            // Conditional content based on task count
            if tasks.isEmpty {
                Section {
                    Text("*No tasks yet*").type(.mrkdwn)
                    Text("Create your first task to get started!")
                }
            } else {
                Section {
                    Text("*Recent Tasks*").type(.mrkdwn)
                }

                // Using native for-in loop to generate task sections
                for task in tasks.prefix(5) {
                    Section {
                        Text("*\(task.title)*").type(.mrkdwn)
                        Text("👤 \(task.assignee)  •  📋 \(task.status)")
                    }
                    .accessory(
                        Button("View")
                            .actionId("view_task_\(task.id)"),
                    )
                }
            }

            // Quick actions
            Actions {
                Button("Add Task")
                    .style(.primary)
                    .actionId("add_task")

                Button("View All")
                    .actionId("view_all_tasks")

                Button("Export")
                    .actionId("export_tasks")
            }
        }
    }

    // MARK: - Usage Examples

    /// Example of how to use SlackViews
    enum UsageExamples {
        /// Create a user settings modal
        static func createUserSettingsModal() -> View {
            let user = SlackViewExamples.UserSettingsForm.User(
                name: "John Doe",
                email: "john.doe@example.com",
                notifications: true,
                timezone: "PT",
            )

            let settingsView = SlackViewExamples.UserSettingsForm(user: user)

            // Since we use SlackView, we need a modal wrapper
            struct SettingsModal: SlackModalView {
                let settingsView: SlackViewExamples.UserSettingsForm

                var title: TextObject { "User Settings" }
                var submit: TextObject? { "Save" }
                var close: TextObject? { "Cancel" }
                var callbackId: String? { "user_settings_modal" }

                var blocks: [Block] {
                    for block in settingsView.blocks {
                        block
                    }
                }
            }

            return View.modal(SettingsModal(settingsView: settingsView).render())
        }

        /// Create a dashboard home tab
        static func createDashboardHomeTab() -> View {
            let dashboard = SlackViewExamples.ProjectDashboard(
                projectName: "Swift Slack Client",
                tasks: [
                    SlackViewExamples.ProjectDashboard.Task(id: "1", title: "Implement SlackView protocol", status: "completed", assignee: "Claude"),
                    SlackViewExamples.ProjectDashboard.Task(id: "2", title: "Add DSL examples", status: "in_progress", assignee: "User"),
                    SlackViewExamples.ProjectDashboard.Task(id: "3", title: "Write documentation", status: "pending", assignee: "Team"),
                    SlackViewExamples.ProjectDashboard.Task(id: "4", title: "Add unit tests", status: "pending", assignee: "TBD"),
                    SlackViewExamples.ProjectDashboard.Task(id: "5", title: "Performance optimization", status: "planned", assignee: "TBD"),
                ],
                teamMembers: ["Alice", "Bob", "Charlie", "Diana"],
            )

            // Since we use SlackView, we need a home tab wrapper
            struct DashboardHomeTabWrapper: SlackHomeTabView {
                let dashboard: SlackViewExamples.ProjectDashboard

                var callbackId: String? { "dashboard_home_tab" }

                var blocks: [Block] {
                    for block in dashboard.blocks {
                        block
                    }
                }
            }

            return View.homeTab(DashboardHomeTabWrapper(dashboard: dashboard).render())
        }

        /// Create a simple profile card modal
        static func createProfileModal() -> View {
            let profileCard = SlackViewExamples.UserProfileCard(
                name: "Jane Smith",
                email: "jane.smith@company.com",
                avatarUrl: "https://example.com/avatars/jane.jpg",
            )

            // Since we use SlackView, we need a modal wrapper
            struct ProfileModal: SlackModalView {
                let profileCard: SlackViewExamples.UserProfileCard

                var title: TextObject { "User Profile" }
                var close: TextObject? { "Close" }

                var blocks: [Block] {
                    for block in profileCard.blocks {
                        block
                    }
                }
            }

            return View.modal(ProfileModal(profileCard: profileCard).render())
        }
    }

    // MARK: - Composable View Components

    /// A reusable component for displaying key-value pairs
    struct InfoRow: SlackView {
        let label: String
        let value: String
        let emphasized: Bool

        init(_ label: String, value: String, emphasized: Bool = false) {
            self.label = label
            self.value = value
            self.emphasized = emphasized
        }

        var blocks: [Block] {
            Section {
                Text(emphasized ? "*\(label):* \(value)" : "\(label): \(value)")
                    .type(emphasized ? .mrkdwn : .plainText)
            }
        }
    }

    /// A reusable component for status indicators
    struct StatusBadge: SlackView {
        let status: String

        var blocks: [Block] {
            let (emoji, text) = statusDisplay(for: status)

            Section {
                Text("\(emoji) \(text)").type(.mrkdwn)
            }
        }

        private func statusDisplay(for status: String) -> (String, String) {
            switch status.lowercased() {
            case "completed":
                ("✅", "*Completed*")
            case "in_progress":
                ("🟡", "*In Progress*")
            case "pending":
                ("⏳", "*Pending*")
            case "blocked":
                ("🔴", "*Blocked*")
            default:
                ("⚪", status)
            }
        }
    }

    /// Example using composable components
    struct TaskDetailView: SlackView {
        let task: ProjectDashboard.Task

        var blocks: [Block] {
            Section {
                Text("*Task Details*").type(.mrkdwn)
            }

            InfoRow("Title", value: task.title, emphasized: true)
            InfoRow("Assignee", value: task.assignee)

            StatusBadge(status: task.status)

            Actions {
                Button("Edit Task")
                    .style(.primary)
                    .actionId("edit_task")

                Button("Mark Complete")
                    .style(.primary)
                    .actionId("complete_task")

                Button("Delete")
                    .style(.danger)
                    .actionId("delete_task")
                    .confirm(
                        ConfirmationDialog(
                            title: Text("Delete Task"),
                            text: Text("Are you sure you want to delete this task?"),
                            confirm: Text("Delete"),
                            deny: Text("Cancel"),
                        )
                        .style(.danger),
                    )
            }
        }
    }

    /// Example with conditional rendering
    struct NotificationSettings: SlackView {
        let isAdmin: Bool
        let emailEnabled: Bool
        let pushEnabled: Bool

        var blocks: [Block] {
            Section {
                Text("*Notification Settings*").type(.mrkdwn)
            }

            // Using native if expression
            if isAdmin {
                Section {
                    Text("*Admin Options*").type(.mrkdwn)
                    Text("You have access to additional notification controls")
                }

                Input(
                    element: {
                        Checkboxes {
                            Option("Team alerts").value("team_alerts")
                            Option("System notifications").value("system")
                            Option("Security alerts").value("security")
                        }
                        .actionId("admin_notifications")
                    },
                    label: {
                        Text("Admin Notifications")
                    },
                )
            }

            // Standard user options
            Input(
                element: {
                    Checkboxes {
                        Option("Email").value("email")
                        Option("Push").value("push")
                    }
                    .actionId("user_notifications")
                },
                label: {
                    Text("Notification Channels")
                },
            )
        }
    }

    /// Example with ForEach and dynamic content
    struct TeamMembersList: SlackView {
        struct Member {
            let id: String
            let name: String
            let role: String
            let isOnline: Bool
        }

        let members: [Member]

        var blocks: [Block] {
            Header {
                Text("Team Members")
            }

            for member in members {
                Section {
                    Text("*\(member.name)*").type(.mrkdwn)
                    Text("\(member.isOnline ? "🟢" : "⚫") \(member.role)")
                }
                .accessory(
                    Button("Message")
                        .actionId("message_\(member.id)"),
                )
            }

            Section {
                Text("Total members: \(members.count)")
            }
        }
    }
}
