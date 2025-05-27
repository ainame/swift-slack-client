import Foundation
import ArgumentParser
import SlackClient
import SlackBlockKitDSL
import SlackModels

// A simple example demonstrating SlackView usage
struct SlackViewDemo: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slackview-demo",
        abstract: "Demonstrates SlackView protocol usage"
    )
    
    @Option(help: "Bot user OAuth token")
    var token: String
    
    @Option(help: "Channel ID to post to")
    var channel: String
    
    mutating func run() async throws {
        let slack = try await Slack(configuration: .init(
            token: token
        ))
        
        // Create a dashboard view
        let dashboard = ProjectStatusView(
            projectName: "Swift Slack Client",
            milestones: [
                Milestone(name: "SlackView Implementation", progress: 100, status: .completed),
                Milestone(name: "Result Builder Support", progress: 100, status: .completed),
                Milestone(name: "ForEach & Conditional", progress: 100, status: .completed),
                Milestone(name: "Documentation", progress: 75, status: .inProgress),
                Milestone(name: "Unit Tests", progress: 0, status: .notStarted)
            ]
        )
        
        // Send as a message to the channel
        let result = try await slack.chatPostMessage(
            channel: channel,
            blocks: dashboard.blocks
        )
        
        print("Posted message with timestamp: \(result.ts ?? "unknown")")
    }
}

// MARK: - SlackView Implementation

struct ProjectStatusView: SlackView {
    let projectName: String
    let milestones: [Milestone]
    
    struct Milestone {
        let name: String
        let progress: Int
        let status: Status
        
        enum Status {
            case notStarted
            case inProgress
            case completed
            case blocked
        }
    }
    
    var blocks: [BlockType] {
        Header(text: Text("📊 \(projectName) Status"))
        
        Section {
            Text("*Project Overview*").style(.mrkdwn)
            Text("Last updated: \(Date().formatted())")
        }
        
        Divider()
        
        // Overall progress
        let overallProgress = milestones.reduce(0) { $0 + $1.progress } / milestones.count
        Section {
            Text("*Overall Progress:* \(overallProgress)%").style(.mrkdwn)
            Text(progressBar(overallProgress))
        }
        
        Divider()
        
        Section {
            Text("*Milestones*").style(.mrkdwn)
        }
        
        // Use native for-in loop to display milestones
        for milestone in milestones {
            MilestoneRow(milestone: milestone)
        }
        
        // Conditional section for blockers
        let blockedMilestones = milestones.filter { $0.status == .blocked }
        if !blockedMilestones.isEmpty {
            Divider()
            
            Section {
                Text("⚠️ *Blocked Items*").style(.mrkdwn)
                Text("The following milestones need attention:")
            }
            
            for milestone in blockedMilestones {
                Section {
                    Text("• \(milestone.name)")
                }
            }
        }
        
        Actions {
            Button("Refresh")
                .actionId("refresh_status")
            
            Button("View Details")
                .actionId("view_details")
                .style(.primary)
        }
    }
    
    private func progressBar(_ progress: Int) -> String {
        let filled = progress / 10
        let empty = 10 - filled
        return String(repeating: "▓", count: filled) + String(repeating: "░", count: empty) + " \(progress)%"
    }
}

// Reusable milestone row component
struct MilestoneRow: SlackView {
    let milestone: ProjectStatusView.Milestone
    
    var blocks: [BlockType] {
        Section {
            Text("*\(milestone.name)*").style(.mrkdwn)
            Text("\(statusEmoji) \(statusText) • \(progressBar)")
        }
    }
    
    private var statusEmoji: String {
        switch milestone.status {
        case .notStarted: return "⚪"
        case .inProgress: return "🟡"
        case .completed: return "✅"
        case .blocked: return "🔴"
        }
    }
    
    private var statusText: String {
        switch milestone.status {
        case .notStarted: return "Not Started"
        case .inProgress: return "In Progress"
        case .completed: return "Completed"
        case .blocked: return "Blocked"
        }
    }
    
    private var progressBar: String {
        let filled = milestone.progress / 20
        let empty = 5 - filled
        return String(repeating: "▓", count: filled) + String(repeating: "░", count: empty) + " \(milestone.progress)%"
    }
}