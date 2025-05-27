import Foundation
import SlackBlockKitDSL

// A minimal example showing the clean SlackView syntax without buildBlocks

struct SimpleGreeting: SlackView {
    let name: String
    
    var body: [BlockType] {
        Section {
            Text("Hello, *\(name)*! 👋").style(.mrkdwn)
        }
    }
}

struct TeamUpdate: SlackView {
    let updates: [String]
    let urgent: Bool
    
    var body: [BlockType] {
        Header(text: Text(urgent ? "🚨 Urgent Team Update" : "📢 Team Update"))
        
        Divider()
        
        if updates.isEmpty {
            Section {
                Text("No updates at this time.")
            }
        } else {
            Section {
                Text("*Today's Updates:*").style(.mrkdwn)
            }
            
            for update in updates {
                Section {
                    Text("• \(update)")
                }
            }
        }
        
        Actions {
            Button("Mark as Read")
                .actionId("mark_read")
                .style(.primary)
            
            if urgent {
                Button("Acknowledge")
                    .actionId("acknowledge")
                    .style(.danger)
            }
        }
    }
}

struct CompactDashboard: SlackView {
    let metrics: Metrics
    
    struct Metrics {
        let users: Int
        let revenue: Double
        let growth: Double
    }
    
    var body: [BlockType] {
        Section {
            Text("*Daily Metrics*").style(.mrkdwn)
            Text("Active Users: \(metrics.users)")
            Text("Revenue: $\(String(format: "%.2f", metrics.revenue))")
            Text("Growth: \(metrics.growth > 0 ? "📈" : "📉") \(abs(metrics.growth))%")
        }
        
        if metrics.growth < 0 {
            Section {
                Text("⚠️ *Action Required*").style(.mrkdwn)
                Text("Growth is negative. Review strategy.")
            }
        }
    }
}

// Usage
extension SimpleGreeting {
    static func example() -> ViewType {
        SimpleGreeting(name: "Alice")
            .asModal(title: Text("Welcome"))
    }
}

extension TeamUpdate {
    static func example() -> ViewType {
        TeamUpdate(
            updates: [
                "Sprint planning moved to 2 PM",
                "New hire starting Monday",
                "Code freeze begins Friday"
            ],
            urgent: true
        ).asModal(
            title: Text("Team Updates"),
            close: Text("Dismiss")
        )
    }
}

extension CompactDashboard {
    static func example() -> ViewType {
        CompactDashboard(
            metrics: Metrics(users: 1250, revenue: 45_678.90, growth: -2.5)
        ).asHomeTab()
    }
}