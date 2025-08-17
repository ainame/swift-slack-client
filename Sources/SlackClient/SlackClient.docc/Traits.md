# Traits

Understanding SlackClient's modular trait system.

## Overview

SlackClient uses Swift Package Manager traits to provide a modular architecture. This allows you to include only the API components your application needs, reducing compile times and binary size.

## Available Traits

### Web API Traits

Each Slack Web API group is available as a separate trait:

- `WebAPI_Admin` - Admin API methods
- `WebAPI_Apps` - Apps API methods
- `WebAPI_Auth` - Authentication API methods
- `WebAPI_Bookmarks` - Bookmarks API methods
- `WebAPI_Bots` - Bots API methods
- `WebAPI_Chat` - Chat/messaging API methods
- `WebAPI_Conversations` - Conversations API methods
- `WebAPI_DND` - Do Not Disturb API methods
- `WebAPI_Emoji` - Custom emoji API methods
- `WebAPI_Files` - File upload/management API methods
- `WebAPI_Pins` - Message pinning API methods
- `WebAPI_Reactions` - Message reactions API methods
- `WebAPI_Reminders` - Reminders API methods
- `WebAPI_Search` - Search API methods
- `WebAPI_Stars` - Starred items API methods
- `WebAPI_Team` - Team/workspace API methods
- `WebAPI_Users` - User management API methods
- `WebAPI_Views` - Views/modals API methods

### Feature Traits

- `SocketMode` - Real-time WebSocket connections
- `Events` - Event handling and routing

## Usage Examples

### Basic Bot

For a simple messaging API client:

```swift
.package(url: "https://github.com/ainame/swift-slack-client", from: "0.1.0", traits: [
    "WebAPI_Chat",
])
```

### Interactive App

To build an interactive app using events or shortcuts, it's best to use SocketMode trait.

```swift
.package(url: "https://github.com/ainame/swift-slack-client", from: "0.1.0", traits: [
    "WebAPI_Chat",
    "WebAPI_Views",
    "SocketMode",
    "Events"
])
```

See details <doc:SocketMode>
