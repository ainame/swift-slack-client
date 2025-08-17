# Getting Started

Learn how to set up and use SlackClient in your project.

## Installation

Add SlackClient to your Swift package or Xcode project:

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/ainame/swift-slack-client", from: "0.1.0")
]
```

### Selecting Traits

SlackClient uses traits to include only the API components you need:

```swift
.package(
    url: "https://github.com/ainame/swift-slack-client",
    from: "0.1.0",
    traits: [
        "WebAPI_Chat",    // Chat API methods
        "WebAPI_Views",   // Views API methods
        "SocketMode",     // Real-time Socket Mode
        "Events"          // Event handling
    ]
)
```

See <doc:Traits> for details.


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
try await client.chatPostMessage(
    channel: "#general",
    text: "Hello from SwiftSlackClient!"
)
```

### Getting Channel Information

```swift
let response = try await client.conversationsInfo(channel: "C1234567890")
print("Channel name: \(response.channel?.name ?? "Unknown")")
```

## Socket Mode

For real-time interactions, use Socket Mode. This way you can build Slack apps with various ways such as a plain app with Events, Shortcuts or Slash Commands. 

```swift
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
```
