# ``SlackKit``

Build Slack apps with the umbrella product in `swift-slack-kit`.

## Overview

`SlackKit` is the recommended import for normal app code. It re-exports:

- ``SlackApp`` for the app runtime
- ``SlackClient`` for Web API access
- `SlackBlockKit` for common Block Kit model types used by app workflows

Use `SlackKit` when you want the ergonomic app-authoring path with Socket Mode, HTTP request handling, acknowledgements, routing, and convenient access to the lower-level client surface when needed.

Use ``SlackApp`` directly when you only want the runtime layer. Use ``SlackClient`` directly when you want low-level transport control or a pure Web API client without the runtime.
