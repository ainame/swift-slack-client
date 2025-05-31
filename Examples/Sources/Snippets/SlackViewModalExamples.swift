import SlackBlockKit
import SlackBlockKitDSL

// MARK: - Modal Examples

struct WelcomeModal: SlackModalView {
    let userName: String

    var title: TextObject {
        TextObject(type: .plainText, text: "Welcome \(userName)!")
    }

    var submit: TextObject? {
        TextObject(type: .plainText, text: "Get Started")
    }

    var close: TextObject? {
        TextObject(type: .plainText, text: "Maybe Later")
    }

    var callbackId: String? {
        "welcome_modal_\(userName.lowercased())"
    }

    var blocks: [Block] {
        Header {
            Text("Welcome to our workspace!")
        }

        Section {
            Text("We're excited to have you here, \(userName)! 🎉")
                .type(.mrkdwn)
        }

        Divider()

        Section {
            Text("*Here are some things you can do:*")
                .type(.mrkdwn)
        }

        for (icon, feature) in [
            ("💬", "Chat with your team"),
            ("📁", "Share files and documents"),
            ("📹", "Start video calls"),
        ] {
            Section {
                Text("\(icon) \(feature)")
            }
        }

        Actions {
            Button("View Tutorial")
                .actionId("view_tutorial")
                .style(.primary)

            Button("Skip for Now")
                .actionId("skip_tutorial")
        }
    }
}

struct SettingsModal: SlackModalView {
    let currentSettings: UserSettings

    struct UserSettings {
        let notifications: Bool
        let emailDigest: Bool
        let theme: String
    }

    var title: TextObject {
        "Settings"
    }

    var submit: TextObject? {
        "Save Changes"
    }

    var blocks: [Block] {
        Header {
            Text("Notification Preferences")
        }

        Input(
            element: {
                Checkboxes {
                    if currentSettings.notifications {
                        Option("Desktop Notifications").value("desktop")
                    }
                    if currentSettings.emailDigest {
                        Option("Email Digest").value("email")
                    }
                    Option("Mobile Push").value("mobile")
                }
                .actionId("notification_prefs")
            },
            label: {
                Text("Choose your notification methods")
            },
        )

        Divider()

        Input(
            element: {
                StaticSelect {
                    Option("Light").value("light")
                    Option("Dark").value("dark")
                    Option("Auto").value("auto")
                }
                .actionId("theme_select")
                .placeholder(Text("Choose a theme"))
            },
            label: {
                Text("Theme")
            },
        )
    }
}

// MARK: - Home Tab Examples

struct TeamHomeTab: SlackHomeTabView {
    let teamName: String
    let announcements: [Announcement]
    let upcomingEvents: [Event]

    struct Announcement {
        let title: String
        let message: String
        let date: String
    }

    struct Event {
        let name: String
        let time: String
    }

    var blocks: [Block] {
        Header {
            Text("Welcome to \(teamName)")
        }

        Section {
            Text("*📢 Recent Announcements*")
                .type(.mrkdwn)
        }

        for announcement in announcements {
            Section {
                Text("*\(announcement.title)*\n\(announcement.message)\n_\(announcement.date)_")
                    .type(.mrkdwn)
            }

            Divider()
        }

        if !upcomingEvents.isEmpty {
            Header {
                Text("📅 Upcoming Events")
            }

            for event in upcomingEvents {
                Section {
                    Text(event.name)
                }
                .accessory(
                    Button(event.time)
                        .actionId("event_\(event.name)"),
                )
            }
        }

        Actions {
            Button("Create Announcement")
                .actionId("create_announcement")
                .style(.primary)

            Button("Schedule Event")
                .actionId("schedule_event")
        }
    }
}

struct PersonalHomeTab: SlackHomeTabView {
    let userName: String
    let tasks: [Task]
    let stats: Stats

    struct Task {
        let id: String
        let title: String
        let completed: Bool
    }

    struct Stats {
        let messagesCount: Int
        let filesShared: Int
        let meetingsToday: Int
    }

    var externalId: String? {
        "personal_home_\(userName)"
    }

    var blocks: [Block] {
        Header {
            Text("Hey \(userName)! 👋")
        }

        Section {
            Text("Messages Sent")
                .type(.mrkdwn)
            Text("Files Shared")
                .type(.mrkdwn)
            Text("Meetings Today")
                .type(.mrkdwn)
            Text("*\(stats.messagesCount)*")
                .type(.mrkdwn)
            Text("*\(stats.filesShared)*")
                .type(.mrkdwn)
            Text("*\(stats.meetingsToday)*")
                .type(.mrkdwn)
        }

        Divider()

        if !tasks.isEmpty {
            Header {
                Text("Your Tasks")
            }

            for task in tasks {
                if task.completed {
                    Section {
                        Text("~\(task.title)~ ✅")
                            .type(.mrkdwn)
                    }
                } else {
                    Section {
                        Text(task.title)
                            .type(.mrkdwn)
                    }
                    .accessory(
                        Button("Complete")
                            .actionId("complete_\(task.id)")
                            .style(.primary),
                    )
                }
            }
        } else {
            Section {
                Text("No tasks for today! 🎉")
                    .type(.mrkdwn)
            }
        }
    }
}

// MARK: - Usage Examples

func demonstrateUsage() {
    // Modal usage
    let welcomeModal = WelcomeModal(userName: "Alice")
    _ = welcomeModal.render() // Returns ModalView

    let settings = SettingsModal.UserSettings(
        notifications: true,
        emailDigest: false,
        theme: "dark",
    )
    let settingsModal = SettingsModal(currentSettings: settings)
    _ = settingsModal.render() // Returns ModalView

    // Home tab usage
    let announcements = [
        TeamHomeTab.Announcement(
            title: "Office Closure",
            message: "The office will be closed on Friday",
            date: "Dec 15",
        ),
    ]
    let events = [
        TeamHomeTab.Event(name: "Team Standup", time: "9:00 AM"),
        TeamHomeTab.Event(name: "Design Review", time: "2:00 PM"),
    ]
    let teamHome = TeamHomeTab(
        teamName: "Engineering",
        announcements: announcements,
        upcomingEvents: events,
    )
    _ = teamHome.render() // Returns HomeTabView

    // Personal home tab
    let tasks = [
        PersonalHomeTab.Task(id: "1", title: "Review PRs", completed: true),
        PersonalHomeTab.Task(id: "2", title: "Update documentation", completed: false),
    ]
    let stats = PersonalHomeTab.Stats(
        messagesCount: 42,
        filesShared: 5,
        meetingsToday: 3,
    )
    let personalHome = PersonalHomeTab(
        userName: "Bob",
        tasks: tasks,
        stats: stats,
    )
    _ = personalHome.render() // Returns HomeTabView
}
