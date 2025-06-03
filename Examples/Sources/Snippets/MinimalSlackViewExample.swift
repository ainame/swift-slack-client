import Foundation
import SlackBlockKit
import SlackBlockKitDSL

enum MinimalExamples {
    // A minimal example showing the clean SlackView syntax without buildBlocks

    struct SimpleGreeting: SlackView {
        let name: String

        var blocks: [Block] {
            Section {
                Text("Hello, *\(name)*! 👋").type(.mrkdwn)
            }
        }
    }

    struct TeamUpdate: SlackView {
        let updates: [String]
        let urgent: Bool

        var blocks: [Block] {
            Header {
                Text(urgent ? "🚨 Urgent Team Update" : "📢 Team Update")
            }

            Divider()

            if updates.isEmpty {
                Section {
                    Text("No updates at this time.")
                }
            } else {
                Section {
                    Text("*Today's Updates:*").type(.mrkdwn)
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

        var blocks: [Block] {
            Section {
                Text("*Daily Metrics*").type(.mrkdwn)
                Text("Active Users: \(metrics.users)")
                Text("Revenue: $\(String(format: "%.2f", metrics.revenue))")
                Text("Growth: \(metrics.growth > 0 ? "📈" : "📉") \(abs(metrics.growth))%")
            }

            if metrics.growth < 0 {
                Section {
                    Text("⚠️ *Action Required*").type(.mrkdwn)
                    Text("Growth is negative. Review strategy.")
                }
            }
        }
    }

    // Usage - Create modal/home tab wrappers
    struct SimpleGreetingModal: SlackModalView {
        let greeting: SimpleGreeting

        var title: TextObject { "Welcome" }

        var blocks: [Block] {
            for block in greeting.blocks {
                block
            }
        }
    }

    struct TeamUpdateModal: SlackModalView {
        let update: TeamUpdate

        var title: TextObject { "Team Updates" }
        var close: TextObject? { "Dismiss" }

        var blocks: [Block] {
            for block in update.blocks {
                block
            }
        }
    }

    struct CompactDashboardHomeTab: SlackHomeTabView {
        let dashboard: CompactDashboard

        var blocks: [Block] {
            for block in dashboard.blocks {
                block
            }
        }
    }

    // Usage
}

extension MinimalExamples.SimpleGreeting {
    static func example() -> View {
        MinimalExamples.SimpleGreetingModal(
            greeting: MinimalExamples.SimpleGreeting(name: "Alice"),
        ).render()
    }
}

extension MinimalExamples.TeamUpdate {
    static func example() -> View {
        MinimalExamples.TeamUpdateModal(
            update: MinimalExamples.TeamUpdate(
                updates: [
                    "Sprint planning moved to 2 PM",
                    "New hire starting Monday",
                    "Code freeze begins Friday",
                ],
                urgent: true,
            ),
        ).render()
    }
}

extension MinimalExamples.CompactDashboard {
    static func example() -> View {
        MinimalExamples.CompactDashboardHomeTab(
            dashboard: MinimalExamples.CompactDashboard(
                metrics: MinimalExamples.CompactDashboard.Metrics(users: 1250, revenue: 45678.90, growth: -2.5),
            ),
        ).render()
    }
}
