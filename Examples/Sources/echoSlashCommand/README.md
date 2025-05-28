# Echo Slash Command Example

This example demonstrates how to handle Slack slash commands using SlackClient with Socket Mode. The bot responds to `/echo` and `/echo-private` commands.

## Features

- **Public Echo (`/echo`)**: Echoes messages to the channel for everyone to see
- **Private Echo (`/echo-private`)**: Echoes messages privately (ephemeral)
- **Help Messages**: Shows usage instructions when no text is provided
- **Error Handling**: Graceful error handling with user feedback
- **Debug Logging**: Comprehensive logging for troubleshooting

## What's Different from Regular Echo Bot?

This example specifically demonstrates **slash commands** which are:
- Triggered by typing `/command` in Slack
- Delivered through Socket Mode as special events
- Can respond publicly (visible to all) or privately (ephemeral)
- Provide structured data including user info, channel info, and command text

## Setup

### 1. Create a Slack App

1. Go to [api.slack.com](https://api.slack.com/apps) and create a new app
2. Choose "From scratch" and name it "Echo Slash Command Bot"
3. Select your workspace

### 2. Configure OAuth Scopes

In **OAuth & Permissions**, add these Bot Token Scopes:
- `commands` - To receive slash commands
- `chat:write` - To send messages
- `chat:write.public` - To send messages to channels bot isn't in

### 3. Enable Socket Mode

1. Go to **Socket Mode**
2. Enable Socket Mode
3. Create an App-Level Token with `connections:write` scope
4. Save the token (starts with `xapp-`)

### 4. Create Slash Commands

1. Go to **Slash Commands** in your app settings
2. Click "Create New Command"
3. Add the `/echo` command:
   - Command: `/echo`
   - Request URL: (leave empty - we're using Socket Mode)
   - Short Description: "Echo your message to the channel"
   - Usage Hint: `[message to echo]`
4. Add the `/echo-private` command:
   - Command: `/echo-private`
   - Request URL: (leave empty)
   - Short Description: "Echo your message privately"
   - Usage Hint: `[private message]`

### 5. Install the App

1. Go to **Install App**
2. Install to your workspace
3. Copy the Bot User OAuth Token (starts with `xoxb-`)

## Running the Bot

### Set Environment Variables

```bash
export SLACK_OAUTH_TOKEN="xoxb-your-bot-token"
export SLACK_APP_LEVEL_TOKEN="xapp-your-app-level-token"
```

### Build and Run

```bash
# From the Examples directory
swift run echoSlashCommand
```

You should see:
```
🚀 Starting Echo Slash Command Server...
🔌 Connecting to Slack via Socket Mode...
💡 Ready to handle slash commands!
   • Public echo: /echo Hello, World!
   • Private echo: /echo-private Secret message
   • Get help: /echo (without text)
   Press Ctrl+C to stop the server
```

## Usage

### Public Echo Command

In any channel or DM:

```
/echo Hello, World!
```

The bot responds publicly:
```
🔊 @yourname says: Hello, World!
```

### Private Echo Command

```
/echo-private This is a secret
```

The bot responds privately (only you can see):
```
🤫 Your private echo: This is a secret
```

### Help Messages

Type the command without text:

```
/echo
```

You'll see a private help message:
```
👋 Hello @yourname! I'm an echo bot.

**Usage:** `/echo <message>`

I'll echo your message back to the channel for everyone to see!

**Examples:**
• `/echo Hello, World!`
• `/echo Testing 123`
```

## Code Structure

### Slash Command Handler

```swift
router.onSlashCommand("/echo") { context, payload in
    // payload contains all slash command data:
    // - command: The command name ("/echo")
    // - text: Text after the command
    // - userId, userName: Who sent it
    // - channelId, channelName: Where it was sent
    // - teamId, teamDomain: Workspace info
}
```

### Response Types

**Public Response** (visible to everyone):
```swift
let response = try await context.client.chatPostMessage(
    body: .json(.init(
        channel: payload.channelId ?? "",
        text: responseText
    ))
)
```

**Ephemeral Response** (only visible to command sender):
```swift
let response = try await context.client.chatPostEphemeral(
    body: .json(.init(
        channel: payload.channelId ?? "",
        text: responseText,
        user: payload.userId ?? ""
    ))
)
```

### Message Acknowledgment

Socket Mode requires acknowledging messages:
```swift
if let envelopeId = envelope.envelopeId {
    try await context.client.sendSocketModeAcknowledgement(
        envelopeId: envelopeId
    )
}
```

## Slash Command Payload

The `SlashCommandsPayload` includes:

- `command`: The command that was typed (e.g., "/echo")
- `text`: Everything after the command
- `responseUrl`: URL for delayed responses (not used in Socket Mode)
- `triggerId`: For opening modals
- `userId` / `userName`: User who sent the command
- `channelId` / `channelName`: Where it was sent
- `teamId` / `teamDomain`: Workspace information

## Advanced Features

### 1. Delayed Responses

For long-running operations, acknowledge immediately and respond later:

```swift
// Acknowledge first
try await context.client.sendSocketModeAcknowledgement(envelopeId: envelopeId)

// Do some work...
await performLongOperation()

// Then send the actual response
try await context.client.chatPostMessage(...)
```

### 2. Opening Modals

Use the `triggerId` to open modals:

```swift
router.onSlashCommand("/form") { context, payload in
    let modal = Modal(title: "Form") {
        // ... modal content
    }
    
    try await context.client.viewsOpen(
        body: .json(.init(
            view: modal.asView(),
            triggerId: payload.triggerId
        ))
    )
}
```

### 3. Command Options

Parse command text for options:

```swift
let parts = payload.text?.split(separator: " ") ?? []
if parts.first == "--private" {
    // Handle private option
}
```

## Troubleshooting

### Command Not Working

1. **Check Socket Mode is enabled** - Commands won't work without it
2. **Verify slash command is created** - Check Slack app settings
3. **Ensure bot has `commands` scope** - Required for slash commands
4. **Check command format** - Must start with `/`

### No Response

1. **Check acknowledgment** - Socket Mode requires acknowledging messages
2. **Verify channel permissions** - Bot needs permission to post
3. **Check error logs** - Look for API errors in console

### Debug Tips

The example includes debug logging:
```
🔍 Socket Mode message:
   Type: slash_commands
   Request ID: 1234-5678-9012
   Slash Command: /echo
   Text: 'Hello, World!'
```

## Best Practices

1. **Always acknowledge** - Socket Mode requires acknowledgment within 3 seconds
2. **Use ephemeral for errors** - Don't spam channels with error messages
3. **Provide help** - Show usage when command is used without parameters
4. **Handle errors gracefully** - Always try to inform the user
5. **Log for debugging** - Include request IDs for troubleshooting

## Extending This Example

- Add more slash commands with different behaviors
- Parse command options (e.g., `/echo --uppercase Hello`)
- Integrate with external services
- Add interactive elements (buttons, select menus)
- Store command history or user preferences
- Implement command aliases or shortcuts

See other examples for more advanced patterns!