# swift-slack-client

swift-slack-client is _unofficial_ library that aims to provide Swift equivalent of the official Slack bolt framework and SDK of Python, TypeScript, Java, etc.
Enjoy coding in the language you like.

**WebAPI client works but is not tested for all the methods. Please give us feedback. It's in experimental phase and the library's API may change from time to time.**

## Is this a good library and well-maintained?

swift-slack-client has following benefits to offer.

* **Type-safe Slack Web API/Block Kit support** to build a rich Slack app
* **SocketMode support is built-in** and no ngrok is required to develop Slack app
* **OpenAPI spec generated automatically** makes it easy to catch up official Web API changes
* **Designed for modern Swift on Server stack** - structured concurrency, swift-openapi-generator, Swift Package traits, etc...

## Get started

### Installation

Add this to your `Package.swift`. Since this package uses swift-openapi-generator ecosystem,
you have to install and use one of transport layer packages additionally.

```swift
    dependencies: [
        .package(url: "https://github.com/ainame/swift-slack-client.git", from: "0.0.1"),
        // Your choice of transport layer from https://github.com/apple/swift-openapi-generator?tab=readme-ov-file#package-ecosystem
        // AsyncHTTPClient is preferable but URLSession would just work for simple cases
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.1.0"),
        // or .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.1.0"),
    ]
```

swift-slack-client supports Swift Package traits so that you can opt-in/out features and Web API.
By default all traits are enabled, which assumes you're going to try out Slack app with Socket Mode and it may take longer time to compile.

Especially, if you want just a WebAPI client with URLSession to write some scripts, opting-out "SocketMode" is worth it.
It will reduce build time siginiicantly. "SocketMode" relies on ![hummingbird-project/swift-websocket](https://github.com/hummingbird-project/swift-websocket) and SwiftNIO.
Those won't be compiled if traits are minimised.

```swift
    dependencies: [
        .package(
            url: "https://github.com/ainame/swift-slack-client.git",
            from: "0.0.1",
            traits: [
                "SocketMode",   // To use socket mode. If this is specified, swift-websocket package will be installed
                "Events",       // To subscribe decode event payloads via Events API (not RTM)
                "WebAPI_Chat",  // Each WebAPI is in a group and enabled/disabled by trait; chat.postMessage -> WebAPI_Chat
                "WebAPI_Views", // Unless you enable corresponding trait, API won't be available.
            ]
        )
    ]
```

### Web API client

For example, you can start a script to post a message to a Slack channel like below.

1. Install swift-slack-client and a transport library via Swift Package Manager and enable `WebAPI_Chat`
2. Initialize Slack instance with transport and token (you have to create one on Slack's console)
3. `slack.client` is the API client instance that only exposes a set of APIs enabled by traits

```swift
import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient

let slack = Slack(
    transport: URLSessionTransport(),
    configuration: .init(token: token),
)

// WebAPI_Chat trait must be enabled.
let response = try await slack.client.chatPostMessage(
    body: .json(
        .init(channel: channel, text: message),
    ),
)

// This is true if the request is succeeded
print(try response.ok.body.json.ok)
```

You can use SlackBlockKitDSL/SlackBlockKit to compose a rich message.

```swift
import Foundation
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackBlockKit
import SlackBlockKitDSL

let slack = Slack(
    transport: URLSessionTransport(),
    configuration: .init(token: token),
)

// DSL
let block = Section {
    Text("A message *with some bold text* and _some italicized text_.")
        .style(.mrkdwn)
}

let result = try await slack.client.chatPostMessage(
    body: .json(
        .init(channel: channel, blocks: [block.render()])
    ),
)
try debugPrint(result.ok.body.json)

// This is true if the request is succeeded
print(try response.ok.body.json.ok)
```

### Socket Mode

For Socket Mode's use, you can use `SocketModeMessageRouter` to register callbacks and
route events, slash commands, global shortcuts, message shortctus, and so on.

<details>

```swift
// You need app level token (`appToken`) to open a connection
let slack = Slack(
    transport: AsyncHTTPClientTransport(),
    configuration: .init(
        appToken: appToken,
        token: token,
    ),
)

// Create a router
let router = SocketModeMessageRouter()

// onSocketModeMessage provides routing to messages for all the events.
//
// context - provides access to API client, logger and some helpers
// envelope - (wrapper structure of payloads)
router.onSocketModeMessage { context, envelope in
    print("onMessage")
}

// Granular event routing
router.onEvent { context, envelope in
    switch envelope.event {
    case .appMention:
        print("onEvent: appMention")
    case .message:
        print("onEvent: meessage")
    default:
        break
    }
}

// A bit fine grained
router.onEvent(AppMentionEvent.self) { _, _, _ in
    print("onEvent: AppMentionEvent")
}

// All the interactive payloads
router.onInteractive { context, envelope in
    switch envelope.body {
    case .shortcut:
        print("onInteractive: .shortcut")
    case .messageAction:
        print("onInteractive: .messageAction")
    case .slashCommands:
        print("onInteractive: .slashCommands")
    case .blockActions:
        print("onInteractive: .blockActions")
    case .viewSubmission:
        print("onInteractive: .viewSubmission")
    case .viewClosed:
        print("onInteractive: .viewClosed")
    case .unsupported:
        print("onInteractive: .unsupported")
    }
}

// Can focus on specific callback id
router.onGlboalShortcut("run-something") { context, payload in
    print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
}

router.onBlockAction("run-something") { context, payload in
    print("onGlobalShortcut: \(payload._type) \(payload.callbackId!)")
}

// Echo app with slash command
router.slashCommands("/echo") { context, envelope, event in
    context.respond(to: context.responseUrl, text: event.text, responseType: .inChannel)
}

// A simple text match routing on message event
// You can give Regex patterns in String
router.onSlackMessageMatched(with: "Hello", "World") { context, envelope, payload in
    print("onSlackMessageMatched: \(payload.text!)")
}

await slack.addSocketModeMessageRouter(router)

try await slack.runInSocketMode()
```

</details>

More examples are available in ![Examples](https://github.com/ainame/swift-slack-client/tree/main/Examples).

## Under the hood

We relies on these two _reliable_ sources to generate OpenAPI schema.

* For WebAPI request and params https://github.com/slack-ruby/slack-api-ref
* For WebAPI response and event's schemas https://github.com/slackapi/java-slack-sdk

slackapi/java-slack-sdk is the official Java SDK. slack-ruby/slack-api-ref is created for community library
![slack-ruby/slack-ruby-client](https://github.com/slack-ruby/slack-ruby-client). It's built on top of ![the former official API schemas repos](https://github.com/slackhq/slack-api-docs) (which is already archived) and has their own automatation to pull the latest specs from the official document.

We generate JSON schemas for each endpoints, response and events using ![quicktype](https://github.com/glideapps/quicktype) and then combine all together to use swift-openapi-generator. This apparoch was inspired by another official TypeScript SDK ![slack-edge/slack-web-api-client](https://github.com/slack-edge/slack-web-api-client).

slackapi/java-slack-sdk has tons of sample JSON for each response and events which quicktype can generate good schema. Though it is good and usable, it doesn't guarantee optionality of each parameters/fields in schemas. That's why you see many properties in generated code being optional.

## Contribution

Feedback and PRs are welcome.

### Requirements

* Swift 6.1+
* SwiftFormat (install outside Swift Package Manager)
* Node.js & quicktype (for schema generation)

### Setup

```bash
# Clone with submodules
git clone --recursive https://github.com/ainame/swift-slack-client.git

# Update source repositiories
make update

# Generate code
make generate
```

## Notes

This is unofficial and community based project.
It isn't affiliated with the company makes Slack.
