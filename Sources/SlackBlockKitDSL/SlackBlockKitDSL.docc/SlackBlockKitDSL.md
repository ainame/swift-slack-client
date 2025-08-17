# ``SlackBlockKitDSL``

SwiftUI-inspired declarative syntax for building Slack Block Kit interfaces.

## Overview

SlackBlockKitDSL provides a modern, declarative API for building Slack Block Kit interfaces. Inspired by SwiftUI, it uses result builders and method chaining to create clean, readable code while maintaining the full power of Slack's Block Kit framework.

The DSL transforms verbose Block Kit JSON structures into intuitive Swift code, making it easier to build, maintain, and understand complex Slack interfaces.

## Quick Comparison

**SlackBlockKit:**
```swift
import SlackBlockKit

let welcome = SectionBlock(
    text: TextObject(
        type: .mrkdwn,
        text: "*Welcome!* Click the button to get started."
    ),
    accessory: .button(ButtonElement(
        text: TextObject(text: "Get Started", type: .plainText),
        actionId: "get_started",
        style: .primary
    ))
)
```

**SlackBlockKitDSL:**
```swift
import SlackBlockKitDSL

let welcome = Section {
    Text("*Welcome!* Click the button to get started.")
        .style(.mrkdwn)
}
.accessory(
    Button("Get Started")
        .actionId("get_started")
        .style(.primary)
)
```

## Quick Start

```swift
import SlackBlockKitDSL

// Create a reusable modal view
struct TaskCreationModal: SlackModalView {
    var title: TextObject {
        TextObject(text: "Create Task", type: .plainText)
    }
    
    var blocks: [Block] {
        Header {
            Text("Task Details")
        }
        
        Input("Title") {
            PlainTextInput("task_title")
                .placeholder("Enter task title")
        }
        
        Input("Priority") {
            StaticSelect("priority") {
                Option("High").value("high")
                Option("Medium").value("medium")
                Option("Low").value("low")
            }
        }
        
        Actions {
            Button("Create")
                .actionId("create_task")
                .style(.primary)
            
            Button("Cancel")
                .actionId("cancel")
        }
    }
}

// Use the modal
let modal = TaskCreationModal()
try await slack.client.viewsOpen(
    body: .json(.init(
        triggerId: triggerId,
        view: modal.render()
    ))
)
```

## Topics

### Getting Started

- <doc:BlockKitDSL> - Comprehensive guide to the DSL syntax and patterns

### Core Components

- ``Text``
- ``Section``
- ``Header``
- ``Actions``
- ``Input``
- ``Divider``
- ``Context``

### Interactive Elements

- ``Button``
- ``StaticSelect``
- ``UsersSelect``
- ``ChannelsSelect``
- ``ConversationsSelect``
- ``ExternalSelect``
- ``PlainTextInput``
- ``NumberInput``
- ``EmailInput``
- ``DatePicker``
- ``TimePicker``
- ``Checkboxes``
- ``RadioButtons``

### Composition Objects

- ``Option``
- ``OptionGroup``
- ``ConfirmationDialog``
- ``DispatchActionConfig``

### Rich Content

- ``RichText``
- ``RichSection``
- ``RichList``
- ``RichTextContent``
- ``RichEmoji``
- ``RichLink``
- ``RichUser``
- ``RichChannel``
- ``Image``
- ``Video``

### Views and Containers

- ``Modal``
- ``HomeTab``
- ``SlackView``
- ``SlackModalView``
- ``SlackHomeTabView``

### Result Builders

- ``BlockBuilder``
- ``ActionElementBuilder``
- ``ContextElementBuilder``
- ``TextBuilder``
- ``TextListBuilder``
- ``OptionBuilder``
- ``OptionGroupBuilder``
- ``InputElementBuilder``
- ``MarkdownBuilder``

### Protocols

- ``BlockComponent``
- ``ViewConvertible``
- ``ActionElementConvertible``
- ``InputElementConvertible``
- ``SectionAccessoryConvertible``

## Architecture

The DSL is built on several key concepts:

### Result Builders

Swift's result builders enable declarative syntax:

```swift
Modal("Settings") {
    Header { Text("Configuration") }
    
    Section { Text("General settings") }
    
    if showAdvanced {
        Section { Text("Advanced options") }
    }
    
    Actions {
        Button("Save").actionId("save")
        Button("Cancel").actionId("cancel")
    }
}
```

### Method Chaining

Fluent interface for component configuration:

```swift
Button("Submit")
    .actionId("submit_form")
    .style(.primary)
    .confirm(ConfirmationDialog(
        title: Text("Confirm"),
        text: Text("Submit the form?")
    ))
```

### Protocol-Based Views

Reusable components with SwiftUI-like patterns:

```swift
struct UserProfile: SlackModalView {
    let user: User
    
    var title: TextObject {
        TextObject(text: "User Profile", type: .plainText)
    }
    
    var blocks: [Block] {
        Header { Text(user.name) }
        Section { Text(user.email) }
        // ... more blocks
    }
}
```

## Integration

SlackBlockKitDSL builds on top of SlackBlockKit and integrates with the entire swift-slack-client ecosystem:

```swift
import SlackClient
import SlackBlockKitDSL

// Use with Socket Mode
router.onSlashCommand("/create-task") { context, payload in
    let modal = TaskCreationModal()
    try await slack.client.viewsOpen(
        body: .json(.init(
            triggerId: payload.triggerId,
            view: modal.render()
        ))
    )
    try await context.ack()
}

// Use with Web API
let blocks = [
    Header { Text("Status Update") },
    Section { Text("Deployment successful! ✅") }
]

try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#deployments",
        blocks: blocks.map { $0.render() }
    ))
)
```

## Best Practices

### Code Organization

- Group related components into reusable view protocols
- Use extensions to add domain-specific DSL components
- Separate data models from view logic

### Performance

- Use lazy evaluation for expensive computations in view builders
- Cache complex view structures when data doesn't change frequently
- Prefer functional composition over imperative construction

### Maintainability

- Keep view builders focused and break complex views into smaller components
- Use meaningful action IDs that include context
- Document complex conditional logic in view builders

## Migration from SlackBlockKit

The DSL provides a smooth migration path from direct SlackBlockKit usage:

```swift
// Before: SlackBlockKit
let section = SectionBlock(
    text: TextObject(type: .mrkdwn, text: "*Status:* Active"),
    accessory: .button(ButtonElement(
        text: TextObject(text: "Details", type: .plainText),
        actionId: "view_details",
        style: .primary
    ))
)

// After: SlackBlockKitDSL
let section = Section {
    Text("*Status:* Active").style(.mrkdwn)
}
.accessory(
    Button("Details")
        .actionId("view_details")
        .style(.primary)
)
```

## See Also

- ``SlackBlockKit`` for direct Block Kit API access
- ``SlackClient`` for sending messages and handling interactions
- [SwiftUI Documentation](https://developer.apple.com/xcode/swiftui/) for result builder patterns
