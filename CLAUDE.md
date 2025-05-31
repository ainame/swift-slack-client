# CLAUDE.md

Guidance for Claude Code (claude.ai/code) when working with this Swift Slack client library.

## Project Overview

Swift Slack client library auto-generated from Slack's OpenAPI specs using swift-openapi-generator. Provides type-safe WebAPI and Socket Mode functionality.

## Architecture

- **SlackClient**: Main actor-based client with WebAPI, Events, and SocketMode
- **SlackModels**: 141+ shared model types (User, Channel, Message, etc.) in separate module
- **SlackBlockKit**: Custom Block Kit UI framework implementation
- **SlackBlockKitDSL**: SwiftUI-like declarative DSL for Block Kit

## Code Generation

### Setup
```bash
make update    # Update git submodules (.dependencies/*)
make generate  # Run full code generation
make clean     # Clean temp files
```

### Generation Pipeline
1. Ruby scripts process Slack API specs → OpenAPI JSON
2. swift-openapi-generator → Swift types and client
3. `process_webapi.rb` → Splits monolithic client, extracts models
4. `process_events.rb` → Extracts 96 Event types with SlackEvent conformance
5. SwiftFormat → 4-space indentation

### Key Scripts
- `generate_webapi.rb`, `generate_events.rb` - Create OpenAPI specs
- `process_webapi.rb` - Split generated code by traits, extract models
- `process_events.rb` - Extract event types, handle message subtypes

## Package Structure

### Swift Package Traits
```swift
.package(url: "...", traits: [
    "SocketMode",    // WebSocket support
    "Events",        // Events API
    "WebAPI_Chat",   // Individual API groups
    "WebAPI_Views",
])
```

### Conditional Compilation
- `#if WebAPI_*` - API method availability
- `#if SocketMode` - Real-time features
- `#if Events` - Event handling

## SlackBlockKit DSL

### Features
- SwiftUI-like declarative syntax
- Smart Section handling (single Text → text, multiple → fields)
- @autoclosure modifiers for clean syntax
- TextObject conforms to ExpressibleByStringLiteral

### Example
```swift
struct WelcomeModal: SlackModalView {
    let userName: String

    var title: TextObject { "Welcome \(userName)!" }

    var blocks: [BlockType] {
        Section {
            Text("*Welcome!*").style(.mrkdwn)
        }

        Actions {
            Button("Get Started")
                .style(.primary)
                .actionId("start")
        }
    }
}

let modal = WelcomeModal(userName: "Alice").build()
```

### Result Builders
- `@BlockBuilder` - Build block arrays
- `@ActionElementBuilder` - Build action elements
- `@ContextElementBuilder` - Build context elements
- `@OptionBuilder` - Build options
- `@TextListBuilder` - Build text arrays

## Events API

### Message Event Handling
Special handling for message subtypes:
```swift
case "message":
    let subtype = try subtypeContainer.decodeIfPresent(String.self, forKey: .subtype)
    switch subtype {
    case "bot_message": self = .messageBot(...)
    case nil: self = .message(...)  // Regular message
    case .some(let unknown): self = .unsupported("message - \(unknown)")
    }
```

### Supported Subtypes
- `bot_message`, `message_changed`, `message_deleted`
- `channel_join`, `channel_leave`, `channel_archive`
- `file_share`, `me_message`, `thread_broadcast`

## Socket Mode

### Usage
```swift
let router = SocketModeMessageRouter()

router.onSlashCommand("/echo") { context, payload in
    try await context.client.chatPostMessage(
        channel: payload.channelId,
        text: "Echo: \(payload.text)"
    )
}

router.onEvent(AppMentionEvent.self) { context, envelope, event in
    // Handle app mentions
}

await slack.addSocketModeMessageRouter(router)
try await slack.runInSocketMode()
```

## Technical Notes

### CodingKeys
All types use explicit CodingKeys for snake_case ↔ camelCase conversion (swift-openapi-generator requirement).

### Property Naming
- `_type` property preserved as-is (not transformed to `type`)
- SlackEvent protocol requires `var _type: String { get }`

### Module Separation
SlackModels as separate module prevents naming conflicts and reduces compilation dependencies.

### Testing
Uses swift-testing framework (not XCTest).

## Common Commands

```bash
# Development
make update        # Update dependencies
make generate      # Generate all code
swift build        # Build
swift test         # Run tests
make format        # Format code

# Examples
swift run chatPostMessage
swift run echoSlashCommand

# Release
ruby scripts/release.rb [version] [--yes]
```

## Memories

- CodingKeys required for all types (no keyEncoding/DecodingStrategy)
- `_type` property consistency across codebase
- SlackView uses `blocks` not `body` property
- TextObject supports string literals
- Message events use subtype field for differentiation
- DSL result builders need proper array handling for conditionals/loops
- Use swift-testing (bundled with Swift's toolchain) when writing unit test. Each file should group test cases with struct as test suite
