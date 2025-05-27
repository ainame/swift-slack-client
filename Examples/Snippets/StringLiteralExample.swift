import SlackBlockKit

// MARK: - Clean String Literal Syntax Examples

// ✅ Before: Verbose .asTextObject() calls
struct OldStyleModal: SlackModalView {
    var title: TextObject {
        TextObject(type: .plainText, text: "Old Style")
    }
    
    var submit: TextObject? {
        TextObject(type: .plainText, text: "Submit")
    }
    
    var blocks: [BlockType] {
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
    
    var blocks: [BlockType] {
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
        "User Profile: \(user.name)" // ✨ String interpolation works!
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
    
    var blocks: [BlockType] {
        Header {
            Text("👤 \(user.name)")
        }
        
        Section {
            Text("**Email:** \(user.email)")
                .style(.mrkdwn)
            Text("**Role:** \(user.role)")
                .style(.mrkdwn)
            Text("**Status:** \(user.isActive ? "Active" : "Inactive")")
                .style(.mrkdwn)
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
            }
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
    
    var blocks: [BlockType] {
        Header {
            Text("🏢 \(teamName) Dashboard")
        }
        
        Section {
            Text("*📊 Team Metrics*")
                .style(.mrkdwn)
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

// MARK: - Advanced Usage with Conditionals

struct NotificationModal: SlackModalView {
    let userName: String
    let hasUnreadMessages: Bool
    let unreadCount: Int
    
    var title: TextObject {
        hasUnreadMessages ? 
            "You have \(unreadCount) new messages!" : // ✨ Conditional string literals
            "All caught up!"
    }
    
    var submit: TextObject? {
        hasUnreadMessages ? "Mark All Read" : "Close"
    }
    
    var blocks: [BlockType] {
        Header {
            Text(hasUnreadMessages ? "📬 New Messages" : "✅ All Clear")
        }
        
        if hasUnreadMessages {
            Section {
                Text("Hey \(userName), you have **\(unreadCount)** unread messages!")
                    .style(.mrkdwn)
            }
            
            Actions {
                Button("View Messages")
                    .actionId("view_messages")
                    .style(.primary)
                
                Button("Mark All Read")
                    .actionId("mark_read")
            }
        } else {
            Section {
                Text("Great job staying on top of your messages, \(userName)! 🎉")
            }
        }
    }
}

// MARK: - Usage Demonstration

func demonstrateStringLiterals() {
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
        isActive: true
    )
    
    let profileModal = UserProfileModal(user: user)
    let profileView = profileModal.build()
    
    print("Profile modal title: '\(profileView.title.text)'")
    
    // ✨ Home tab example
    let metrics = TeamDashboard.Metrics(
        totalMessages: 1247,
        activeProjects: 8,
        completedTasks: 156
    )
    
    let dashboard = TeamDashboard(
        teamName: "Engineering",
        members: ["Alice", "Bob", "Charlie", "Diana"],
        metrics: metrics
    )
    
    let dashboardView = dashboard.build()
    print("Dashboard has \(dashboardView.blocks.count) blocks")
    
    // ✨ Conditional examples
    let notificationModal = NotificationModal(
        userName: "Alice",
        hasUnreadMessages: true,
        unreadCount: 5
    )
    
    let notificationView = notificationModal.build()
    print("Notification title: '\(notificationView.title.text)'")
}