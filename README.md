[![Swift Version](https://img.shields.io/badge/Swift-6.2+-blue.svg)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/ainame/swift-slack/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/ainame/swift-slack)](https://github.com/ainame/swift-slack/releases)
[![Documentation](https://img.shields.io/badge/Documentation-DocC-blue.svg)](https://ainame.github.io/swift-slack/)
[![Build Status](https://img.shields.io/github/actions/workflow/status/ainame/swift-slack/test.yml?branch=main)](https://github.com/ainame/swift-slack/actions)

# swift-slack

swift-slack is an _unofficial_ library that aims to provide a Swift equivalent of the official Slack Bolt framework and SDK available for Python, TypeScript, Java, etc.
Build Slack apps using the language you love.

📖 **[Complete Documentation](https://ainame.github.io/swift-slack/)** - Full API reference, guides, and examples

Migration guide from 0.5.x to 0.6 or newer: [Migrating to SlackApp](./MIGRATING_TO_SLACKAPP.md)

## Get started

There are two normal entry points:

- `SlackClient` for a low-level Web API client
- `SlackKit` for interactive Slack apps built with Socket Mode or HTTP request handling

### Install the package

Use the package directly:

```swift
dependencies: [
    .package(
        url: "https://github.com/ainame/swift-slack.git",
        from: "0.5.1"
    )
]
```

For smaller builds, enable only the traits your app needs:

```swift
    .package(
        url: "https://github.com/ainame/swift-slack.git",
        from: "0.5.1",
        traits: [
            "SocketMode",   // WebSocket support
            "Events",       // Events API
            "WebAPI_Apps",  // apps.connections.open for Socket Mode
            "WebAPI_Chat",  // chat.postMessage, etc.
            "WebAPI_Views", // views.open, etc.
        ]
    )
```

### Use `SlackClient` for Web API calls

`SlackClient` is the lower-level client surface. You provide the transport and call Web API methods directly.

```swift
import OpenAPIAsyncHTTPClient // you can choose other transport layer available for swift-openapi-generator ecosystem
import SlackClient

let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(token: token)
)

try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#general",
        text: "Hello from swift-slack"
    ))
)
```

Add `SlackBlockKitDSL` if you want to build blocks with the DSL:

```swift
import SlackBlockKitDSL

let section = Section {
    Text("A message *with some bold text* and _some italicized text_.")
        .type(.mrkdwn)
}

try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#general",
        blocks: [section.render()]
    ))
)
```

### Use `SlackKit` for interactive apps

`SlackKit` is the recommended import for app code. It re-exports the runtime layer and the common app-authoring types used by interactive apps.

```swift
import SlackKit

let router = Router()

router.onEvent(AppMentionEvent.self) { context, _, event in
    try await context.client.chatPostMessage(
        body: .json(.init(
            channel: event.channel,
            text: "Hello!"
        ))
    )
}

router.onSlashCommand("/echo") { context, payload in
    try await context.ack()
    try await context.say(channel: payload.channelId, text: "Echo: \(payload.text)")
}

let app = SlackApp(
    configuration: .init(
        appToken: appToken,
        token: token
    ),
    router: router,
    mode: .socketMode()
)

try await app.run()
```

If you need setup work before the runtime starts, use the `preparing` hook:

```swift
try await app.run { slack in
    _ = try await slack.authTest()
}
```

### HTTP mode

For signed Slack requests over HTTP, use the runtime with an adapter such as `HummingbirdAdapter`:

```swift
import SlackKit

let router = Router()
let adapter = HummingbirdAdapter(hostname: "0.0.0.0", port: 8080)

let app = SlackApp(
    configuration: .init(
        token: token,
        signingSecret: signingSecret
    ),
    router: router,
    mode: .http(adapter)
)

try await app.run()
```

### Ack behavior

`SlackApp` follows Bolt-style acknowledgment semantics:

- Events API handlers are auto-acked and receive `EventContext`
- Slash commands, block actions, shortcuts, and view handlers receive `Context` and must call `ack()`
- Router registrations are overwrite-based, so the last handler for the same key wins
- `onSlackMessageMatched(...)` was removed; use `router.onEvent(MessageEvent.self)` and filter in the handler

```swift
router.onViewSubmission("form") { context, payload in
    guard let email = payload.view.state?["email_block", "email_input"]?.value else {
        try await context.ack(errors: ["email_block": "Please enter an email"])
        return
    }

    try await context.ack()
}
```

### Running with `ServiceGroup`

`SlackApp` conforms to `Service`, so it can run inside `swift-service-lifecycle`:

```swift
import Logging
import ServiceLifecycle
import SlackKit

let group = ServiceGroup(
    services: [app],
    gracefulShutdownSignals: [.sigterm, .sigint],
    logger: Logger(label: "MySlackApp")
)

try await group.run()
```

### Choose the right product

- Use `SlackClient` when you want raw Web API access and full control over transport setup.
- Use `SlackKit` for normal Slack app code.
- Use `SlackApp` directly only when you want the runtime layer without the umbrella re-exports.

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

See [Examples](https://github.com/ainame/swift-slack/tree/main/Examples) for more patterns.

## Technical Notes

**Request Format**: The library automatically converts JSON requests to form-encoded format that Slack expects. This is transparent to users but may change in future versions of swift-openapi-generator.

## Code Generation

Generated from official Slack API sources:
- **Web API**: [slack-ruby/slack-api-ref](https://github.com/slack-ruby/slack-api-ref) for request parameters
- **Responses/Events**: [slackapi/java-slack-sdk](https://github.com/slackapi/java-slack-sdk) for response schemas

Uses [quicktype](https://github.com/glideapps/quicktype) to generate JSON schemas, then swift-openapi-generator for Swift code. Many properties are optional due to schema inference limitations.

This package includes generated Web API and Events/Models layers derived from
the upstream reference data above. Top-level attribution and bundled upstream
MIT license texts are available in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

## Development

Requirements: Swift 6.1+, SwiftFormat, Node.js

```bash
git clone --recursive https://github.com/ainame/swift-slack.git
make update && make generate
```

**Note**: This is an unofficial, community-based project not affiliated with Slack Technologies, LLC.
