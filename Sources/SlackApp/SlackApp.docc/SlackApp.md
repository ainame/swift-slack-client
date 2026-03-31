# ``SlackApp``

Build Slack app runtimes on top of ``SlackClient``.

## Overview

`SlackApp` is the framework layer in the `swift-slack` package. It owns:

- `SlackApp`
- `Router`
- `SlackApp.Context`
- `Ack`
- Socket Mode orchestration
- HTTP request verification and dispatch
- `HTTPServerAdapter`, `HTTPServerRequest`, and `HTTPServerResponse` for custom HTTP server integrations
- optional framework adapters such as `HummingbirdAdapter`
- the default async HTTP transport for app-author workflows

In normal app code, prefer `import SlackKit`. Use `SlackApp` directly when you only want the runtime layer, or `SlackClient` when you want custom transport control or a lower-level client surface, such as Apple-platform apps using `URLSession`-based transports.

## Topics

### Essentials

- <doc:GettingStarted>
- <doc:MigrationGuide>
- <doc:Examples>
