# Migrating to `SlackApp` and `SlackKit`

`swift-slack-kit` now splits the runtime layer out of `SlackClient`.

## What changed

- `SlackClient` is now the pure Web API and shared model layer.
- `SlackApp` is the runtime layer for:
  - `SlackApp`
  - `Router`
  - `Ack`
  - Socket Mode
  - HTTP request verification and adapters

## Update your target dependencies

If you build a Slack app runtime, depend on `SlackKit` for the normal app-authoring path:

```swift
.target(
    name: "MySlackApp",
    dependencies: [
        .product(name: "SlackKit", package: "swift-slack-kit"),
    ]
)
```

## Update imports

Old:

```swift
import SlackClient
```

New:

```swift
import SlackKit
```

## Update Socket Mode startup

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

## Update renamed and moved symbols

- `SocketModeRouter` -> `Router`
- `Slack.runInSocketMode(...)` -> `SlackApp(..., mode: .socketMode(...)).run()`
- `Slack.addSocketModeRouter(...)` -> remove it; pass the router into `SlackApp`
- Hummingbird HTTP support now comes from `HummingbirdAdapter`

## HTTP apps

HTTP request handling now lives entirely in `SlackApp`:

```swift
let router = Router()
let adapter = HummingbirdAdapter(hostname: "0.0.0.0", port: 8080)
let app = SlackApp(
    configuration: .init(token: token, signingSecret: signingSecret),
    router: router,
    mode: .http(adapter)
)
try await app.run()
```

`SlackApp` now owns the default async HTTP transport. `SlackClient` remains the lower-level option when you want to provide your own transport directly, and `SlackKit` is the recommended umbrella import for normal app code.


## Ack semantics

`SlackApp` now follows Bolt-style event acknowledgement behavior:

- `onEvent(...)` handlers are auto-acked and do not receive `ack`
- slash commands, block actions, shortcuts, and view handlers still require explicit `ack()`
- in HTTP mode, Events API requests return `200 OK` automatically
- in Socket Mode, Events API envelopes are acknowledged before dispatch
- router registrations are overwrite-based, so the same API/key uses the last registered handler
- `onSlackMessageMatched(...)` was removed; use `onEvent(MessageEvent.self)` and filter inside the handler


## ServiceLifecycle integration

`SlackApp` now conforms to `Service` from `swift-service-lifecycle`, so you can run it directly inside a `ServiceGroup`.
