# ``SlackApp``

Build Slack app runtimes on top of ``SlackClient``.

## Overview

`SlackApp` is the framework layer in the `swift-slack-client` package. It owns:

- `App`
- `AppRouter`
- `AppContext`
- `Ack`
- Socket Mode orchestration
- HTTP request verification and dispatch
- optional framework adapters such as `HummingbirdAdapter`
- the default async HTTP transport for app-author workflows

In normal app code, `import SlackApp` is enough. Use `SlackClient` directly when you want custom transport control or a lower-level client surface, such as Apple-platform apps using `URLSession`-based transports.

## Topics

### Essentials

- <doc:GettingStarted>
- <doc:MigrationGuide>
