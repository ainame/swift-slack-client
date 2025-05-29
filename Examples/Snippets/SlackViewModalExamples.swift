import SlackBlockKitDSL

// MARK: - Modal Examples

struct WelcomeModal: SlackModalView {
    let userName: String

    var title: TextObject {
        "Welcome \(userName)!".asTextObject()
    }

    var submit: TextObject? {
        "Get Started".asTextObject()
    }

    var close: TextObject? {
        "Maybe Later".asTextObject()
    }

    var callbackId: String? {
        "welcome_modal_\(userName.lowercased())"
    }

    var body: [BlockType] {
        Header {
            Text("Welcome to our workspace!")
        }

        Section {
            Text("We're excited to have you here, \(userName)! 🎉")
                .style(.mrkdwn)
        }

        Divider()

        Section {
            Text("*Here are some things you can do:*")
                .style(.mrkdwn)
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
        "Settings".asTextObject()
    }

    var submit: TextObject? {
        "Save Changes".asTextObject()
    }

    var body: [BlockType] {
        Header {
            Text("Notification Preferences")
        }

        Input(
            element: {
                Checkboxes {
                    if currentSettings.notifications {
                        Option("Desktop Notifications")
                            .value("desktop")
                            .initialOption(true)
                    }
                    if currentSettings.emailDigest {
                        Option("Email Digest")
                            .value("email")
                            .initialOption(true)
                    }
                    Option("Mobile Push")
                        .value("mobile")
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

    var body: [BlockType] {
        Header {
            Text("Welcome to \(teamName)")
        }

        Section {
            Text("*📢 Recent Announcements*")
                .style(.mrkdwn)
        }

        for announcement in announcements {
            Section {
                Text("*\(announcement.title)*\n\(announcement.message)")
                    .style(.mrkdwn)
            }
            .accessory {
                Text(announcement.date)
                    .style(.mrkdwn)
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
                .accessory {
                    Button(event.time)
                        .actionId("event_\(event.name)")
                }
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

    var body: [BlockType] {
        Header {
            Text("Hey \(userName)! 👋")
        }

        Section {
            Text("Messages Sent")
                .style(.mrkdwn)
            Text("Files Shared")
                .style(.mrkdwn)
            Text("Meetings Today")
                .style(.mrkdwn)
            Text("*\(stats.messagesCount)*")
                .style(.mrkdwn)
            Text("*\(stats.filesShared)*")
                .style(.mrkdwn)
            Text("*\(stats.meetingsToday)*")
                .style(.mrkdwn)
        }

        Divider()

        if !tasks.isEmpty {
            Header {
                Text("Your Tasks")
            }

            for task in tasks {
                Section {
                    Text(task.completed ? "~\(task.title)~" : task.title)
                        .style(.mrkdwn)
                }
                .accessory {
                    if !task.completed {
                        Button("Complete")
                            .actionId("complete_\(task.id)")
                            .style(.primary)
                    } else {
                        Text("✅ Done")
                    }
                }
            }
        } else {
            Section {
                Text("No tasks for today! 🎉")
                    .style(.mrkdwn)
            }
        }
    }
}

// MARK: - Usage Examples

func demonstrateUsage() {
    // Modal usage
    let welcomeModal = WelcomeModal(userName: "Alice")
    let modalView = welcomeModal.build() // Returns ModalView

    let settings = SettingsModal.UserSettings(
        notifications: true,
        emailDigest: false,
        theme: "dark",
    )
    let settingsModal = SettingsModal(currentSettings: settings)
    let settingsView = settingsModal.build() // Returns ModalView

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
    let homeView = teamHome.build() // Returns HomeTabView

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
    let personalView = personalHome.build() // Returns HomeTabView
}
