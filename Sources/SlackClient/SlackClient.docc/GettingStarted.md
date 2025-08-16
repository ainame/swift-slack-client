# Getting Started

Learn how to set up and use SlackClient in your project.

## Installation

Add SlackClient to your Swift package or Xcode project:

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/ainame/swift-slack-client", from: "1.0.0")
]
```

### Selecting Traits

SlackClient uses traits to include only the API components you need:

```swift
.package(url: "https://github.com/ainame/swift-slack-client", traits: [
    "WebAPI_Chat",    // Chat API methods
    "WebAPI_Views",   // Views API methods  
    "SocketMode",     // Real-time Socket Mode
    "Events"          // Event handling
])
```

Available traits include:
- **WebAPI traits**: `WebAPI_Admin`, `WebAPI_Apps`, `WebAPI_Chat`, `WebAPI_Conversations`, `WebAPI_Files`, `WebAPI_Users`, `WebAPI_Views`, and more
- **SocketMode**: Real-time WebSocket connections
- **Events**: Event handling and routing

## Basic Usage

### Creating a Client

```swift
import SlackClient
import HTTPTypes

let client = Slack(
    transport: URLSessionTransport(),
    configuration: .init(token: "xoxb-your-bot-token")
)
```

### Sending a Message

```swift
#if WebAPI_Chat
try await client.chatPostMessage(
    channel: "#general", 
    text: "Hello from SwiftSlackClient!"
)
#endif
```

### Getting Channel Information

```swift
#if WebAPI_Conversations
let response = try await client.conversationsInfo(channel: "C1234567890")
print("Channel name: \(response.channel?.name ?? "Unknown")")
#endif
```

## Socket Mode

For real-time interactions, use Socket Mode:

```swift
#if SocketMode
let router = SocketModeRouter()

router.onSlashCommand("/hello") { context, payload in
    try await context.client.chatPostMessage(
        channel: payload.channelId,
        text: "Hello, \(payload.userName)!"
    )
}

router.onEvent(AppMentionEvent.self) { context, envelope, event in
    try await context.client.chatPostMessage(
        channel: event.channel,
        text: "Thanks for mentioning me!"
    )
}

await client.addSocketModeRouter(router)
try await client.runInSocketMode()
#endif
```

## Next Steps

- Learn about <doc:Authentication> options
- Explore <doc:BlockKit> for rich message formatting
- Set up <doc:SocketMode> for real-time interactions
- Understand <doc:Traits> for modular imports