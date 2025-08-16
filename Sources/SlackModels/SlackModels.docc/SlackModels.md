# ``SlackModels``

Shared data models and types for the Slack API ecosystem.

## Overview

SlackModels provides a comprehensive collection of Swift types representing Slack's data models. These types are shared across all swift-slack-client modules, ensuring consistency and type safety when working with Slack API data.

All models are automatically generated from Slack's official API specifications, with additional handcrafted models for complex scenarios and enhanced usability.

## Key Features

- **Complete API Coverage**: 141+ model types covering all Slack API entities
- **Type Safety**: Strong Swift types prevent runtime errors
- **Auto-Generated**: Models stay current with Slack API changes
- **Codable Support**: Full JSON encoding/decoding with proper snake_case handling
- **Shared Foundation**: Used by SlackClient, SlackBlockKit, and SlackBlockKitDSL

## Architecture

SlackModels is organized into several categories:

### Core Entities
- **Users**: User profiles, presence, and authentication data
- **Teams**: Workspace and enterprise information
- **Channels**: Conversations, groups, and direct messages
- **Messages**: Message content, metadata, and threading
- **Files**: File objects, sharing, and permissions

### Application Framework
- **Events**: Real-time event payloads from the Events API
- **Interactions**: Payloads from interactive components
- **Block Kit**: UI component data structures
- **Workflows**: Workflow steps, triggers, and configurations

### API Infrastructure
- **Responses**: Standard API response wrappers
- **Pagination**: Cursor-based pagination metadata
- **Errors**: Error response structures
- **Authentication**: OAuth and token-related models

## Quick Start

```swift
import SlackModels

// Working with user data
let user = User(
    id: "U123456",
    name: "alice",
    realName: "Alice Johnson",
    profile: UserProfile(
        displayName: "Alice",
        email: "alice@company.com"
    )
)

// Message with reactions
let message = Message(
    type: "message",
    text: "Hello team!",
    user: "U123456",
    ts: "1234567890.123456",
    reactions: [
        Reaction(
            name: "thumbsup",
            count: 3,
            users: ["U123456", "U789012", "U345678"]
        )
    ]
)

// Channel information
let channel = Channel(
    id: "C123456",
    name: "general",
    isChannel: true,
    created: 1234567890,
    creator: "U123456",
    isArchived: false,
    isGeneral: true,
    members: ["U123456", "U789012"],
    topic: Purpose(
        value: "General discussion",
        creator: "U123456",
        lastSet: 1234567890
    )
)
```

## Topics

### User and Team Models

- ``User``
- ``UserProfile``
- ``Team``
- ``Enterprise``
- ``Bot``
- ``BotProfile``

### Channel and Conversation Models

- ``Channel``
- ``Conversation``
- ``Purpose``
- ``Created``
- ``Member``

### Message and Content Models

- ``Message``
- ``MessageRoot``
- ``MessageEventMetadata``
- ``Attachment``
- ``File``
- ``Reaction``
- ``PinnedInfo``

### Event Models

Events API payloads for real-time updates:

- ``AppMentionEvent``
- ``MessageEvent``
- ``ChannelCreatedEvent``
- ``UserChangeEvent``
- ``ReactionAddedEvent``
- ``FileSharedEvent``

### Interaction Models

Payloads from interactive components:

- ``BlockActionsPaylaod``
- ``ViewSubmissionPayload``
- ``ViewClosedPayload``
- ``GlobalShortcutPayload``
- ``MessageShortcutPayload``
- ``SlacshCommandsPayload``

### Block Kit Models

UI component structures:

- ``Block``
- ``TextObject``
- ``OptionObject``
- ``ConfirmationDialogObject``
- ``View``
- ``ModalView``
- ``HomeTabView``

### Workflow Models

Workflow automation structures:

- ``WorkflowStep``
- ``WorkflowStepInput``
- ``WorkflowStepOutput``
- ``WorkflowConfiguration``
- ``TriggerObject``

### API Response Models

- ``ResponseMetadata``
- ``Paging``
- ``Pagination``
- ``_Error``

### Authentication Models

- ``AuthedUser``
- ``Team``
- ``OauthConfig``
- ``Tokens``

## Code Generation

Most models in SlackModels are automatically generated from Slack's API specifications:

### Generation Sources

1. **slack-ruby/slack-api-ref**: Request parameters and basic structures
2. **slackapi/java-slack-sdk**: Response schemas and event payloads
3. **quicktype**: JSON schema generation and Swift type creation

### Handcrafted Models

Some models are handcrafted for enhanced usability:

- ``UserProfile`` - Extended user profile information
- ``MessageEventMetadata`` - Message event context
- ``WorkflowStep`` - Workflow automation components
- ``Recording`` - Meeting and call recordings
- ``Room`` - Physical meeting room data

### CodingKeys Convention

All models use explicit CodingKeys for snake_case ↔ camelCase conversion:

```swift
public struct User: Codable {
    public var id: String?
    public var name: String?
    public var realName: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case realName = "real_name"
    }
}
```

This ensures compatibility with swift-openapi-generator which cannot use keyEncoding/DecodingStrategy.

## Integration Examples

### With SlackClient

```swift
import SlackClient
import SlackModels

let slack = Slack(transport: transport, configuration: config)

// Post a message and get the response
let response = try await slack.client.chatPostMessage(
    body: .json(.init(
        channel: "#general",
        text: "Hello from Swift!"
    ))
)

// Access typed response data
if let message = try? response.ok.body.json.message {
    print("Message posted at: \(message.ts)")
    print("Posted by: \(message.user)")
}
```

### With Events API

```swift
import SlackModels

// Handle incoming events
func handleEvent(_ event: Event) {
    switch event {
    case .appMention(let mention):
        print("App mentioned in channel: \(mention.channel)")
        print("Message: \(mention.text)")
        
    case .message(let message):
        print("New message from: \(message.user)")
        
    case .reactionAdded(let reaction):
        print("Reaction '\(reaction.reaction)' added to message")
        
    default:
        print("Unhandled event type")
    }
}
```

### With Block Kit

```swift
import SlackBlockKit
import SlackModels

// Create a message with user mention
let user = User(id: "U123456", name: "alice")

let message = SectionBlock(
    text: TextObject(
        type: .mrkdwn,
        text: "Welcome <@\(user.id!)>! 👋"
    )
)
```

## Best Practices

### Working with Optional Properties

Many properties are optional due to API variability:

```swift
// Safe property access
if let userName = user.name,
   let userEmail = user.profile?.email {
    print("\(userName): \(userEmail)")
}

// Using nil coalescing
let displayName = user.profile?.displayName ?? user.name ?? "Unknown User"
```

### Handling Timestamps

Slack uses string timestamps in floating-point format:

```swift
// Convert Slack timestamp to Date
if let ts = message.ts {
    let timestamp = Double(ts) ?? 0
    let date = Date(timeIntervalSince1970: timestamp)
    print("Message posted at: \(date)")
}
```

### Working with Channels

```swift
// Distinguish channel types
switch channel.isChannel {
case true:
    print("Public channel: \(channel.name ?? "unknown")")
case false:
    if channel.isIm == true {
        print("Direct message")
    } else if channel.isGroup == true {
        print("Private channel")
    }
case nil:
    print("Unknown channel type")
}
```

### Event Type Matching

```swift
// Comprehensive event handling
func processSlackEvent(_ event: Event) {
    switch event {
    case .message(let msg):
        handleMessage(msg)
    case .appMention(let mention):
        handleAppMention(mention)
    case .channelCreated(let channel):
        handleNewChannel(channel)
    case .userChange(let user):
        handleUserUpdate(user)
    case .unsupported(let type):
        logger.warning("Unsupported event type: \(type)")
    }
}
```

## Data Validation

While models provide type safety, always validate critical data:

```swift
// Validate required fields
func validateUser(_ user: User) -> Bool {
    guard let id = user.id, !id.isEmpty,
          let name = user.name, !name.isEmpty else {
        return false
    }
    return true
}

// Validate message content
func validateMessage(_ message: Message) -> Bool {
    guard let text = message.text, !text.trimmingCharacters(in: .whitespaces).isEmpty,
          let user = message.user, !user.isEmpty,
          let ts = message.ts, !ts.isEmpty else {
        return false
    }
    return true
}
```

## See Also

- ``SlackClient`` for API interactions using these models
- ``SlackBlockKit`` for UI component models
- [Slack API Documentation](https://api.slack.com/types) for official type specifications
- [Code Generation Scripts](https://github.com/ainame/swift-slack-client/tree/main/scripts) for understanding model creation