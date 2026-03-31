# Migration Guide

Move existing runtime code from `SlackClient` to `SlackApp`.

## Import Changes

Old:

```swift
import SlackClient
```

New:

```swift
import SlackKit
```

## Runtime Entry Point

Old:

```swift
let router = SocketModeRouter()
await slack.addSocketModeRouter(router)
try await slack.runInSocketMode()
```

New:

```swift
let router = Router()
let app = SlackApp(
    configuration: .init(appToken: appToken, token: token),
    router: router,
    mode: .socketMode()
)
try await app.run()
```

## Symbol Moves

- `SocketModeRouter` -> `Router`
- `Slack.runInSocketMode(...)` -> `SlackApp(..., mode: .socketMode(...)).run()`
- `Slack.addSocketModeRouter(...)` -> pass the router directly to `SlackApp`
- Hummingbird HTTP integration moved under `HummingbirdAdapter`

## Client Layer

`SlackClient` is now the pure Web API layer. Runtime concerns such as Events API payload types, Socket Mode, HTTP request verification, routing, and acknowledgements live in `SlackApp`.
