# ``SlackApp``

Build Slack app runtimes on top of ``SlackClient``.

## Overview

`SlackApp` is the runtime layer in the `swift-slack-client` package. It owns:

- `App`
- `AppRouter`
- `AppContext`
- `Ack`
- Socket Mode orchestration
- HTTP request verification and dispatch
- optional framework adapters such as `HummingbirdAdapter`

Use `SlackClient` for Web API access and shared Slack models, then add `SlackApp` when you need routing and transport handling.

## Topics

### Essentials

- <doc:GettingStarted>
- <doc:MigrationGuide>
