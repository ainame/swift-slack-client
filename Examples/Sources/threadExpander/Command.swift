import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

/// Thread-safe storage for posted thread IDs
actor ThreadTracker {
    private var postedThreads = Set<String>()
    
    func contains(_ threadId: String) -> Bool {
        return postedThreads.contains(threadId)
    }
    
    func insert(_ threadId: String) {
        postedThreads.insert(threadId)
    }
    
    func remove(_ threadId: String) {
        postedThreads.remove(threadId)
    }
    
    func cleanup() {
        // Keep only recent threads to prevent memory growth
        if postedThreads.count > 1000 {
            postedThreads.removeAll()
        }
    }
    
    func count() -> Int {
        return postedThreads.count
    }
}

@main
struct ThreadExpander {
    static func main() async throws {
        guard let accessToken = ProcessInfo.processInfo.environment["SLACK_OAUTH_TOKEN"],
              let appLevelToken = ProcessInfo.processInfo.environment["SLACK_APP_LEVEL_TOKEN"] else {
            print("❌ Please set SLACK_OAUTH_TOKEN and SLACK_APP_LEVEL_TOKEN environment variables")
            print("   SLACK_OAUTH_TOKEN: Bot token (starts with xoxb-)")
            print("   SLACK_APP_LEVEL_TOKEN: App-level token (starts with xapp-)")
            print("")
            print("🔧 Required Slack app permissions:")
            print("   Bot Token Scopes:")
            print("   • chat:write - To post thread links")
            print("   • channels:history - To read public channel messages")
            print("   • groups:history - To read private channel messages")
            print("   • im:history - To read direct messages")
            print("   • mpim:history - To read group direct messages")
            print("")
            print("   Event Subscriptions:")
            print("   • Enable Events API")
            print("   • Subscribe to message.channels events")
            print("   • Subscribe to message.groups events")
            print("   • Subscribe to message.im events")
            print("   • Subscribe to message.mpim events")
            exit(1)
        }

        print("🧵 Starting Thread Expander...")
        print("   This bot monitors all channels for thread messages")
        print("   and posts thread links to help you never miss threaded conversations!")
        
        let slack = Slack(
            transport: AsyncHTTPClientTransport(),
            configuration: .init(
                userAgent: "ThreadExpander/1.0",
                appLevelToken: appLevelToken,
                accessToken: accessToken
            )
        )

        let router = SocketModeMessageRouter()
        
        // Track posted thread links to avoid duplicates
        let threadTracker = ThreadTracker()
        
        // Handle all message events using MessageEvent type
        router.onEvent(MessageEvent.self) { context, envelope, messageEvent in
            // Check if this is a thread message (has thread_ts but is not the parent message)
            guard let threadTs = messageEvent.threadTs,
                  let messageTs = messageEvent.ts,
                  threadTs != messageTs else {
                return // Not a thread reply
            }
            
            // Skip if this is a bot message to avoid loops
            if messageEvent.botId != nil || messageEvent.user?.starts(with: "B") == true {
                return
            }
            
            // Create unique identifier for this thread
            let threadId = "\(messageEvent.channel ?? "unknown"):\(threadTs)"
            
            // Skip if we've already posted about this thread
            let alreadyPosted = await threadTracker.contains(threadId)
            guard !alreadyPosted else {
                return
            }
            
            print("🧵 New thread message detected:")
            print("   Channel: \(messageEvent.channel ?? "unknown")")
            print("   User: \(messageEvent.user ?? "unknown")")
            print("   Thread TS: \(threadTs)")
            print("   Message TS: \(messageTs)")
            
            // Mark this thread as posted
            await threadTracker.insert(threadId)
            
            // Get channel info to build the thread link
            let channelId = messageEvent.channel ?? ""
            let workspaceId = Self.extractWorkspaceId()
            
            // Build Slack thread link
            // Format: https://[workspace].slack.com/archives/[channel]/p[timestamp]?thread_ts=[thread_ts]
            let threadLink = Self.buildThreadLink(
                workspaceId: workspaceId,
                channelId: channelId,
                threadTs: threadTs
            )
            
            // Build user mention
            let userMention = messageEvent.user.map { "<@\($0)>" } ?? "Someone"
            
            // Create the notification message
            let notificationText = """
            🧵 **New thread activity!**
            
            \(userMention) just replied in a thread. Don't miss the conversation!
            
            👆 [**View Thread**](\(threadLink))
            """
            
            // Post the thread link to the channel
            Task {
                do {
                    let response = try await context.client.chatPostMessage(
                        body: .json(.init(
                            channel: channelId,
                            text: notificationText,
                            unfurlLinks: false,
                            unfurlMedia: false
                        ))
                    )
                    
                    let result = try response.ok.body.json
                    print("✅ Thread notification posted: \(result.ts ?? "unknown timestamp")")
                    
                } catch {
                    print("❌ Error posting thread notification: \(error)")
                    
                    // Remove from posted set so we can try again later
                    await threadTracker.remove(threadId)
                }
            }
        }
        
        // Handle message changed events (for edited thread messages)
        router.onEvent(MessageChangedEvent.self) { context, envelope, messageChangedEvent in
            // Check if the changed message is in a thread
            guard let message = messageChangedEvent.message,
                  let threadTs = message.threadTs,
                  let messageTs = message.ts,
                  threadTs != messageTs else {
                return
            }
            
            print("✏️ Thread message edited:")
            print("   Channel: \(messageChangedEvent.channel ?? "unknown")")
            print("   Thread TS: \(threadTs)")
            print("   Message TS: \(messageTs)")
        }
        
        // Clean up old thread IDs periodically (every hour)
        Task {
            while true {
                try await Task.sleep(for: .seconds(3600)) // 1 hour
                
                // Keep only recent threads (last 24 hours worth)
                // This is a simple cleanup - in production you might want more sophisticated logic
                let count = await threadTracker.count()
                if count > 1000 {
                    print("🧹 Cleaning up old thread tracking data...")
                    await threadTracker.cleanup()
                }
            }
        }
        
        // Debug: Log interesting events for troubleshooting
        router.onEvent(AppMentionEvent.self) { context, envelope, event in
            print("📢 App mentioned in channel: \(event.channel ?? "unknown")")
        }
        
        router.onEvent(ChannelCreatedEvent.self) { context, envelope, event in
            print("🆕 New channel created: \(event.channel?.name ?? "unknown")")
        }
        
        router.onEvent(MemberJoinedChannelEvent.self) { context, envelope, event in
            print("👋 User joined channel: \(event.user ?? "unknown") -> \(event.channel ?? "unknown")")
        }
        
        await slack.addSocketModeMessageRouter(router)

        print("🔌 Connecting to Slack via Socket Mode...")
        print("👀 Monitoring all channels for thread activity...")
        print("💡 The bot will post links when new thread messages are detected")
        print("   Press Ctrl+C to stop the server")
        
        try await slack.runInSocketMode()
    }
    
    /// Extract workspace ID from environment (simplified approach)
    private static func extractWorkspaceId() -> String {
        // In a real implementation, you might want to fetch this from Slack API
        // For now, we'll use a placeholder that you can configure
        return ProcessInfo.processInfo.environment["SLACK_WORKSPACE_ID"] ?? "your-workspace"
    }
    
    /// Build a Slack thread link
    private static func buildThreadLink(workspaceId: String, channelId: String, threadTs: String) -> String {
        // Convert timestamp to Slack's permalink format (remove decimal point)
        let permalinkTs = threadTs.replacingOccurrences(of: ".", with: "")
        
        // Slack thread URL format
        return "https://\(workspaceId).slack.com/archives/\(channelId)/p\(permalinkTs)?thread_ts=\(threadTs)"
    }
}