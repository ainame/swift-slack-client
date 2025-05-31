![swift-slack-client](/docs/logo.png)

swift-slack-client is an _unofficial_ library that aims to provide a Swift equivalent of the official Slack Bolt framework and SDK available for Python, TypeScript, Java, etc.
Build Slack apps using the language you love.

**Note: The WebAPI client works but is not tested for all methods. Please provide feedback. The library is experimental and its API may change.**

## Key Features

swift-slack-client offers the following benefits:

* **Type-safe Slack Web API/Block Kit support** to build rich Slack apps
* **Built-in Socket Mode support** - no ngrok required for local development
* **Automatically generated from OpenAPI specs** to stay current with official Web API changes
* **Designed for modern Swift on Server** - structured concurrency, swift-openapi-generator, Swift Package traits, etc.

## Get started

### Installation

Add this to your `Package.swift`. Since this package uses the swift-openapi-generator ecosystem,
you'll need to include a transport layer package as well.

```swift
    dependencies: [
        .package(url: "https://github.com/ainame/swift-slack-client.git", from: "0.0.1"),
        // Your choice of transport layer from https://github.com/apple/swift-openapi-generator?tab=readme-ov-file#package-ecosystem
        // AsyncHTTPClient is preferable but URLSession would just work for simple cases
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.1.0"),
        // or .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.1.0"),
    ]
```

swift-slack-client supports Swift Package traits, allowing you to opt in or out of features and Web API groups.
By default, all traits are enabled, which is great for trying out Socket Mode but may increase compile time.

If you only need a WebAPI client with URLSession for scripts, disabling "SocketMode" will significantly reduce build time.
Socket Mode depends on [hummingbird-project/swift-websocket](https://github.com/hummingbird-project/swift-websocket) and SwiftNIO,
which won't be compiled when traits are minimized.

```swift
    dependencies: [
        .package(
            url: "https://github.com/ainame/swift-slack-client.git",
            from: "0.0.1",
            traits: [
                "SocketMode",   // To use Socket Mode. If specified, swift-websocket package will be included
                "Events",       // To decode event payloads via Events API (not RTM)
                "WebAPI_Chat",  // Each Web API is grouped by trait; chat.postMessage -> WebAPI_Chat
                "WebAPI_Views", // APIs won't be available unless the corresponding trait is enabled
            ]
        )
    ]
```

### Web API Client

Here's how to post a message to a Slack channel:

1. Install swift-slack-client and a transport library via Swift Package Manager with the `WebAPI_Chat` trait enabled
2. Initialize a Slack instance with transport and token (create a token in Slack's console)
3. Use `slack.client` to access APIs enabled by your chosen traits

```swift
import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(token: token),
)

// WebAPI_Chat trait must be enabled.
let response = try await slack.client.chatPostMessage(
    body: .json(
        .init(channel: channel, text: message),
    ),
)

// This is true if the request succeeded
print(try response.ok.body.json.ok)
```

You can use SlackBlockKitDSL/SlackBlockKit to compose rich messages:

```swift
import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackBlockKit
import SlackBlockKitDSL

let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(token: token),
)

// DSL
let block = Section {
    Text("A message *with some bold text* and _some italicized text_.")
        .type(.mrkdwn)
}

let result = try await slack.client.chatPostMessage(
    body: .json(
        .init(channel: channel, blocks: [block.render()])
    ),
)
try debugPrint(result.ok.body.json)

// This is true if the request succeeded
print(try response.ok.body.json.ok)
```

### Socket Mode

For Socket Mode, use `SocketModeMessageRouter` to register callbacks and
route events, slash commands, global shortcuts, message shortcuts, and more.

```swift
// You need app level token (`appToken`) to open a connection
let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(
        appToken: appToken,
        token: token,
    ),
)

// Create a router
let router = SocketModeMessageRouter()

// onSocketModeMessage handles routing for all events
//
// context - provides access to API client, logger and helpers
// envelope - wrapper structure containing payloads
router.onSocketModeMessage { context, envelope in
    print("onMessage")
}

// Granular event routing
router.onEvent { context, envelope in
    switch envelope.event {
    case .appMention:
        print("onEvent: appMention")
    case .message:
        print("onEvent: message")
    default:
        break
    }
}

// More fine-grained routing
router.onEvent(AppMentionEvent.self) { _, _, _ in
    print("onEvent: AppMentionEvent")
}

// All the interactive payloads
router.onInteractive { context, envelope in
    switch envelope.body {
    case .shortcut:
        print("onInteractive: .shortcut")
    case .messageAction:
        print("onInteractive: .messageAction")
    case .slashCommands:
        print("onInteractive: .slashCommands")
    case .blockActions:
        print("onInteractive: .blockActions")
    case .viewSubmission:
        print("onInteractive: .viewSubmission")
    case .viewClosed:
        print("onInteractive: .viewClosed")
    case .unsupported:
        print("onInteractive: .unsupported")
    }
}

// Handle specific callback IDs
router.onGlobalShortcut("run-something") { context, payload in
    print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
}

router.onBlockAction("run-something") { context, payload in
    print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
}

// Echo app with slash command
router.slashCommands("/echo") { context, envelope, event in
    context.respond(to: context.responseUrl, text: event.text, responseType: .inChannel)
}

// Simple text matching for message events
// Supports regex patterns as strings
router.onSlackMessageMatched(with: "Hello", "World") { context, envelope, payload in
    print("onSlackMessageMatched: \(payload.text!)")
}

// You can hook errors that occured while handling payloads
router.onError { context, envelope, error in
    print("\(error)")
}

await slack.addSocketModeMessageRouter(router)

try await slack.runInSocketMode()
```

More examples are available in [Examples](https://github.com/ainame/swift-slack-client/tree/main/Examples).

## Code Generation

We rely on these two _reliable_ sources to generate OpenAPI schemas:

* For Web API requests and parameters: https://github.com/slack-ruby/slack-api-ref
* For Web API responses and event schemas: https://github.com/slackapi/java-slack-sdk

slackapi/java-slack-sdk is the official Java SDK. slack-ruby/slack-api-ref was created for the community library
[slack-ruby/slack-ruby-client](https://github.com/slack-ruby/slack-ruby-client). It's built on top of [the former official API schemas repository](https://github.com/slackhq/slack-api-docs) (now archived) and has automation to pull the latest specs from the official documentation.

We generate JSON schemas for each endpoint, response, and event using [quicktype](https://github.com/glideapps/quicktype), then combine them for swift-openapi-generator. This approach was inspired by the official TypeScript SDK [slack-edge/slack-web-api-client](https://github.com/slack-edge/slack-web-api-client).

slackapi/java-slack-sdk provides sample JSON for each response and event, which quicktype uses to generate schemas. While the schemas are usable, they don't guarantee the optionality of parameters/fields. This is why many properties in the generated code are optional.

## Contribution

Feedback and PRs are welcome.

### Requirements

* Swift 6.1+
* SwiftFormat (install separately from Swift Package Manager)
* Node.js & quicktype (for schema generation)

### Setup

```bash
# Clone with submodules
git clone --recursive https://github.com/ainame/swift-slack-client.git

# Update source repositories
make update

# Generate code
make generate
```

## Notes

This is an unofficial, community-based project.
It is not affiliated with Slack Technologies, LLC.
