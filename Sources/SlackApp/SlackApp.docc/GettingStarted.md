# Getting Started

Use `SlackApp` when you want a Slack app runtime on top of `SlackClient`.

## Installation

Add the package and enable the traits your runtime needs:

```swift
.package(
    url: "https://github.com/ainame/swift-slack-client",
    from: "0.1.0",
    traits: [
        "WebAPI_Apps",
        "WebAPI_Chat",
        "WebAPI_Views",
        "SocketMode",
        "Events"
    ]
)
```

Then depend on `SlackApp` from your target:

```swift
.target(
    name: "MySlackApp",
    dependencies: [
        .product(name: "SlackApp", package: "swift-slack-client"),
    ]
)
```

## Socket Mode

```swift
import SlackApp

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

## HTTP App

```swift
import SlackApp

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
