![swift-slack-client](/docs/logo.png)

[![Swift Version](https://img.shields.io/badge/Swift-6.1+-blue.svg)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/ainame/swift-slack-client/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/ainame/swift-slack-client)](https://github.com/ainame/swift-slack-client/releases)
[![Documentation](https://img.shields.io/badge/Documentation-DocC-blue.svg)](https://swiftpackageindex.com/ainame/swift-slack-client/documentation)
[![Build Status](https://img.shields.io/github/actions/workflow/status/ainame/swift-slack-client/test.yml?branch=main)](https://github.com/ainame/swift-slack-client/actions)

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

For Socket Mode, use `SocketModeRouter` to register callbacks and
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
let router = SocketModeRouter()

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
    // Interactive handlers must explicitly acknowledge
    try await context.ack()
    print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
}

router.onBlockAction("run-something") { context, payload in
    try await context.ack()
    print("onBlockAction: \(payload._type) \(payload.callbackId!)")
}

// Echo app with slash command
router.onSlashCommand("/echo") { context, payload in
    try await context.ack()
    try await context.say(channel: payload.channelId, text: "Echo: \(payload.text)")
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

await slack.addSocketModeRouter(router)

try await slack.runInSocketMode()
```

### Socket Mode Acknowledgments

Interactive handlers (global shortcuts, view submissions, slash commands, block actions, message shortcuts) must explicitly call `context.ack()` to acknowledge receipt. Event API handlers (message events, app mentions, etc.) do not require acknowledgment.

```swift
// Basic acknowledgment - most common case
router.onGlobalShortcut("my-shortcut") { context, payload in
    try await context.ack()
    // Handle shortcut...
}

// View submission with custom response (e.g., translation modal)
router.onViewSubmission("translation-form") { context, payload in
    // Extract form values
    guard let textInput = payload.view.state?["text_block", "text_input"]?.value,
          let targetLang = payload.view.state?["lang_block", "lang_select"]?.selectedOption?.value else {
        try await context.ack(errors: [
            "text_block": "Please enter text to translate",
            "lang_block": "Please select a target language"
        ])
        return
    }
    
    // Update view with loading state (keeps modal open)
    let loadingView = TranslationModal.buildLoadingView(text: textInput, lang: targetLang)
    try await context.ack(responseAction: .update, view: loadingView)
    
    // Process translation...
    let translatedText = try await translateText(textInput, to: targetLang)
    
    // Update with final result
    let resultView = TranslationModal.buildResultView(
        originalText: textInput,
        translatedText: translatedText,
        language: targetLang
    )
    try await context.client.viewsUpdate(
        body: .json(.init(view: resultView, viewId: payload.view.id))
    )
}

// Acknowledgment with validation errors
router.onViewSubmission("user-registration") { context, payload in
    // Extract and validate form data
    let email = payload.view.state?["email_block", "email_input"]?.value ?? ""
    let name = payload.view.state?["name_block", "name_input"]?.value ?? ""
    
    var validationErrors: [String: String] = [:]
    
    if email.isEmpty || !email.contains("@") {
        validationErrors["email_block"] = "Please enter a valid email address"
    }
    if name.count < 2 {
        validationErrors["name_block"] = "Name must be at least 2 characters"
    }
    
    if !validationErrors.isEmpty {
        try await context.ack(errors: validationErrors)
        return
    }
    
    // Success - continue processing
    try await context.ack()
    
    // Save user registration...
    try await saveUser(email: email, name: name)
}
```

Available response actions:
- `.update` - Update the current view (keeps modals open)
- `.push` - Push a new view onto the stack  
- `.clear` - Clear all views in the stack

# BlockKit (+DSL)

swift-slack-client provides two ways to build Slack Block Kit messages:

1. **SlackBlockKit** - Direct, type-safe API matching Slack's Block Kit structure
2. **SlackBlockKitDSL** - SwiftUI-inspired declarative syntax with result builders

### SlackBlockKit (Direct API)

Using SlackBlockKit directly gives you full control and matches Slack's JSON structure exactly:

```swift
import SlackBlockKit

// Create a simple message with SlackBlockKit
let headerBlock = HeaderBlock(
    text: TextObject(text: "Welcome to our team! 🎉", type: .plainText)
)

let sectionBlock = SectionBlock(
    text: TextObject(
        text: "We're excited to have you here. Let's get you started!",
        type: .mrkdwn
    ),
    accessory: ButtonElement(
        text: TextObject(text: "Get Started", type: .plainText),
        actionId: "get_started",
        style: .primary
    )
)

let dividerBlock = DividerBlock()

let actionBlock = ActionsBlock(
    elements: [
        ButtonElement(
            text: TextObject(text: "View Docs", type: .plainText),
            actionId: "view_docs",
            url: "https://docs.example.com"
        ),
        ButtonElement(
            text: TextObject(text: "Join Slack", type: .plainText),
            actionId: "join_slack",
            style: .primary
        )
    ]
)

// Combine blocks for the message
let blocks = [headerBlock, sectionBlock, dividerBlock, actionBlock]
```

### SlackBlockKitDSL (Declarative Syntax)

SlackBlockKitDSL provides a more intuitive, SwiftUI-like syntax with less boilerplate:

```swift
import SlackBlockKitDSL

// Create the same message with inline DSL
let blocks = Modal("Modal demo") {
    Header {
        Text("Welcome to our team! 🎉")
    }

    Section {
        Text("We're excited to have you here. Let's get you started!")
            .style(.mrkdwn)
    }
    .accessory(
        Button("Get Started")
            .actionId("get_started")
            .style(.primary)
    )

    Divider()

    Actions {
        Button("View Docs")
            .actionId("view_docs")
            .url("https://docs.example.com")

        Button("Join Slack")
            .actionId("join_slack")
            .style(.primary)
    }
}

// Or define view with struct like SwiftUI
struct DemoMessageModal: SlackModalView {
    let title: Text = "SlackModalView"

    var blocks: [Block] {
        Header {
            Text("Welcome to our team! 🎉")
        }

        Section {
            Text("We're excited to have you here. Let's get you started!")
                .style(.mrkdwn)
        }
        .accessory(
            Button("Get Started")
                .actionId("get_started")
                .style(.primary)
        )

        Divider()

        Actions {
            Button("View Docs")
                .actionId("view_docs")
                .url("https://docs.example.com")

            Button("Join Slack")
                .actionId("join_slack")
                .style(.primary)
        }
    }
}
```

More examples are available in [Examples](https://github.com/ainame/swift-slack-client/tree/main/Examples).

## Technical Notes

### Request Format Workaround

Due to limitations in swift-openapi-generator's handling of form-encoded requests with nested structures, swift-slack-client currently employs a workaround:

- The generated API accepts JSON request bodies
- A middleware automatically converts these to `application/x-www-form-urlencoded` format that Slack expects
- Nested objects are serialized as JSON strings within form fields

```swift
// You write JSON-style requests
try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#general", 
        blocks: [myBlock]  // Gets converted to JSON string in form data
    ))
)

// Middleware transforms to: channel=%23general&blocks=%5B%7B%22type%22%3A...
```

This workaround may be removed once swift-openapi-generator properly supports Slack's API requirements.

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
