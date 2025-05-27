import Foundation
import SlackBlockKitDSL

// MARK: - Example SlackViews

/// A reusable user profile card view
struct UserProfileCard: SlackView {
    let name: String
    let email: String
    let avatarUrl: String?
    
    var body: [BlockType] {
        Section {
            Text("*\(name)*").style(.mrkdwn)
            Text(email)
        }
        .accessory(
            ImageElement(
                imageUrl: avatarUrl ?? "https://via.placeholder.com/150",
                altText: "\(name)'s avatar"
            )
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
    
    var body: [BlockType] {
        // Header
        Section {
            Text("*User Settings*").style(.mrkdwn)
            Text("Configure your preferences below")
        }
        
        Divider()
        
        // Profile section - embedding another SlackView
        UserProfileCard(
            name: user.name,
            email: user.email,
            avatarUrl: nil
        )
        
        Divider()
        
        // Settings inputs
        Input(
            element: {
                Checkboxes {
                    Option("Email notifications")
                        .value("email")
                        .selected(user.notifications)
                    Option("Push notifications")
                        .value("push")
                    Option("SMS notifications")
                        .value("sms")
                }
                .actionId("notification_settings")
            },
            label: {
                Text("*Notification Preferences*").style(.mrkdwn)
            }
        )
        .optional(true)
        
        Input(
            element: {
                StaticSelect()
                    .options {
                        Option("Pacific Time (PT)").value("PT")
                        Option("Mountain Time (MT)").value("MT")
                        Option("Central Time (CT)").value("CT")
                        Option("Eastern Time (ET)").value("ET")
                    }
                    .actionId("timezone")
                    .placeholder("Select timezone...")
            },
            label: {
                Text("*Timezone*").style(.mrkdwn)
            }
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
                        deny: Text("Cancel")
                    )
                )
            
            Button("Reset to Defaults")
                .style(.danger)
                .actionId("reset_settings")
                .confirm(
                    ConfirmationDialog(
                        title: Text("Reset Settings"),
                        text: Text("This will reset all settings to their default values. This action cannot be undone."),
                        confirm: Text("Reset"),
                        deny: Text("Cancel")
                    )
                    .style(.danger)
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
    
    var body: [BlockType] {
        // Header
        Header(text: Text("📊 \(projectName) Dashboard"))
        
        Divider()
        
        // Project overview
        Section {
            Text("*Project Overview*").style(.mrkdwn)
            Text("Total tasks: \(tasks.count)")
            Text("Team members: \(teamMembers.count)")
            Text("Completed: \(tasks.filter { $0.status == "completed" }.count)")
        }
        
        // Conditional content based on task count
        if tasks.isEmpty {
            Section {
                Text("*No tasks yet*").style(.mrkdwn)
                Text("Create your first task to get started!")
            }
        } else {
            Section {
                Text("*Recent Tasks*").style(.mrkdwn)
            }
            
            // Using native for-in loop to generate task sections
            for task in tasks.prefix(5) {
                Section {
                    Text("*\(task.title)*").style(.mrkdwn)
                    Text("👤 \(task.assignee)  •  📋 \(task.status)")
                }
                .accessory(
                    Button("View")
                        .actionId("view_task_\(task.id)")
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
struct SlackViewUsageExamples {
    
    /// Create a user settings modal
    static func createUserSettingsModal() -> ViewType {
        let user = UserSettingsForm.User(
            name: "John Doe",
            email: "john.doe@example.com",
            notifications: true,
            timezone: "PT"
        )
        
        let settingsView = UserSettingsForm(user: user)
        
        return settingsView.asModal(
            title: Text("User Settings"),
            submit: Text("Save"),
            close: Text("Cancel"),
            callbackId: "user_settings_modal"
        )
    }
    
    /// Create a dashboard home tab
    static func createDashboardHomeTab() -> ViewType {
        let dashboard = ProjectDashboard(
            projectName: "Swift Slack Client",
            tasks: [
                ProjectDashboard.Task(id: "1", title: "Implement SlackView protocol", status: "completed", assignee: "Claude"),
                ProjectDashboard.Task(id: "2", title: "Add DSL examples", status: "in_progress", assignee: "User"),
                ProjectDashboard.Task(id: "3", title: "Write documentation", status: "pending", assignee: "Team"),
                ProjectDashboard.Task(id: "4", title: "Add unit tests", status: "pending", assignee: "TBD"),
                ProjectDashboard.Task(id: "5", title: "Performance optimization", status: "planned", assignee: "TBD")
            ],
            teamMembers: ["Alice", "Bob", "Charlie", "Diana"]
        )
        
        return dashboard.asHomeTab(
            callbackId: "dashboard_home_tab"
        )
    }
    
    /// Create a simple profile card modal
    static func createProfileModal() -> ViewType {
        let profileCard = UserProfileCard(
            name: "Jane Smith",
            email: "jane.smith@company.com",
            avatarUrl: "https://example.com/avatars/jane.jpg"
        )
        
        return profileCard.asModal(
            title: Text("User Profile"),
            close: Text("Close")
        )
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
    
    var body: [BlockType] {
        Section {
            if emphasized {
                Text("*\(label):* \(value)").style(.mrkdwn)
            } else {
                Text("\(label): \(value)")
            }
        }
    }
}

/// A reusable component for status indicators
struct StatusBadge: SlackView {
    let status: String
    
    var body: [BlockType] {
        let (emoji, text) = statusDisplay(for: status)
        
        Section {
            Text("\(emoji) \(text)").style(.mrkdwn)
        }
    }
    
    private func statusDisplay(for status: String) -> (String, String) {
        switch status.lowercased() {
        case "completed":
            return ("✅", "*Completed*")
        case "in_progress":
            return ("🟡", "*In Progress*")
        case "pending":
            return ("⏳", "*Pending*")
        case "blocked":
            return ("🔴", "*Blocked*")
        default:
            return ("⚪", status)
        }
    }
}

/// Example using composable components
struct TaskDetailView: SlackView {
    let task: ProjectDashboard.Task
    
    var body: [BlockType] {
        Section {
            Text("*Task Details*").style(.mrkdwn)
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
                        deny: Text("Cancel")
                    )
                    .style(.danger)
                )
        }
    }
}

/// Example with conditional rendering
struct NotificationSettings: SlackView {
    let isAdmin: Bool
    let emailEnabled: Bool
    let pushEnabled: Bool
    
    var body: [BlockType] {
        Section {
            Text("*Notification Settings*").style(.mrkdwn)
        }
        
        // Using native if expression
        if isAdmin {
            Section {
                Text("*Admin Options*").style(.mrkdwn)
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
                }
            )
        }
        
        // Standard user options
        Input(
            element: {
                Checkboxes {
                    Option("Email").value("email").selected(emailEnabled)
                    Option("Push").value("push").selected(pushEnabled)
                }
                .actionId("user_notifications")
            },
            label: {
                Text("Notification Channels")
            }
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
    
    var body: [BlockType] {
        Header(text: Text("Team Members"))
        
        for member in members {
            Section {
                Text("*\(member.name)*").style(.mrkdwn)
                Text("\(member.isOnline ? "🟢" : "⚫") \(member.role)")
            }
            .accessory(
                Button("Message")
                    .actionId("message_\(member.id)")
            )
        }
        
        Section {
            Text("Total members: \(members.count)")
        }
    }
}