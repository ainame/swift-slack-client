# ``SlackBlockKit``

Type-safe Swift API for Slack's Block Kit UI framework.

## Overview

SlackBlockKit provides a comprehensive, type-safe Swift interface to Slack's Block Kit framework. Block Kit is Slack's UI framework that allows you to create rich, interactive messages and modal interfaces using a system of components called "blocks."

This library gives you direct access to all Block Kit components with full control over their properties and structure, matching Slack's JSON Block Kit specification exactly.

## Key Features

- **Complete Block Kit Coverage**: All blocks, elements, and composition objects
- **Type Safety**: Swift types prevent invalid Block Kit configurations
- **Direct API**: One-to-one mapping with Slack's Block Kit JSON structure
- **Full Control**: Access to all properties and advanced features
- **Zero Dependencies**: Pure Swift implementation with only OpenAPIRuntime dependency

## Architecture

Block Kit applications are composed of these key elements:

- **Blocks**: The main structural components (sections, headers, actions, etc.)
- **Elements**: Interactive components (buttons, select menus, inputs)
- **Composition Objects**: Reusable objects (text, options, confirmation dialogs)
- **Views**: Top-level containers (modals, home tabs)

## Quick Start

```swift
import SlackBlockKit

// Create a welcome message with an action button
let welcomeSection = SectionBlock(
    text: TextObject(
        type: .mrkdwn,
        text: "*Welcome to our team!* Let's get you started."
    ),
    accessory: .button(ButtonElement(
        text: TextObject(text: "Get Started", type: .plainText),
        actionId: "get_started_button",
        style: .primary
    ))
)

let blocks: [Block] = [.section(welcomeSection)]
```

## Topics

### Getting Started

- <doc:BlockKit> - Complete guide to Block Kit components and usage patterns

### Block Types

- ``Block``
- ``SectionBlock``
- ``HeaderBlock``
- ``ActionsBlock``
- ``InputBlock``
- ``ContextBlock``
- ``DividerBlock``
- ``ImageBlock``
- ``RichTextBlock``
- ``VideoBlock``
- ``FileBlock``
- ``MarkdownBlock``

### Interactive Elements

- ``ButtonElement``
- ``StaticSelectElement``
- ``ExternalSelectElement``
- ``UsersSelectElement``
- ``ChannelsSelectElement``
- ``ConversationsSelectElement``
- ``PlainTextInputElement``
- ``NumberInputElement``
- ``EmailInputElement``
- ``DatePickerElement``
- ``TimePickerElement``
- ``CheckboxesElement``
- ``RadioButtonsElement``

### Composition Objects

- ``TextObject``
- ``OptionObject``
- ``OptionGroupObject``
- ``ConfirmationDialogObject``
- ``DispatchActionConfigurationObject``
- ``ConversationFilterObject``

### Views

- ``View``
- ``ModalView``
- ``HomeTabView``

### Element Types

- ``ActionElementType``
- ``InputElementType``
- ``ContextElementType``
- ``SectionAccessory``

## Integration

SlackBlockKit integrates seamlessly with other swift-slack-client modules:

- Use with ``SlackClient`` to send messages and open modals
- Combine with ``SlackBlockKitDSL`` for declarative syntax
- Access shared types from ``SlackModels``

```swift
import SlackClient
import SlackBlockKit

let slack = Slack(transport: transport, configuration: config)

try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#general",
        blocks: blocks
    ))
)
```

## See Also

- ``SlackBlockKitDSL`` for SwiftUI-inspired declarative syntax
- ``SlackClient`` for sending messages and handling interactions
- [Slack Block Kit Reference](https://api.slack.com/block-kit) - Official Slack documentation