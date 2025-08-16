# Building Rich Interfaces with SlackBlockKit

Create complex, interactive Slack interfaces using Block Kit components.

## Overview

SlackBlockKit provides a comprehensive, type-safe Swift interface to Slack's Block Kit framework. Block Kit is Slack's UI framework that allows you to create rich, interactive messages and modal interfaces using a system of components called "blocks."

This module gives you direct access to all Block Kit components with full control over their properties and structure, matching Slack's JSON Block Kit specification exactly.

## Block Kit Fundamentals

Block Kit applications are composed of these key elements:

- **Blocks**: The main structural components (sections, headers, actions, etc.)
- **Elements**: Interactive components (buttons, select menus, inputs)
- **Composition Objects**: Reusable objects (text, options, confirmation dialogs)

### Core Building Blocks

```swift
import SlackBlockKit

// Text objects for content
let welcomeText = TextObject(
    type: .mrkdwn,
    text: "*Welcome to our team!* Let's get you started."
)

// Section block with text and accessory
let welcomeSection = SectionBlock(
    text: welcomeText,
    accessory: .button(ButtonElement(
        text: TextObject(text: "Get Started", type: .plainText),
        actionId: "get_started_button",
        style: .primary
    ))
)

// Header block
let headerBlock = HeaderBlock(
    text: TextObject(text: "Team Onboarding", type: .plainText)
)

// Combine into a message
let blocks: [Block] = [
    .header(headerBlock),
    .section(welcomeSection)
]
```

## Block Types

SlackBlockKit supports all Block Kit block types:

### Layout Blocks

**SectionBlock**: Display text and an optional accessory element
```swift
SectionBlock(
    text: TextObject(type: .mrkdwn, text: "Task *completed* ✅"),
    accessory: .button(ButtonElement(
        text: TextObject(text: "View Details", type: .plainText),
        actionId: "view_details"
    ))
)
```

**HeaderBlock**: Large text for section headers
```swift
HeaderBlock(
    text: TextObject(text: "Project Status", type: .plainText)
)
```

**DividerBlock**: Visual separator
```swift
DividerBlock()
```

**ActionsBlock**: Container for interactive elements
```swift
ActionsBlock(elements: [
    .button(ButtonElement(
        text: TextObject(text: "Approve", type: .plainText),
        actionId: "approve",
        style: .primary
    )),
    .button(ButtonElement(
        text: TextObject(text: "Reject", type: .plainText),
        actionId: "reject",
        style: .danger
    ))
])
```

**ContextBlock**: Supplementary information
```swift
ContextBlock(elements: [
    .text(TextObject(text: "Last updated: 2 hours ago", type: .mrkdwn))
])
```

### Input Blocks

**InputBlock**: Form inputs with labels
```swift
InputBlock(
    label: TextObject(text: "Email Address", type: .plainText),
    element: .plainTextInput(PlainTextInputElement(
        actionId: "email_input",
        placeholder: TextObject(text: "Enter your email", type: .plainText)
    ))
)
```

### Rich Content Blocks

**ImageBlock**: Display images
```swift
ImageBlock(
    altText: "Team photo",
    imageUrl: URL(string: "https://example.com/team.jpg")!,
    title: TextObject(text: "Our Amazing Team", type: .plainText)
)
```

**RichTextBlock**: Complex formatted content with lists, quotes, and styling
```swift
RichTextBlock(elements: [
    .section(RichTextSection(elements: [
        .text(RichTextTextElement(
            text: "Important: ",
            style: RichTextTextStyle(bold: true)
        )),
        .text(RichTextTextElement(text: "Please review the attached document."))
    ]))
])
```

## Interactive Elements

### Buttons

Create interactive buttons with various styles:

```swift
// Primary action button
ButtonElement(
    text: TextObject(text: "Submit", type: .plainText),
    actionId: "submit_form",
    style: .primary
)

// Danger button with confirmation
ButtonElement(
    text: TextObject(text: "Delete", type: .plainText),
    actionId: "delete_item",
    style: .danger,
    confirm: ConfirmationDialogObject(
        title: TextObject(text: "Delete Item", type: .plainText),
        text: TextObject(text: "Are you sure you want to delete this item?", type: .plainText),
        confirm: TextObject(text: "Delete", type: .plainText),
        deny: TextObject(text: "Cancel", type: .plainText)
    )
)
```

### Select Menus

Various types of select menus for different data sources:

```swift
// Static options
StaticSelectElement(
    options: [
        OptionObject(
            text: TextObject(text: "High Priority", type: .plainText),
            value: "high"
        ),
        OptionObject(
            text: TextObject(text: "Medium Priority", type: .plainText),
            value: "medium"
        )
    ],
    actionId: "priority_select",
    placeholder: TextObject(text: "Select priority", type: .plainText)
)

// User selection
UsersSelectElement(
    actionId: "assignee_select",
    placeholder: TextObject(text: "Assign to...", type: .plainText)
)

// Channel selection
ChannelsSelectElement(
    actionId: "channel_select",
    placeholder: TextObject(text: "Choose channel", type: .plainText)
)
```

### Input Elements

**PlainTextInputElement**: Single or multi-line text input
```swift
PlainTextInputElement(
    actionId: "description_input",
    placeholder: TextObject(text: "Enter description", type: .plainText),
    multiline: true,
    maxLength: 500
)
```

**CheckboxesElement**: Multiple choice selections
```swift
CheckboxesElement(
    options: [
        OptionObject(text: TextObject(text: "Email notifications", type: .plainText), value: "email"),
        OptionObject(text: TextObject(text: "SMS notifications", type: .plainText), value: "sms")
    ],
    actionId: "notification_preferences"
)
```

**DatePickerElement**: Date selection
```swift
DatePickerElement(
    actionId: "due_date",
    placeholder: TextObject(text: "Select due date", type: .plainText),
    initialDate: "2023-12-01"
)
```

## Composition Objects

### Text Objects

The foundation of all text content in Block Kit:

```swift
// Plain text (no formatting)
TextObject(type: .plainText, text: "Simple text content")

// Markdown text (supports formatting)
TextObject(type: .mrkdwn, text: "*Bold text* and _italic text_")

// Text with emoji control
TextObject(
    type: .plainText,
    text: "Text without emoji conversion",
    emoji: false
)
```

### Options and Option Groups

Structure choices for select menus and radio buttons:

```swift
// Individual option
OptionObject(
    text: TextObject(text: "Option 1", type: .plainText),
    value: "opt1",
    description: TextObject(text: "Description of option 1", type: .plainText)
)

// Grouped options
OptionGroupObject(
    label: TextObject(text: "Priority Levels", type: .plainText),
    options: [
        OptionObject(text: TextObject(text: "High", type: .plainText), value: "high"),
        OptionObject(text: TextObject(text: "Medium", type: .plainText), value: "medium"),
        OptionObject(text: TextObject(text: "Low", type: .plainText), value: "low")
    ]
)
```

### Confirmation Dialogs

Add confirmation steps to destructive actions:

```swift
ConfirmationDialogObject(
    title: TextObject(text: "Delete Project", type: .plainText),
    text: TextObject(
        text: "This will permanently delete the project and all associated data. This action cannot be undone.",
        type: .mrkdwn
    ),
    confirm: TextObject(text: "Yes, Delete", type: .plainText),
    deny: TextObject(text: "Cancel", type: .plainText),
    style: .danger
)
```

## Views

Block Kit views define the overall structure for modals and home tabs:

### Modal Views

```swift
ModalView(
    title: TextObject(text: "Project Settings", type: .plainText),
    blocks: [
        .header(HeaderBlock(text: TextObject(text: "Configuration", type: .plainText))),
        .input(InputBlock(
            label: TextObject(text: "Project Name", type: .plainText),
            element: .plainTextInput(PlainTextInputElement(
                actionId: "project_name",
                initialValue: "My Project"
            ))
        ))
    ],
    submit: TextObject(text: "Save", type: .plainText),
    close: TextObject(text: "Cancel", type: .plainText)
)
```

### Home Tab Views

```swift
HomeTabView(
    blocks: [
        .header(HeaderBlock(text: TextObject(text: "Welcome Dashboard", type: .plainText))),
        .section(SectionBlock(
            text: TextObject(text: "Your recent activity:", type: .mrkdwn)
        ))
    ]
)
```

## Best Practices

### Text Formatting

- Use `.plainText` for simple content and UI labels
- Use `.mrkdwn` for content that needs formatting (bold, italic, links)
- Always provide meaningful `alt_text` for images
- Keep text concise - Slack has character limits for various components

### User Experience

- Use confirmation dialogs for destructive actions
- Provide clear placeholder text for inputs
- Group related actions in `ActionsBlock`
- Use appropriate button styles (primary for main actions, danger for destructive actions)

### Performance

- Minimize the number of blocks in complex interfaces
- Use `blockId` properties to enable targeted updates
- Consider using `Context` blocks for supplementary information instead of additional sections

## Integration with SlackClient

Use these Block Kit components with SlackClient's Web API:

```swift
import SlackClient
import SlackBlockKit

let blocks: [Block] = [
    .header(HeaderBlock(text: TextObject(text: "Notification", type: .plainText))),
    .section(SectionBlock(
        text: TextObject(text: "Your deployment was successful! ✅", type: .mrkdwn)
    ))
]

try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#deployments",
        blocks: blocks
    ))
)
```

## See Also

- <doc:BlockKitDSL> for a SwiftUI-inspired declarative syntax
- [Slack Block Kit Reference](https://api.slack.com/block-kit/building) - Official Slack documentation
- <doc:Examples> for complete code examples