import SlackBlockKitDSL

// Simple modal with minimal configuration
struct SimpleGreetingModal: SlackModalView {
    var title: TextObject {
        "Hello World".asTextObject()
    }
    
    var body: [BlockType] {
        Section {
            Text("Welcome to Slack!")
        }
    }
}

// More complex modal with all the bells and whistles
struct FeedbackModal: SlackModalView {
    let userName: String
    
    var title: TextObject {
        "Feedback Form".asTextObject()
    }
    
    var submit: TextObject? {
        "Submit Feedback".asTextObject()
    }
    
    var close: TextObject? {
        "Cancel".asTextObject()
    }
    
    var callbackId: String? {
        "feedback_form"
    }
    
    var notifyOnClose: Bool? {
        true
    }
    
    var body: [BlockType] {
        Section {
            Text("Hi \(userName), we'd love to hear your feedback!")
                .style(.mrkdwn)
        }
        
        Input(
            element: {
                PlainTextInput()
                    .actionId("feedback_text")
                    .multiline(true)
                    .placeholder(Text("Type your feedback here..."))
            },
            label: {
                Text("Your Feedback")
            }
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
                .actionId("satisfaction_rating")
                .placeholder(Text("Select rating"))
            },
            label: {
                Text("How satisfied are you?")
            }
        )
    }
}

// Simple home tab
struct WelcomeHomeTab: SlackHomeTabView {
    let userName: String
    
    var body: [BlockType] {
        Header {
            Text("Welcome, \(userName)!")
        }
        
        Section {
            Text("Here's what's happening today:")
        }
        
        Divider()
        
        Section {
            Text("📅 3 meetings scheduled")
            Text("📧 12 new messages")
            Text("✅ 5 tasks completed")
        }
        
        Actions {
            Button("View Calendar")
                .actionId("view_calendar")
                .style(.primary)
            
            Button("Check Messages")
                .actionId("check_messages")
        }
    }
}

// Usage
func demonstrateSimpleUsage() {
    // Simple modal
    let greeting = SimpleGreetingModal()
    let greetingModal = greeting.build()
    print("Modal title: \(greetingModal.title.text)")
    
    // Complex modal
    let feedback = FeedbackModal(userName: "Alice")
    let feedbackModal = feedback.build()
    print("Modal has submit button: \(feedbackModal.submit != nil)")
    
    // Home tab
    let home = WelcomeHomeTab(userName: "Bob")
    let homeTab = home.build()
    print("Home tab has \(homeTab.blocks.count) blocks")
}