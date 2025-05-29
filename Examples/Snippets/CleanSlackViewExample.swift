import SlackBlockKitDSL

// MARK: - Clean Modal Examples with String Literals

struct WelcomeModal: SlackModalView {
    let userName: String

    var title: TextObject {
        "Welcome!" // ✨ Clean string literal syntax
    }

    var submit: TextObject? {
        "Get Started" // ✨ No more .asTextObject()
    }

    var close: TextObject? {
        "Maybe Later"
    }

    var callbackId: String? {
        "welcome_modal"
    }

    var blocks: [BlockType] {
        Header {
            Text("👋 Hello \(userName)!")
        }

        Section {
            Text("Welcome to our workspace! We're excited to have you here.")
        }

        Divider()

        Section {
            Text("*Here's what you can do:*")
                .style(.mrkdwn)
        }

        for (emoji, feature) in [
            ("💬", "Chat with your team"),
            ("📁", "Share files and documents"),
            ("📹", "Join video meetings"),
            ("🔔", "Get real-time notifications"),
        ] {
            Section {
                Text("\(emoji) \(feature)")
            }
        }

        Actions {
            Button("Take Tour")
                .actionId("take_tour")
                .style(.primary)

            Button("Skip for Now")
                .actionId("skip_tour")
        }
    }
}

struct FeedbackModal: SlackModalView {
    var title: TextObject {
        "Share Your Feedback" // ✨ Direct string literal
    }

    var submit: TextObject? {
        "Send Feedback"
    }

    var close: TextObject? {
        "Cancel"
    }

    var notifyOnClose: Bool? {
        true
    }

    var blocks: [BlockType] {
        Section {
            Text("Help us improve by sharing your thoughts!")
        }

        Input(
            element: {
                PlainTextInput()
                    .actionId("feedback_text")
                    .multiline(true)
                    .placeholder(Text("What would you like us to know?"))
            },
            label: {
                Text("Your Feedback")
            },
        )

        Input(
            element: {
                StaticSelect {
                    Option("Very Satisfied").value("5")
                    Option("Satisfied").value("4")
                    Option("Neutral").value("3")
                    Option("Dissatisfied").value("2")
                    Option("Very Dissatisfied").value("1")
                }
                .actionId("satisfaction")
                .placeholder(Text("How satisfied are you?"))
            },
            label: {
                Text("Overall Satisfaction")
            },
        )
    }
}

// MARK: - Clean Home Tab Examples

struct DashboardHomeTab: SlackHomeTabView {
    let userName: String
    let stats: UserStats
    let tasks: [Task]

    struct UserStats {
        let messagesCount: Int
        let filesShared: Int
        let meetingsToday: Int
    }

    struct Task {
        let id: String
        let title: String
        let completed: Bool
        let priority: Priority

        enum Priority {
            case low, medium, high

            var emoji: String {
                switch self {
                case .low: "🟢"
                case .medium: "🟡"
                case .high: "🔴"
                }
            }
        }
    }

    var externalId: String? {
        "dashboard_\(userName)"
    }

    var blocks: [BlockType] {
        Header {
            Text("👋 Welcome back, \(userName)!")
        }

        // Stats section
        Section {
            Text("*📊 Today's Activity*")
                .style(.mrkdwn)
        }

        Section {
            Text("Messages: \(stats.messagesCount)")
            Text("Files Shared: \(stats.filesShared)")
            Text("Meetings: \(stats.meetingsToday)")
        }

        if !tasks.isEmpty {
            Divider()

            Header {
                Text("📋 Your Tasks")
            }

            for task in tasks {
                TaskItemView(task: task)
            }
        }

        Divider()

        Actions {
            Button("View Analytics")
                .actionId("view_analytics")
                .style(.primary)

            Button("Add Task")
                .actionId("add_task")
        }
    }
}

// MARK: - Reusable Subview Components

struct TaskItemView: SlackView {
    let task: DashboardHomeTab.Task

    var blocks: [BlockType] {
        let statusEmoji = task.completed ? "✅" : "⏳"
        let taskText = task.completed ?
            "~\(task.title)~" : // Strikethrough for completed
            task.title

        Section {
            Text("\(statusEmoji) \(task.priority.emoji) \(taskText)")
                .style(.mrkdwn)
        }
        .accessory {
            if !task.completed {
                Button("Complete")
                    .actionId("complete_\(task.id)")
                    .style(.primary)
            } else {
                Text("Done")
            }
        }
    }
}

struct UserStatsCard: SlackView {
    let title: String
    let stats: [(String, String)]

    var blocks: [BlockType] {
        Section {
            Text("*\(title)*")
                .style(.mrkdwn)
        }

        Section {
            for (label, value) in stats {
                Text("\(label): \(value)")
            }
        }
    }
}

// MARK: - Usage Examples

func demonstrateCleanAPI() {
    // ✨ Clean modal creation
    let modal = WelcomeModal(userName: "Alice")
    let modalView = modal.build() // Returns ModalView

    // ✨ Clean home tab creation
    let stats = DashboardHomeTab.UserStats(
        messagesCount: 42,
        filesShared: 8,
        meetingsToday: 3,
    )

    let tasks = [
        DashboardHomeTab.Task(
            id: "1",
            title: "Review PRs",
            completed: true,
            priority: .high,
        ),
        DashboardHomeTab.Task(
            id: "2",
            title: "Update documentation",
            completed: false,
            priority: .medium,
        ),
    ]

    let homeTab = DashboardHomeTab(
        userName: "Bob",
        stats: stats,
        tasks: tasks,
    )
    let homeTabView = homeTab.build() // Returns HomeTabView

    // ✨ Showcase the clean syntax
    print("Modal title: \(modalView.title.text)")
    print("Home tab blocks: \(homeTabView.blocks.count)")

    // ✨ Demonstrate reusable subviews
    let taskView = TaskItemView(task: tasks[0])
    print("Task view blocks: \(taskView.blocks.count)")
}
