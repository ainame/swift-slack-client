# Getting Started

Learn how to set up and use the `SlackClient` Web API client in your project.

## Installation

Add the package to your Swift package or Xcode project:

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/ainame/swift-slack", from: "0.5.1")
]
```

### Selecting Traits

Use traits to include only the API components you need:

```swift
.package(
    url: "https://github.com/ainame/swift-slack",
    from: "0.5.1",
    traits: [
        "WebAPI_Chat",    // Chat API methods
        "WebAPI_Views"    // Views API methods
    ]
)
```

See <doc:Traits> for details.

To build an app runtime for Socket Mode or HTTP request handling, prefer the `SlackKit` product. See the `SlackApp` documentation for the underlying runtime layer.


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

## Next Step

`SlackClient` is the pure Web API layer. If you need Events API payload types, routing, acknowledgements, Socket Mode, or HTTP request handling, use `SlackKit` for the normal app-authoring path or `SlackApp` directly for the lower-level runtime layer.
