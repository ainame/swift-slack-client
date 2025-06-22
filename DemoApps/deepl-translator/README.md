# DeepL Translator for Slack

A Swift implementation of DeepL for Slack that enables users to translate messages using reaction emojis or a global shortcut.

## Features

- **Reaction Translation**: Add a flag emoji to any message to get it translated
- **Global Shortcut**: Use `/deepl` or click the shortcut button to open a translation modal
- **Thread Responses**: Translations are posted in message threads to keep channels organized
- **Multiple Languages**: Supports 27+ languages with DeepL's translation API

## Prerequisites

- DeepL API account (Free or Pro)
- Slack workspace with app installation permissions
- Swift 6.0 or later

## Setup

### 1. Create DeepL Account

1. Sign up at [DeepL Pro](https://www.deepl.com/pro/) (select "for Developers" plan)
2. Go to your [Account page](https://www.deepl.com/pro-account.html)
3. Copy your **Authentication Key for DeepL API**

### 2. Create Slack App

1. Go to [api.slack.com/apps](https://api.slack.com/apps) and create a new app
2. Choose "From an app manifest" 
3. Use this manifest:

```yaml
display_information:
  name: DeepL Translation App
  description: Translate messages with DeepL
  background_color: "#4e6fcf"
features:
  app_home:
    home_tab_enabled: false
    messages_tab_enabled: false
  bot_user:
    display_name: deepl-translator
    always_online: true
  shortcuts:
    - name: Open DeepL Tool
      type: global
      callback_id: deepl-translation
      description: Translate text using DeepL
oauth_config:
  scopes:
    bot:
      - channels:history
      - chat:write
      - groups:history
      - reactions:read
settings:
  event_subscriptions:
    bot_events:
      - reaction_added
  interactivity:
    is_enabled: true
  org_deploy_enabled: false
  socket_mode_enabled: true
```

4. Install the app to your workspace
5. Go to **Basic Information** and create an App-Level Token with `connections:write` scope
6. Copy the **Bot User OAuth Token** (xoxb-...) and **App-Level Token** (xapp-...)

### 3. Configure Environment

Set these environment variables:

```bash
export SLACK_BOT_TOKEN="xoxb-..."
export SLACK_APP_TOKEN="xapp-..."
export DEEPL_API_KEY="your-deepl-key"
export DEEPL_FREE_API_PLAN="1"  # Set to "1" for free plan, omit for pro plan
export DEEPL_RUNNER_LANGUAGES="en,ja,de,fr,es"  # Optional: customize language order
```

### 4. Build and Run

```bash
cd DemoApps/deepl-translator
swift build
swift run deepl-translator
```

## Usage

### Reaction Translation

1. Invite the bot to a channel: `/invite @deepl-translator`
2. Add a flag emoji reaction to any message (e.g., 🇯🇵 for Japanese)
3. The bot will post the translation in a thread

### Global Shortcut

1. Click the ⚡ (Lightning) button in Slack
2. Select "Open DeepL Tool"
3. Enter text and select target language
4. Click "Translate"

## Supported Languages

The bot supports all DeepL languages with their corresponding flag emojis:

- 🇺🇸 English (en)
- 🇯🇵 Japanese (ja)
- 🇨🇳 Chinese (zh)
- 🇰🇷 Korean (ko)
- 🇩🇪 German (de)
- 🇫🇷 French (fr)
- 🇮🇹 Italian (it)
- 🇪🇸 Spanish (es)
- 🇳🇱 Dutch (nl)
- 🇵🇱 Polish (pl)
- 🇵🇹 Portuguese (pt)
- 🇷🇺 Russian (ru)
- And many more...

## Development

The app is structured as follows:

- `DeepLClient.swift` - DeepL API integration with Slack markup handling
- `Languages.swift` - Language and emoji mappings
- `TranslationModal.swift` - Modal UI components using SlackBlockKitDSL
- `ReactionHandler.swift` - Reaction event processing
- `main.swift` - Socket Mode router and app entry point

## License

MIT