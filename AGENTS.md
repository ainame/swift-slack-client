# AGENTS.md

Shared guidance for coding agents working in this repository.

## Repository Conventions

- Make git commits yourself for each meaningful change.
- Git tags for each version should be without a `v` prefix (for example `0.0.4`).
- Do not use `swift-actions/setup-swift@v2` in GitHub Actions.
- Run `swift build` or `swift test` to verify your changes when needed.
- Do not push directly to `main`; use branches and PRs.

## Project Overview

This project is a Swift Slack client library generated from Slack OpenAPI specs using `swift-openapi-generator`, with type-safe Web API and Socket Mode support.

## Main Modules

- `SlackClient`: Actor-based client for Web API, Events, and Socket Mode.
- `SlackModels`: Shared model module (User, Channel, Message, and others).
- `SlackBlockKit`: Block Kit framework implementation.
- `SlackBlockKitDSL`: Declarative DSL for building Block Kit payloads.

## Code Generation Workflow

### Commands

```bash
make update    # Update git submodules (.dependencies/*)
make generate  # Run full code generation
make clean     # Clean temp files
```

### Pipeline

1. Ruby scripts transform Slack API specs into OpenAPI JSON.
2. `swift-openapi-generator` produces Swift client/types.
3. `scripts/process_webapi.rb` splits generated code and extracts models.
4. `scripts/process_events.rb` extracts event types and conformance.
5. SwiftFormat applies formatting (4-space indentation).

### Key Scripts

- `scripts/generate_webapi.rb`
- `scripts/generate_events.rb`
- `scripts/process_webapi.rb`
- `scripts/process_events.rb`

## Package Traits and Flags

### Traits

```swift
.package(url: "...", traits: [
    "SocketMode",
    "Events",
    "WebAPI_Chat",
    "WebAPI_Views",
])
```

### Conditional Compilation

- `#if WebAPI_*`: API method availability
- `#if SocketMode`: WebSocket/real-time features
- `#if Events`: Event handling

## DSL and Events Notes

- `TextObject` supports string literals.
- Section DSL maps a single text child to `text`, multiple to `fields`.
- Keep `_type` naming as-is for event compatibility.
- Message events depend on `subtype` differentiation.

## Serialization and Naming Rules

- Keep explicit `CodingKeys` for snake_case and camelCase mapping.
- Do not rely on key encoding/decoding strategies as a substitute.
- Keep `SlackView` using `blocks` (not `body`).

## Testing Guidance

- Use `swift-testing` (not XCTest).
- Group tests in suite structs per file.
- Helpful filtered build output command:

```bash
swift build 2>&1 | awk '/error:|warning:|fatal error:/{flag=1} flag && /^$/{flag=0} flag'
```

## Useful Commands

```bash
# Development
make update
make generate
swift build
swift test
make format

# Examples
swift run chatPostMessage
swift run echoSlashCommand

# Release
ruby scripts/release.rb [version] [--yes]
```
