# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Swift Slack client library automatically generated using swift-openapi-generator. The project generates Swift code from Slack's OpenAPI specifications to provide type-safe WebAPI and Socket Mode functionality.

## Architecture

- **Main Client**: `Sources/SlackClient/Slack.swift` - Actor-based main client class that manages API calls and Socket Mode connections
- **Generated WebAPI**: `Sources/SlackClient/WebAPI/Generated/` - Auto-generated API client code split by Slack API groups (Admin, Apps, Auth, Chat, etc.)
- **SlackModels**: `Sources/SlackModels/Generated/` - Separated module containing 141+ shared model types (User, Channel, Message, etc.) to avoid naming conflicts
- **Socket Mode**: `Sources/SlackClient/Client/SocketMode/` - Real-time WebSocket-based event handling (conditional compilation with `#if SocketMode`)
- **Events & Interactions**: `Sources/SlackClient/Events/` and `Sources/SlackClient/Interactions/` - Event and interaction payload types
- **Examples**: `Examples/` directory contains CLI tools demonstrating usage

## Code Generation

The codebase uses a multi-step generation process:

### Dependencies Setup

Uses Git submodules for reproducible code generation:
- **java-slack-sdk**: Provides sample JSON payloads at `.dependencies/java-slack-sdk`
- **slack-api-ref**: Provides API method definitions at `.dependencies/slack-api-ref`

Run `make update` to initialize and update submodules to latest main/master branches.

### Generation Process

1. **Source Data**: Uses submodules at `.dependencies/` for OpenAPI specs
2. **OpenAPI Generation**: Ruby scripts (`scripts/generate_webapi.rb`, `scripts/generate_events.rb`) process Slack API specs into OpenAPI JSON
3. **Swift Generation**: `swift-openapi-generator` creates Swift types and client code
4. **Code Processing**: `scripts/process_webapi.rb` splits the generated monolithic client into trait-based files, extracts SlackModels, and integrates SlackBlockKit types
5. **Events Processing**: `scripts/process_events.rb` extracts Event structs from generated types and creates SlackEvent-conforming types
6. **Formatting**: SwiftFormat automatically formats all generated code with 4-space indentation

### SlackModels Module Extraction

The `process_generated_code.rb` script automatically:

- **Extracts 141+ model types** from WebAPI `Types.swift` to separate `Sources/SlackModels/Generated/` module
- **Preserves naming conventions** including underscore-prefixed types (e.g., `_Error.swift`, `_Type.swift`)
- **Transforms references** from `Components.Schemas.XXX` to `SlackModels.XXX` for moved types only
- **Maintains Response types** in WebAPI (e.g., `ChatPostMessageResponse` stays in Components)
- **Supports mixed sources** - both auto-generated and manually created models (e.g., `UserProfile.swift`)
- **Dynamic detection** - uses filesystem scanning to determine which types exist in SlackModels

## Common Commands

- **Update dependencies**: `make update` (pulls latest main/master from submodules)
- **Generate all code**: `make generate`
- **Process events**: `ruby scripts/process_events.rb` (extracts 96 Event types)
- **Clean temp files**: `make clean`
- **Build**: `swift build`
- **Test**: `swift test`
- **Run examples**: `swift run chatPostMessage` or `swift run views`
- **Format code**: `make format` (runs SwiftFormat)
- **Create release**: `ruby scripts/release.rb` (see Release Process section)

## Package Configuration

Uses Swift Package Manager with multiple targets and traits system:

### Targets
- **SlackClient**: Main client library with WebAPI, Events, and SocketMode functionality
- **SlackModels**: Shared model types (User, Channel, Message, etc.) with OpenAPIRuntime dependency
- **SlackBlockKit**: UI framework types for Slack's Block Kit (optional integration)

### Traits
- WebAPI traits: Each Slack API group (Admin, Apps, Chat, etc.) is a separate trait
- SocketMode trait: Enables WebSocket-based real-time functionality
- Events trait: Enables Events API support for 96+ event types
- Conditional compilation: Features are wrapped in `#if WebAPI_*`, `#if SocketMode`, `#if Events`

### Dependencies
- SlackClient depends on SlackModels for shared types
- SlackModels has minimal dependencies (OpenAPIRuntime, conditional SlackBlockKit)
- Clear module boundaries prevent naming conflicts and circular dependencies

## Key Implementation Details

- **Actor-based**: Main `Slack` class is an actor for thread-safety
- **Middleware**: Uses `RequestMiddlware` for authentication and request processing
- **Configuration**: `ClientConfiguration` manages tokens and settings
- **Socket Mode**: Optional WebSocket client for real-time events using swift-websocket library

## SlackBlockKit

Custom implementation of Slack's BlockKit UI framework at `Sources/SlackBlockKit/`:

- **CompositionObjects**: Core building blocks (TextObject, OptionObject, ConfirmationDialogObject, etc.)
- **BlockElements**: Interactive elements (ButtonElement, SelectMenus, Input elements, etc.)
- **Blocks**: Layout blocks (ActionsBlock, SectionBlock, InputBlock, etc.)
- **Views**: Surface types (ModalView, HomeTabView)

### Key Design Patterns

- **Type Safety**: Uses enums with associated values for polymorphic element handling
- **Codable Compliance**: All types conform to Codable with proper JSON serialization
- **Type Properties**: Uses `public let type: String // "type_value"` pattern with type set in initializers
- **Integration**: Replaces auto-generated schema types in WebAPI client code via `scripts/process_generated_code.rb`

### Implementation Notes

- Avoids protocol-based polymorphism due to Codable limitations
- Uses conditional imports (`#if canImport(SlackBlockKit)`) for optional integration
- Follows Slack API specifications exactly for compatibility
- Organizes files by functional grouping for maintainability

## Events API

Custom implementation of Slack's Events API at `Sources/SlackClient/Events/`:

- **Generated Events**: 96 Event types automatically extracted from OpenAPI specs to `Sources/SlackClient/Events/Generated/`
- **SlackEvent Protocol**: Base protocol that all events conform to (`Decodable, Sendable, Hashable`) with `var _type: String { get }` requirement
- **Custom Events**: Hand-written events in `Sources/SlackClient/Events/` for special cases
- **EventType Enum**: Polymorphic enum that can decode any Slack event based on the type field

### Events Processing Pipeline

The `scripts/process_events.rb` script processes `.tmp/Events/Types.swift` and:

1. **Extracts Event structs** - Identifies all `*Event` types from OpenAPI generated schemas
2. **Preserves CodingKeys** - Keeps the generated CodingKeys for proper snake_case to camelCase conversion
3. **Integrates SlackBlockKit types** - Transforms type references for Block Kit components
4. **Fixes indentation** - Converts from 12-space nested to 4-space top-level struct format
5. **Adds trait compilation** - Wraps content with `#if Events` for conditional compilation
6. **SlackEvent conformance** - Updates inheritance from `Codable, Hashable, Sendable` to `SlackEvent`
7. **Generates EventType enum** - Creates polymorphic decoder with special handling for message subtypes

### Message Event Subtypes

Slack's message events are unique in using a `subtype` field for differentiation:

- **Regular messages**: `type: "message"` with no subtype
- **Message subtypes**: `type: "message"` with `subtype: "bot_message"`, `"channel_join"`, etc.
- **Special handling in EventType**: Checks subtype field for message events to decode correct type

#### Message Subtype Decoding Logic

```swift
case "message":
    let subtypeContainer = try decoder.container(keyedBy: MessageSubtypeCodingKeys.self)
    let subtype = try subtypeContainer.decodeIfPresent(String.self, forKey: .subtype)

    switch subtype {
    case "bot_message":
        self = .messageBot(try MessageBotEvent(from: decoder))
    case "channel_join":
        self = .messageChannelJoin(try MessageChannelJoinEvent(from: decoder))
    // ... other known subtypes
    case nil:
        // No subtype - regular message
        self = .message(try MessageEvent(from: decoder))
    case .some(let unknownSubtype):
        // Unknown subtype - mark as unsupported
        self = .unsupported("message - \(unknownSubtype)")
    }
```

#### Supported Message Subtypes

- `bot_message` → MessageBotEvent
- `message_changed` → MessageChangedEvent
- `message_deleted` → MessageDeletedEvent
- `channel_archive`, `channel_join`, `channel_leave`, etc. → MessageChannel*Event
- `file_share` → MessageFileShareEvent
- `me_message` → MessageMeEvent
- `thread_broadcast` → MessageThreadBroadcastEvent
- And more...

### Key Transformations

- `Components.Schemas.View` → `ViewType` (with SlackBlockKit import)
- `Components.Schemas.Block` → `BlockType` (with SlackBlockKit import)
- Preserves `_type` property as generated (no transformation to `type`)
- Preserves CodingKeys enums for proper JSON serialization
- Maps event class names to Slack event type strings (e.g., `ChannelIDChangedEvent` → `"channel_id_changed"`)

### Error Handling

- **Proper error propagation**: Uses `try` instead of `try?` for JSON parsing
- **Unknown types**: Returns `.unsupported(String)` with the unknown type
- **Unknown message subtypes**: Returns `.unsupported("message - <subtype>")`
- **Invalid JSON**: Throws decoding errors up to caller

### Testing

Comprehensive unit tests in `Tests/SlackClientTests/EventTypeTests.swift` verify:
- Regular message decoding (no subtype)
- Known subtype handling (bot_message, channel_join, etc.)
- Unknown subtype handling (returns unsupported with full info)
- Null subtype handling (treated as regular message)
- Invalid subtype type handling (throws error)
- Payload extraction via `.payload` property
- All known message subtypes don't decode as unsupported

## Important Technical Notes

### Underscore-Prefixed Types
The code generation correctly handles Swift's naming conventions where types starting with underscores in OpenAPI (like `Error`) become underscore-prefixed in Swift (like `_Error`) to avoid keyword conflicts. The extraction logic:

- Uses actual struct names from declarations rather than schema comment names
- Preserves underscore prefixes in filenames (e.g., `_Error.swift`, `_Type.swift`)
- Maintains correct type references throughout the codebase

### Module Separation Benefits
The SlackModels module separation provides:

- **Naming conflict resolution** - avoids collisions between common names like `User`, `Message`
- **Reduced compilation dependencies** - models can be imported independently
- **Clear API boundaries** - separates data models from API operations
- **Extensibility** - supports both generated and manually created model types

## SlackBlockKit DSL

### Overview
A SwiftUI-like declarative DSL for Slack's Block Kit UI framework at `Sources/SlackBlockKit/DSL/`:

- **Main implementation**: `SlackBlockKitDSL.swift` - Comprehensive DSL components with modifier pattern
- **Builders**: `Builders.swift` - Result builders for blocks, actions, context elements
- **Protocols**: `BlockComponent.swift` - Core protocol definitions

### Key Features

#### 1. Text Styling
```swift
Text("*Bold* and _italic_").style(.mrkdwn).emoji(false).verbatim(true)
```

#### 2. Smart Section Handling
Single Section initializer that intelligently handles content:
- Single Text → uses `section.text`
- Multiple Texts → uses `section.fields`

```swift
Section {
    Text("Single text becomes section.text")
}

Section {
    Text("**Field 1**").style(.mrkdwn)
    Text("**Field 2**").style(.mrkdwn)  // Multiple become fields
}
```

#### 3. @autoclosure Modifiers
Clean syntax without explicit closures:
```swift
.confirm(ConfirmationDialog(...).style(.danger))
.placeholder(Text("Enter email").emoji(false))
.accessory(Button("Click").style(.primary))
```

#### 4. Complete Example
```swift
Modal(title: Text("Settings")) {
    Section {
        Text("*Preferences*").style(.mrkdwn)
    }

    Input(
        element: {
            Checkboxes {
                Option("Email").value("email")
                Option("Push").value("push")
            }
            .actionId("notifications")
        },
        label: {
            Text("Notifications")
        }
    )
    .optional(true)

    Actions {
        Button("Save")
            .style(.primary)
            .confirm(
                ConfirmationDialog(
                    title: Text("Confirm"),
                    text: Text("Save changes?")
                )
            )
    }
}
.asView()
```

### DSL Components

The DSL provides SwiftUI-like components for all major Block Kit elements:

#### Layout Blocks
- **Section** - Content sections with optional fields and accessories
- **Header** - Section headers
- **Divider** - Visual separators
- **Context** - Contextual information
- **Actions** - Button/element containers
- **Input** - Form input containers
- **Image** - Image blocks
- **Video** - Video blocks with metadata

#### Interactive Elements
- **Button** - Action buttons with styles and confirmations
- **Checkboxes** - Multi-select checkboxes
- **RadioButtons** - Single-select radio buttons
- **StaticSelect** - Static option dropdowns
- **UsersSelect** - User selection dropdowns
- **ConversationsSelect** - Channel/conversation selection
- **DatePicker** - Date selection
- **TimePicker** - Time selection
- **PlainTextInput** - Single/multi-line text input
- **NumberInput** - Numeric input with validation
- **EmailInput** - Email-specific input

#### Composition Objects
- **Text** - Plain or markdown text with styling
- **Option** - Select menu options
- **OptionGroup** - Grouped options
- **ConfirmationDialog** - Confirmation prompts
- **DispatchActionConfig** - Real-time interaction config

#### Views
- **Modal** - Modal dialogs
- **HomeTab** - App home tabs

### Implementation Details

- **CodingKeys**: Added to all BlockKit types for proper snake_case JSON encoding
- **Type Safety**: Uses enums with associated values for polymorphic elements
- **Modifier Pattern**: All components support chaining for configuration
- **Result Builders**: `@BlockBuilder`, `@ActionElementBuilder`, `@ContextElementBuilder`, `@OptionBuilder`
- **Protocol Design**: Conversion methods (`asXXX`) are implementation details not intended for direct use
- **@autoclosure Support**: Many modifiers use @autoclosure for cleaner syntax

## Code Generation Updates

### CodingKeys Preservation
All code generation scripts have been updated to preserve CodingKeys generated by swift-openapi-generator:

- **process_events.rb** - Preserves CodingKeys in Event types instead of skipping them
- **process_webapi.rb** - Preserves CodingKeys in WebAPI generated code
- **SlackModelsExtractor** - Already correctly preserving CodingKeys

### Property Name Consistency
- **_type property**: Kept as `_type` throughout the codebase (not transformed to `type`) for consistency with swift-openapi-generator output
- **SlackEvent protocol**: Uses `var _type: String { get }` to match generated code
- **SocketMode types**: All SocketMode message types use `_type` property with CodingKeys mapping to `"type"` in JSON

### Handcrafted Models
All manually created models now include explicit CodingKeys for snake_case conversion:

- SlackModels: AppStep, DndStatus, MessageEventMetadata, MessageRoot, PinnedInfo, Recording, Room, UserProfile, WorkflowConfiguration, WorkflowStep, WorkflowStepInput, WorkflowStepOutput
- Interaction Payloads: BlockActionsPaylaod, GlobalShortcutPayload, ViewClosedPayload, ViewSubmissionPayload
- SocketMode Messages: EventsApiEnvelope, SocketModeDisconnectMessage, SocketModeHelloMessage, SocketModeMessageEnvelope, SocketModeAcknowledgementlMessage

## SlackView Protocol System

A SwiftUI-inspired protocol system for building Slack Block Kit views at `Sources/SlackBlockKit/DSL/SlackView.swift`:

### Core Protocol Design

```swift
/// Base protocol for all Slack views
public protocol SlackView {
    @BlockBuilder
    var blocks: [BlockType] { get }
}

/// Protocol for modal views
public protocol SlackModalView: SlackView {
    var title: TextObject { get }
    var submit: TextObject? { get }
    var close: TextObject? { get }
    var callbackId: String? { get }
    // ... other modal properties with defaults
}

/// Protocol for home tab views
public protocol SlackHomeTabView: SlackView {
    var externalId: String? { get }
    var privateMetadata: String? { get }
}
```

### Key Features

1. **Type Safety**: Compiler ensures all required properties are implemented
2. **Default Implementations**: Optional properties have sensible defaults (`nil`)
3. **Unified Build Method**: Both protocols use `build()` to create final view types
4. **Blocks Property**: Uses `blocks` (not `body`) to match BlockKit API naming
5. **Native Control Flow**: Works with Swift's `if/else` and `for-in` loops naturally

### Usage Examples

```swift
struct WelcomeModal: SlackModalView {
    let userName: String

    var title: TextObject {
        "Welcome \(userName)!" // ✨ String literal support
    }

    var submit: TextObject? {
        "Get Started"
    }

    var blocks: [BlockType] {
        Section {
            Text("Welcome to our workspace!")
        }

        for feature in ["Chat", "Share", "Meet"] {
            Section {
                Text("• \(feature)")
            }
        }
    }
}

// Usage
let modal = WelcomeModal(userName: "Alice")
let modalView = modal.build() // Returns ModalView
```

### Reusable Subviews

SlackView protocol enables composition and reusability:

```swift
struct UserStatsView: SlackView {
    let userName: String
    let messageCount: Int

    var blocks: [BlockType] {
        Section {
            Text("*\(userName)'s Activity*").style(.mrkdwn)
            Text("Messages: \(messageCount)")
        }
    }
}

// Embed in other views
struct ProfileModal: SlackModalView {
    var blocks: [BlockType] {
        Header { Text("Profile") }

        UserStatsView(userName: "Alice", messageCount: 42) // ✨ Reusable subview

        Actions {
            Button("Edit Profile").actionId("edit")
        }
    }
}
```

### Testing

Tests use swift-testing framework and verify:
- Native for-in loops work with @BlockBuilder
- Conditional rendering with if/else
- Nested loops and complex control flow
- Modal and home tab protocol implementations
- Subview composition and reusability

### Benefits

- **SwiftUI-like**: Familiar protocol-based design pattern
- **Type Safe**: Compile-time guarantees for required view properties
- **Composable**: Easy to create reusable subview components
- **Clean API**: Unified `build()` method for all view types
- **BlockKit Consistent**: Uses `blocks` property to match Slack's API naming

## TextObject ExpressibleByStringLiteral

TextObject now conforms to `ExpressibleByStringLiteral` for clean, SwiftUI-like syntax at `Sources/SlackBlockKit/CompositionObjects/TextObject.swift`:

### Implementation

```swift
extension TextObject: ExpressibleByStringLiteral {
    /// Creates a plain text TextObject from a string literal
    public init(stringLiteral value: String) {
        self.init(type: .plainText, text: value)
    }
}
```

### Before vs After

**❌ Old verbose way:**
```swift
var title: TextObject {
    "Hello".asTextObject()
}

var submit: TextObject? {
    "Submit".asTextObject()
}
```

**✅ New clean way:**
```swift
var title: TextObject {
    "Hello" // ✨ String literal becomes TextObject automatically
}

var submit: TextObject? {
    "Submit" // ✨ Clean and readable
}
```

### Features

1. **String Interpolation**: Works with `"Hello \(userName)!"`
2. **Conditional Support**: `hasMessages ? "New Messages" : "All Clear"`
3. **Backward Compatible**: Old explicit syntax still works
4. **SwiftUI-like**: Follows Swift's native ExpressibleBy patterns
5. **Plain Text Default**: String literals create `.plainText` type (use `.asMrkdwnTextObject()` for markdown)

### Usage Examples

```swift
struct CleanModal: SlackModalView {
    let userName: String
    let hasNotifications: Bool

    var title: TextObject {
        hasNotifications ?
            "You have new messages!" :
            "All caught up \(userName)!"
    }

    var blocks: [BlockType] {
        Section {
            Text("Much cleaner syntax!")
        }
    }
}
```

## Socket Mode

Real-time WebSocket-based communication at `Sources/SlackClient/Client/SocketMode/`:

### Features
- **Event-driven architecture**: Uses `SocketModeMessageRouter` for handling different message types
- **Automatic acknowledgment**: Framework handles Socket Mode acknowledgments automatically
- **Type-safe handlers**: Strongly typed handlers for events, slash commands, and interactions
- **Slash command support**: Added via `router.onSlashCommand("/command") { context, payload in ... }`
- **WebSocket management**: Automatic connection handling and message routing

### Message Types
- **Events API**: AppMentionEvent, MessageEvent, and all other Slack events
- **Slash Commands**: Interactive slash command payloads
- **Interactive Components**: Block actions, view submissions, shortcuts
- **Hello/Disconnect**: Connection lifecycle messages

### Example Usage
```swift
// Echo slash command example
router.onSlashCommand("/echo") { context, payload in
    let text = payload.text.trimmingCharacters(in: .whitespacesAndNewlines)
    let responseText = text.isEmpty ? "👋 Hello!" : "🔊 Echo: \(text)"

    try await client.chatPostMessage(
        channel: payload.channelId,
        text: responseText
    )
}
```

## Memories

- Since swift-openapi-generator can't rely on keyEncoding/DecodingStrategy option, we need to use hardcoded CodingKeys entirely to convert snake_case <-> lowerCamel keys.
- The `_type` property is preserved as-is from swift-openapi-generator (not transformed to `type`) to maintain consistency across the codebase.
- All DSL components in SlackBlockKit use @autoclosure modifiers for cleaner syntax without explicit closures.
- SlackView protocol uses `blocks` property (not `body`) to match BlockKit API naming conventions.
- TextObject implements ExpressibleByStringLiteral for clean string literal syntax, defaulting to `.plainText` type.
- Tests use swift-testing framework (not XCTest) for modern Swift testing patterns.
- Message events use special subtype field handling - regular messages have no subtype, while specialized messages like bot_message have specific subtypes.
- EventType enum provides polymorphic decoding with proper error handling for unknown types and subtypes.

## Release Process

To create a new release, use the release script:

```bash
ruby scripts/release.rb
```

The script will:
1. Check prerequisites (gh CLI authentication, clean git state)
2. Display the latest tag and prompt for new version
3. Run tests and build verification
4. Create and push a git tag
5. Generate changelog from merged PRs since last tag
6. Create a draft GitHub release

Prerequisites:
- GitHub CLI (`gh`) must be installed and authenticated
- Working directory must be clean (no uncommitted changes)
- Tests must pass

The release is created as a draft, allowing you to review and edit before publishing.
