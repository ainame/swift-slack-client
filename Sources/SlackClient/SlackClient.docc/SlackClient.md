# ``SlackClient``

A Swift library for interacting with the Slack Web API with type-safe generated models and operations.

## Overview

`SlackClient` is the pure client layer in the `swift-slack-client` package. Use it when you want:

- generated Web API operations
- shared Slack payload and event models
- Block Kit model support via companion modules

If you want a higher-level runtime for Socket Mode or HTTP request handling, import the `SlackApp` product alongside `SlackClient`.

### Up-to-date client code

You can benefit SlackClient being always up-to-date to the Slack API specs.
This project relies on the official Java SDK
 [java-slack-sdk](https://github.com/slackapi/java-slack-sdk)
and community project
 [slack-api-ref](https://github.com/slack-ruby/slack-ruby-client)
to compose own OpenAPI spec and generate client and model code by
 [swift-openapi-generator](https://github.com/apple/swift-openapi-generator).
When those source repositories get updates, this project will also recieve update from GitHub Actions.

### Built for Server on Swift

SlackClient is built with server-side Swift in mind and works with structured concurrency throughout.

You can also choose underlying networking layer; i.e.
[swift-openapi-async-http-client](https://github.com/swift-server/swift-openapi-async-http-client),
thanks to swift-openapi-generator ecosystem.
