![swift-slack-client](/logo.png)

[![Swift Version](https://img.shields.io/badge/Swift-6.2+-blue.svg)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/ainame/swift-slack-client/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/ainame/swift-slack-client)](https://github.com/ainame/swift-slack-client/releases)
[![Documentation](https://img.shields.io/badge/Documentation-DocC-blue.svg)](https://ainame.github.io/swift-slack-client/)
[![Build Status](https://img.shields.io/github/actions/workflow/status/ainame/swift-slack-client/test.yml?branch=main)](https://github.com/ainame/swift-slack-client/actions)

swift-slack-client is an _unofficial_ library that aims to provide a Swift equivalent of the official Slack Bolt framework and SDK available for Python, TypeScript, Java, etc.
Build Slack apps using the language you love.

📖 **[Complete Documentation](https://ainame.github.io/swift-slack-client/)** - Full API reference, guides, and examples

## Documentation

This library provides comprehensive DocC documentation including:

- **API Reference**: Complete documentation for all public APIs, types, and methods
- **Getting Started**: Step-by-step setup guides for Web API and Socket Mode
- **Examples**: Real-world code examples and common patterns
- **Block Kit Guide**: Complete guide to building rich Slack UIs with both direct API and DSL approaches
- **Socket Mode**: Interactive routing, event handling, and acknowledgment patterns
- **Swift Package Traits**: How to optimize compilation with selective feature inclusion

The documentation is automatically generated from code and hosted on GitHub Pages. Browse by module:
- [SlackClient](https://ainame.github.io/swift-slack-client/documentation/slackclient/) - Main client and configuration
- [SlackModels](https://ainame.github.io/swift-slack-client/documentation/slackmodels/) - All Slack API types and models
- [SlackBlockKit](https://ainame.github.io/swift-slack-client/documentation/slackblockkit/) - Direct Block Kit API
- [SlackBlockKitDSL](https://ainame.github.io/swift-slack-client/documentation/slackblockkit/) - SwiftUI-style DSL for Block Kit

**Note: The WebAPI client works but is not tested for all methods. Please provide feedback. The library is experimental and its API may change.**

## Key Features

* **Type-safe Slack Web API/Block Kit support** to build rich Slack apps
* **Built-in Socket Mode support** - no ngrok required for local development
* **Automatically generated from OpenAPI specs** to stay current with official Web API changes
* **Designed for modern Swift on Server** - structured concurrency, swift-openapi-generator, Swift Package traits, etc.

## Get started

### Installation

Add this to your `Package.swift` with a transport layer:

```swift
dependencies: [
    .package(url: "https://github.com/ainame/swift-slack-client.git", from: "0.1.1"),
    .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.1.0"),
]
```

**Optional: Use Swift Package traits to minimize build time**

By default, all features are enabled. For production apps, you can enable only needed features:

```swift
.package(
    url: "https://github.com/ainame/swift-slack-client.git",
    from: "0.1.1",
    traits: [
        "SocketMode",   // WebSocket support
        "Events",       // Events API
        "WebAPI_Chat",  // chat.postMessage, etc.
        "WebAPI_Views", // views.open, etc.
    ]
)
```

### Web API Client

```swift
import SlackClient
import OpenAPIAsyncHTTPClient

let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(token: token)
)

// Simple text message
let response = try await slack.client.chatPostMessage(
    body: .json(.init(channel: "#general", text: "Hello!"))
)

// Rich message with Block Kit DSL
import SlackBlockKitDSL

let block = Section {
    Text("A message *with some bold text* and _some italicized text_.")
        .type(.mrkdwn)
}

try await slack.client.chatPostMessage(
    body: .json(.init(channel: "#general", blocks: [block.render()]))
)
```

### Socket Mode

```swift
let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(appToken: appToken, token: token)
)

let router = SocketModeRouter()

// Handle app mentions
router.onEvent(AppMentionEvent.self) { context, envelope, event in
    try await context.client.chatPostMessage(
        body: .json(.init(channel: event.channel, text: "Hello!"))
    )
}

// Echo slash command
router.onSlashCommand("/echo") { context, payload in
    try await context.ack()
    try await context.say(channel: payload.channelId, text: "Echo: \(payload.text)")
}

// Handle button interactions
router.onBlockAction("button_id") { context, payload in
    try await context.ack()
    // Handle button click
}

await slack.addSocketModeRouter(router)
try await slack.runInSocketMode()
```

**Interactive handlers must call `context.ack()`**

```swift
// Basic acknowledgment
router.onSlashCommand("/hello") { context, payload in
    try await context.ack()
    // Handle command...
}

// Acknowledgment with validation errors
router.onViewSubmission("form") { context, payload in
    guard let email = payload.view.state?["email_block", "email_input"]?.value else {
        try await context.ack(errors: ["email_block": "Please enter an email"])
        return
    }
    try await context.ack()
}

// Update view (keeps modal open)
try await context.ack(responseAction: .update, view: updatedView)
```

## Block Kit

Two ways to build Slack Block Kit messages:

### SlackBlockKit (Direct API)
```swift
import SlackBlockKit

let block = SectionBlock(
    text: TextObject(text: "Hello *world*!", type: .mrkdwn),
    accessory: ButtonElement(
        text: TextObject(text: "Click me", type: .plainText),
        actionId: "button_click"
    )
)
```

### SlackBlockKitDSL (SwiftUI-style)
```swift
import SlackBlockKitDSL

let block = Section {
    Text("Hello *world*!").style(.mrkdwn)
}
.accessory(
    Button("Click me").actionId("button_click")
)

// Or define reusable views
struct WelcomeModal: SlackModalView {
    var title: Text { "Welcome" }

    var blocks: [Block] {
        Header { Text("Getting Started") }
        Section { Text("Welcome to our app!") }
    }
}
```

See [Examples](https://github.com/ainame/swift-slack-client/tree/main/Examples) for more patterns.

## Technical Notes

**Request Format**: The library automatically converts JSON requests to form-encoded format that Slack expects. This is transparent to users but may change in future versions of swift-openapi-generator.

## Code Generation

Generated from official Slack API sources:
- **Web API**: [slack-ruby/slack-api-ref](https://github.com/slack-ruby/slack-api-ref) for request parameters
- **Responses/Events**: [slackapi/java-slack-sdk](https://github.com/slackapi/java-slack-sdk) for response schemas

Uses [quicktype](https://github.com/glideapps/quicktype) to generate JSON schemas, then swift-openapi-generator for Swift code. Many properties are optional due to schema inference limitations.

## Development

Requirements: Swift 6.1+, SwiftFormat, Node.js

```bash
git clone --recursive https://github.com/ainame/swift-slack-client.git
make update && make generate
```

**Note**: This is an unofficial, community-based project not affiliated with Slack Technologies, LLC.
