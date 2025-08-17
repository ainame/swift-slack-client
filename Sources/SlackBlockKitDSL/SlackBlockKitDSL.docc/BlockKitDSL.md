# SwiftUI-Style Block Kit with SlackBlockKitDSL

Build Slack interfaces using a declarative, SwiftUI-inspired syntax.

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

## Core DSL Components

### Text

The foundation of all text content with fluent configuration:

```swift
// Basic text (defaults to plain text)
Text("Hello, World!")

// Markdown text with formatting
Text("*Bold text* and _italic text_")
    .style(.mrkdwn)

// Plain text with emoji control
Text("No emoji here")
    .style(.plainText)
    .emoji(false)

// Verbatim text (no parsing)
Text("Literal &amp; text")
    .verbatim(true)
```

### Sections

Flexible content containers with smart field handling:

```swift
// Single text content
Section {
    Text("This becomes the main text")
}

// Multiple text items become fields
Section {
    Text("Field 1")
    Text("Field 2")
    Text("Field 3")
}

// Section with accessory
Section {
    Text("Choose an option:")
}
.accessory(
    StaticSelect("priority_select") {
        Option("High Priority").value("high")
        Option("Medium Priority").value("medium")
        Option("Low Priority").value("low")
    }
)

// Empty section for accessory-only use
Section()
    .accessory(Button("Click me").actionId("button_click"))
```

### Headers and Structure

```swift
// Page headers
Header {
    Text("Project Dashboard")
}

// Visual separators
Divider()

// Context information
Context {
    Text("Last updated: 2 hours ago")
    ContextImage(
        imageUrl: URL(string: "https://example.com/icon.png")!,
        altText: "Status icon"
    )
}
```

### Actions

Interactive element containers:

```swift
Actions {
    Button("Approve")
        .actionId("approve")
        .style(.primary)
    
    Button("Reject")
        .actionId("reject")
        .style(.danger)
        .confirm(ConfirmationDialog(
            title: Text("Confirm Rejection"),
            text: Text("Are you sure you want to reject this request?")
        ))
    
    StaticSelect("assign_to") {
        Option("Alice").value("alice")
        Option("Bob").value("bob")
        Option("Charlie").value("charlie")
    }
    .placeholder("Assign to...")
}
```

## Interactive Elements

### Buttons

Buttons with various styles and behaviors:

```swift
// Basic button
Button("Click Me")
    .actionId("click_action")

// Primary action button
Button("Submit")
    .actionId("submit_form")
    .style(.primary)

// Danger button with confirmation
Button("Delete")
    .actionId("delete_item")
    .style(.danger)
    .confirm(ConfirmationDialog(
        title: Text("Confirm Delete"),
        text: Text("This action cannot be undone.")
    ))

// Button with URL (no action required)
Button("View Docs")
    .url(URL(string: "https://docs.example.com")!)

// Button with accessibility
Button("Save")
    .actionId("save")
    .accessibilityLabel("Save the current document")
```

### Select Menus

Various types of select menus with fluent configuration:

```swift
// Static options with result builder
StaticSelect("priority") {
    Option("🔴 High Priority").value("high")
    Option("🟡 Medium Priority").value("medium")
    Option("🟢 Low Priority").value("low")
}
.placeholder("Choose priority")
.initialOption(Option("Medium Priority").value("medium"))

// Grouped options
StaticSelect("category") {
    OptionGroup("Priority", options: {
        Option("High").value("high")
        Option("Medium").value("medium")
    })
    OptionGroup("Type", options: {
        Option("Bug").value("bug")
        Option("Feature").value("feature")
    })
}

// User selection
UsersSelect("assignee")
    .placeholder("Assign to team member")

// Channel selection
ChannelsSelect("notify_channel")
    .placeholder("Select notification channel")
    .responseUrlEnabled(true)

// External data source
ExternalSelect()
    .actionId("external_search")
    .placeholder("Search external data")
    .minQueryLength(3)
```

### Form Inputs

Rich form input elements:

```swift
// Text input
Input("Description") {
    PlainTextInput("description_input")
        .placeholder("Enter a detailed description")
        .multiline(true)
        .maxLength(500)
}
.hint("Provide as much detail as possible")
.optional(false)

// Number input
Input("Quantity") {
    NumberInput()
        .actionId("quantity")
        .allowDecimal(false)
        .minValue("1")
        .maxValue("100")
}

// Email input with validation
Input("Email Address") {
    EmailInput()
        .actionId("email")
        .placeholder("your.email@company.com")
}

// Date selection
Input("Due Date") {
    DatePicker("due_date")
        .placeholder("Select due date")
        .initialDate("2023-12-01")
}

// Checkboxes for multiple selection
Input("Notification Preferences") {
    Checkboxes {
        Option("Email notifications").value("email")
        Option("SMS notifications").value("sms")
        Option("Push notifications").value("push")
    }
    .actionId("notifications")
    .initialOptions([
        Option("Email notifications").value("email")
    ])
}

// Radio buttons for single selection
Input("Priority Level") {
    RadioButtons {
        Option("High Priority").value("high")
        Option("Medium Priority").value("medium")
        Option("Low Priority").value("low")
    }
    .actionId("priority")
}
```

## Rich Content

### Rich Text

Sophisticated text formatting with lists, quotes, and styling:

```swift
RichText {
    RichSection {
        RichTextContent("Welcome to our ", bold: true)
        RichTextContent("project management")
        RichTextContent(" system!")
    }
    
    RichList(style: .bullet) {
        RichSection {
            RichTextContent("Create and assign tasks")
        }
        RichSection {
            RichTextContent("Track progress with ")
            RichLink("https://example.com/dashboard", text: "live dashboard")
        }
        RichSection {
            RichTextContent("Collaborate with ")
            RichUser("U123456", bold: true)
        }
    }
    
    RichQuote {
        RichTextContent("Remember: Great software is built by great teams.", italic: true)
    }
}
```

### Images and Media

```swift
// Image block
Image(
    imageUrl: URL(string: "https://example.com/chart.png")!,
    altText: "Monthly sales chart"
)
.title("Sales Performance")

// Video block
Video(
    videoUrl: URL(string: "https://example.com/video.mp4")!,
    thumbnailUrl: URL(string: "https://example.com/thumb.jpg")!,
    altText: "Product demo video",
    title: "How to Use Our Platform"
)
.description("A comprehensive walkthrough of key features")
.provider(name: "Vimeo")
```

## View Protocols

### Reusable Modal Views

Create reusable modal interfaces using SwiftUI-like patterns:

```swift
struct TaskCreationModal: SlackModalView {
    let projectId: String
    
    var title: TextObject {
        TextObject(text: "Create New Task", type: .plainText)
    }
    
    var submit: TextObject? {
        TextObject(text: "Create Task", type: .plainText)
    }
    
    var callbackId: String? {
        "create_task_\(projectId)"
    }
    
    var blocks: [Block] {
        Header {
            Text("Task Details")
        }
        
        Input("Task Title") {
            PlainTextInput("task_title")
                .placeholder("Enter task title")
                .maxLength(100)
        }
        
        Input("Description") {
            PlainTextInput("task_description")
                .placeholder("Describe the task")
                .multiline(true)
        }
        
        Input("Priority") {
            StaticSelect("priority") {
                Option("🔴 High").value("high")
                Option("🟡 Medium").value("medium")
                Option("🟢 Low").value("low")
            }
            .placeholder("Select priority")
        }
        
        Input("Assignee") {
            UsersSelect("assignee")
                .placeholder("Assign to team member")
        }
        .optional(true)
        
        Divider()
        
        Context {
            Text("_All fields except assignee are required_")
        }
    }
}

// Usage
let modal = TaskCreationModal(projectId: "proj_123")
try await slack.client.viewsOpen(
    body: .json(.init(
        triggerId: triggerId,
        view: modal.render()
    ))
)
```

### Home Tab Views

```swift
struct TeamDashboard: SlackHomeTabView {
    let teamId: String
    let userName: String
    
    var blocks: [Block] {
        Header {
            Text("Welcome back, \(userName)! 👋")
        }
        
        Section {
            Text("*Team Overview*")
        }
        
        Context {
            Text("Team: \(teamId) | Last updated: <!date^1234567890^{date_short}|fallback>")
        }
        
        Actions {
            Button("View All Tasks")
                .actionId("view_tasks")
                .style(.primary)
            
            Button("Create Task")
                .actionId("create_task")
        }
        
        Divider()
        
        Section {
            Text("*Recent Activity*")
        }
        
        // Dynamic content based on team data
        // ... additional blocks
    }
}
```

## Result Builders

The DSL uses Swift's result builders to enable declarative syntax:

### BlockBuilder

Constructs arrays of blocks for views and containers:

```swift
// Automatic array building
Modal("Settings") {
    Header { Text("Configuration") }  // Single block
    
    // Conditional blocks
    if showAdvanced {
        Section { Text("Advanced Options") }
    }
    
    // Loops
    for option in options {
        Section { Text(option.title) }
    }
    
    Divider()  // Another single block
}
```

### ActionElementBuilder

Builds action element arrays:

```swift
Actions {
    Button("Save").actionId("save")
    Button("Cancel").actionId("cancel")
    
    if needsConfirmation {
        Button("Delete")
            .actionId("delete")
            .style(.danger)
    }
}
```

### OptionBuilder

Constructs option arrays for select menus:

```swift
StaticSelect("category") {
    Option("Frontend").value("fe")
    Option("Backend").value("be")
    Option("DevOps").value("devops")
    
    if includeManagement {
        Option("Management").value("mgmt")
    }
}
```

## Advanced Patterns

### Conditional Content

```swift
Modal("User Profile") {
    Header { Text("Profile Settings") }
    
    // Always show basic fields
    Input("Display Name") {
        PlainTextInput("display_name")
    }
    
    // Conditional admin fields
    if user.isAdmin {
        Divider()
        
        Header { Text("Admin Settings") }
        
        Input("Role") {
            StaticSelect("role") {
                Option("Admin").value("admin")
                Option("Moderator").value("mod")
            }
        }
    }
    
    // Optional sections
    if !user.notifications.isEmpty {
        Section {
            Text("*Notification Preferences*")
        }
        
        for notification in user.notifications {
            Section {
                Text(notification.description)
            }
            .accessory(
                Button(notification.enabled ? "Enabled" : "Disabled")
                    .actionId("toggle_\(notification.id)")
                    .style(notification.enabled ? .primary : nil)
            )
        }
    }
}
```

### Dynamic Content Generation

```swift
struct TaskListView: SlackView {
    let tasks: [Task]
    
    var blocks: [Block] {
        Header { Text("Task List") }
        
        if tasks.isEmpty {
            Section {
                Text("_No tasks found. Create your first task!_")
            }
            
            Actions {
                Button("Create Task")
                    .actionId("create_first_task")
                    .style(.primary)
            }
        } else {
            for task in tasks {
                Section {
                    Text("*\(task.title)*")
                    Text(task.description)
                }
                .accessory(
                    Button(task.completed ? "✅" : "⏳")
                        .actionId("toggle_task_\(task.id)")
                        .style(task.completed ? nil : .primary)
                )
            }
        }
        
        Divider()
        
        Context {
            Text("Showing \(tasks.count) tasks")
        }
    }
}
```

## Integration with Socket Mode

Use DSL components seamlessly with Socket Mode routing:

```swift
router.onSlashCommand("/create-task") { context, payload in
    let modal = TaskCreationModal(projectId: payload.channelId)
    
    try await slack.client.viewsOpen(
        body: .json(.init(
            triggerId: payload.triggerId,
            view: modal.render()
        ))
    )
    
    try await context.ack()
}

router.onViewSubmission("create_task") { context, payload in
    // Extract form values
    let title = payload.view.state?["task_title_block", "task_title"]?.value ?? ""
    let priority = payload.view.state?["priority_block", "priority"]?.selectedOption?.value ?? "medium"
    
    // Create response view
    let successView = Modal("Task Created") {
        Header { Text("Success! ✅") }
        
        Section {
            Text("Your task '*\(title)*' has been created with \(priority) priority.")
        }
        
        Actions {
            Button("View Task")
                .actionId("view_new_task")
                .style(.primary)
            
            Button("Create Another")
                .actionId("create_another_task")
        }
    }
    .close(Text("Done"))
    
    try await context.ack(responseAction: .update, view: successView.asView())
}
```
