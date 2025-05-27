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

1. **Source Data**: Clones `java-slack-sdk` and `slack-api-ref` repositories for OpenAPI specs
2. **OpenAPI Generation**: Ruby scripts (`scripts/generate_openapi_json.rb`) process Slack API specs into OpenAPI JSON
3. **Swift Generation**: `swift-openapi-generator` creates Swift types and client code
4. **Code Processing**: `scripts/process_generated_code.rb` splits the generated monolithic client into trait-based files, extracts SlackModels, and integrates SlackBlockKit types
5. **Events Processing**: `scripts/process_events.rb` extracts Event structs from generated types and creates SlackEvent-conforming types

### SlackModels Module Extraction

The `process_generated_code.rb` script automatically:

- **Extracts 141+ model types** from WebAPI `Types.swift` to separate `Sources/SlackModels/Generated/` module
- **Preserves naming conventions** including underscore-prefixed types (e.g., `_Error.swift`, `_Type.swift`)
- **Transforms references** from `Components.Schemas.XXX` to `SlackModels.XXX` for moved types only
- **Maintains Response types** in WebAPI (e.g., `ChatPostMessageResponse` stays in Components)
- **Supports mixed sources** - both auto-generated and manually created models (e.g., `UserProfile.swift`)
- **Dynamic detection** - uses filesystem scanning to determine which types exist in SlackModels

## Common Commands

- **Generate all code**: `make generate` or `./scripts/generate_all.sh`
- **Process events**: `ruby scripts/process_events.rb` (extracts 96 Event types)
- **Clean temp files**: `make clean`
- **Build**: `swift build`
- **Test**: `swift test`
- **Run examples**: `swift run chatPostMessage` or `swift run views`

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

### Events Processing Pipeline

The `scripts/process_events.rb` script processes `.tmp/Events/Types.swift` and:

1. **Extracts Event structs** - Identifies all `*Event` types from OpenAPI generated schemas
2. **Preserves CodingKeys** - Keeps the generated CodingKeys for proper snake_case to camelCase conversion
3. **Integrates SlackBlockKit types** - Transforms type references for Block Kit components
4. **Fixes indentation** - Converts from 12-space nested to 4-space top-level struct format
5. **Adds trait compilation** - Wraps content with `#if Events` for conditional compilation
6. **SlackEvent conformance** - Updates inheritance from `Codable, Hashable, Sendable` to `SlackEvent`

### Key Transformations

- `Components.Schemas.View` → `ViewType` (with SlackBlockKit import)
- `Components.Schemas.Block` → `BlockType` (with SlackBlockKit import)
- Preserves `_type` property as generated (no transformation to `type`)
- Preserves CodingKeys enums for proper JSON serialization

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

## Memories

- Since swift-openapi-generator can't rely on keyEncoding/DecodingStrategy option, we need to use hardcoded CodingKeys entirely to convert snake_case <-> lowerCamel keys.
- The `_type` property is preserved as-is from swift-openapi-generator (not transformed to `type`) to maintain consistency across the codebase.
- All DSL components in SlackBlockKit use @autoclosure modifiers for cleaner syntax without explicit closures.
