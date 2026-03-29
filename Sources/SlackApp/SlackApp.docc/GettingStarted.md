# Getting Started

Use `SlackKit` for normal app code when you want a Slack app runtime on top of `SlackClient`. Use `SlackApp` directly when you only want the runtime layer itself.

## Installation

Add the package and enable the traits your runtime needs:

```swift
.package(
    url: "https://github.com/ainame/swift-slack-kit",
    from: "0.5.1",
    traits: [
        "WebAPI_Apps",
        "WebAPI_Chat",
        "WebAPI_Views",
        "SocketMode",
        "Events",
        "HummingbirdHTTPAdapter"
    ]
)
```

Then depend on `SlackKit` from your target:

```swift
.target(
    name: "MySlackApp",
    dependencies: [
        .product(name: "SlackKit", package: "swift-slack-kit"),
        .product(name: "ServiceLifecycle", package: "swift-service-lifecycle"),
    ]
)
```

## Socket Mode

```swift
import SlackKit

let router = Router()

router.onSlashCommand("/hello") { context, payload in
    try await context.ack()
    try await context.say(channel: payload.channelId, text: "Hello, \(payload.userName)!")
}

let app = SlackApp(
    configuration: .init(
        appToken: appToken,
        token: token
    ),
    router: router,
    mode: .socketMode()
)
try await app.run()
```

If you need to perform setup work with the underlying client before the runtime starts, use the `preparing` hook:

```swift
try await app.run { slack in
    _ = try await slack.authTest()
}
```

## HTTP App

```swift
import SlackKit

let router = Router()
let adapter = HummingbirdAdapter(hostname: "0.0.0.0", port: 8080)
let app = SlackApp(
    configuration: .init(
        token: token,
        signingSecret: signingSecret
    ),
    router: router,
    mode: .http(adapter)
)

try await app.run()
```

## Ack semantics

- Events API handlers are auto-acked and receive `EventContext` without `ack`.
- Slash commands, block actions, shortcuts, and views receive `Context` and must call `ack()`.
- Router registrations are overwrite-based: the same API/key uses the last registered handler.
- `onSlackMessageMatched(...)` was removed; use `onEvent(MessageEvent.self)` and filter inside the handler.

## Running with ServiceLifecycle

`SlackApp` conforms to `Service`, so you can run it inside a `ServiceGroup`:

```swift
import Logging
import ServiceLifecycle
import SlackKit

let app = SlackApp(
    configuration: .init(
        appToken: appToken,
        token: token
    ),
    router: router,
    mode: .socketMode()
)

let group = ServiceGroup(
    services: [app],
    gracefulShutdownSignals: [.sigterm, .sigint],
    logger: Logger(label: "MySlackApp")
)

try await group.run()
```
