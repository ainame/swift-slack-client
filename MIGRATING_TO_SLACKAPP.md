# Migrating to `SlackApp`

`swift-slack-client` now splits the runtime layer out of `SlackClient`.

## What changed

- `SlackClient` is now the pure Web API and shared model layer.
- `SlackApp` is the runtime layer for:
  - `App`
  - `AppRouter`
  - `Ack`
  - Socket Mode
  - HTTP request verification and adapters

## Update your target dependencies

If you build a Slack app runtime, depend on `SlackApp`:

```swift
.target(
    name: "MySlackApp",
    dependencies: [
        .product(name: "SlackApp", package: "swift-slack-client"),
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
import SlackApp
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
let router = AppRouter()
let app = App(
    configuration: .init(appToken: appToken, token: token),
    router: router,
    mode: .socketMode()
)
try await app.run()
```

## Update renamed and moved symbols

- `SocketModeRouter` -> `AppRouter`
- `Slack.runInSocketMode(...)` -> `App(..., mode: .socketMode(...)).run()`
- `Slack.addSocketModeRouter(...)` -> remove it; pass the router into `App`
- Hummingbird HTTP support now comes from `SlackApp.HummingbirdAdapter`

## HTTP apps

HTTP request handling now lives entirely in `SlackApp`:

```swift
let router = AppRouter()
let adapter = HummingbirdAdapter(hostname: "0.0.0.0", port: 8080)
let app = App(
    configuration: .init(token: token, signingSecret: signingSecret),
    router: router,
    mode: .http(adapter)
)
try await app.run()
```

`SlackApp` now owns the default async HTTP transport. `SlackClient` remains the lower-level option when you want to provide your own transport directly.
