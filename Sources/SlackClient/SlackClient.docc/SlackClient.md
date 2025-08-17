# ``SlackClient``

A Swift library for interacting with the Slack API, providing type-safe WebAPI and Socket Mode functionality.

## Overview

SlackClient is a comprehensive Swift library to interact with Slack APIs.
You can use SlackClient as just API client or simple app framework with SocketMode
similar with Bolt framework that are available for officially supported language such as
 [bolt-js](https://github.com/slackapi/bolt-js) or
[bolt-python](https://github.com/slackapi/bolt-python).

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

SlackClient is built with server on Swift in mind. You can build your Slack app with strctured conrrency throughout
and benefit [swift-service-lifecycle](https://github.com/swift-server/swift-service-lifecycle) when deploying a Socket Mode Slack App.

You can also choose underlying networking layer; i.e.
[swift-openapi-async-http-client](https://github.com/swift-server/swift-openapi-async-http-client),
thanks to swift-openapi-generator ecosystem.
