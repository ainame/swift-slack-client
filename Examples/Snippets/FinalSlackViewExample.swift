import SlackBlockKit

// Simple modal example
struct WelcomeModal: SlackModalView {
    let userName: String
    
    var title: TextObject {
        "Welcome!".asTextObject()
    }
    
    var submit: TextObject? {
        "Get Started".asTextObject()
    }
    
    var blocks: [BlockType] {
        Section {
            Text("Hi \(userName), welcome to our workspace!")
        }
        
        Actions {
            Button("View Tutorial")
                .actionId("tutorial")
                .style(.primary)
        }
    }
}

// Home tab example
struct DashboardHomeTab: SlackHomeTabView {
    let stats: DashboardStats
    
    struct DashboardStats {
        let messages: Int
        let files: Int
        let meetings: Int
    }
    
    var blocks: [BlockType] {
        Header {
            Text("📊 Your Dashboard")
        }
        
        Section {
            Text("*Today's Activity*")
                .style(.mrkdwn)
            Text("Messages: \(stats.messages)")
            Text("Files shared: \(stats.files)")
            Text("Meetings: \(stats.meetings)")
        }
    }
}

// Usage example
func demonstrateAPI() {
    // Modal usage
    let modal = WelcomeModal(userName: "Alice")
    let modalView = modal.build()  // Clean API
    print("Modal title: \(modalView.title.text)")
    
    // Home tab usage
    let stats = DashboardHomeTab.DashboardStats(
        messages: 42, 
        files: 8, 
        meetings: 3
    )
    let homeTab = DashboardHomeTab(stats: stats)
    let homeTabView = homeTab.build()  // Clean API
    print("Home tab has \(homeTabView.blocks.count) blocks")
}