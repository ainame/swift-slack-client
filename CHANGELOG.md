# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

* Added a shared app runtime with `SlackApp`, `Router`, transport-neutral `Ack`, `Slack.Configuration`, HTTP request handling, and optional Hummingbird integration.
* Added app runtime coverage for shared router dispatch and HTTP request handling.
* Added migration documentation at `MIGRATING_TO_SLACKAPP.md`.
* Added a new `SlackAppKit` umbrella product that re-exports `SlackApp`, `SlackClient`, and `SlackBlockKit` for normal app-authoring workflows.

### Changed

* **BREAKING**: Split the app runtime out of `SlackClient` into a new `SlackApp` product.
* Moved Socket Mode, HTTP request handling, routing, acknowledgements, and the existing Hummingbird integration into `SlackApp`.
* Updated examples, README, migration notes, and DocC guides to make `SlackAppKit` the primary app-authoring entry point while keeping `SlackApp` as the lower-level runtime module.
* Updated `DemoApps/deepl-translator` to use the current `SlackApp` runtime flow and removed obsolete package dependencies.
* Simplified `Examples/Sources/blockActionsMessageContainer` to use `SlackApp` setup via the `preparing` hook and typed Block Kit-based unfurl payload construction.

## [0.5.1] - 2026-03-23

### Added

* Added top-level third-party attribution notices for vendored generation inputs - #68

### Changed

* Renamed the vendored upstream submodule directory from `.dependencies/` to `vendor/` and updated generation scripts and documentation accordingly - #67
* Updated `apple/swift-openapi-generator` to `1.11.0` - #70
* Updated Ruby toolchain references to `4.0.2` - #69

### Fixed

* Fixed form-encoded Web API payload escaping so typed Block Kit requests preserve reserved characters correctly - #71

## [0.5.0] - 2026-03-11

### Added

* Added missing attributes for Slack interaction payloads:
  * `block_actions` now includes function metadata and interactivity fields from Slack's current payload shape.
  * `view_submission` and `view_closed` now include the missing function-related attributes.

### Changed

* Updated Slack API schemas to the latest upstream snapshots - #64, #65
* Updated `apple/swift-openapi-runtime` to `1.11.0` - #62
* Updated `hummingbird-project/swift-websocket` to `1.5.0` - #63

## [0.4.0] - 2026-02-22

### Changed

* Refactored interaction `container` modeling to a typed enum in `SlackModels.Container` - #60

### Fixed

* Fixed `block_actions` decoding for message-container payloads by allowing payloads without `view` - #60

## [0.3.0] - 2026-02-16

### Fixed

* Fixed schema mapping mismatch for user-shaped `profile` fields (issue [#42](https://github.com/ainame/swift-slack-client/issues/42)).
  * `User.profile`, `Member.profile`, `InvitingUser.profile`, and `TingUser.profile` now map to `UserProfile` instead of `Profile`.
  * Expanded `UserProfile` with missing properties from Slack user profile payloads (status metadata, normalized names, profile fields, additional image sizes, and app/bot metadata).
  * `TeamProfileGetResponse.profile` now maps to `TeamProfile` to reflect `team.profile.get` payload shape (`fields` / `sections`) instead of image-only `Profile`.
  * Updated generation pipeline to apply context-aware profile remapping while keeping `UserProfile` and `TeamProfile` as manually maintained models.

## [0.2.0] - 2025-08-17

### Added

* Minimum DocC documentation support https://ainame.github.io/swift-slack-client/documentation
* Schema update https://github.com/ainame/swift-slack-client/pull/33

### Fixed

* Schema update automation issue was resolved https://github.com/ainame/swift-slack-client/commit/44966ba5be88fe6df115d42f229bd04e9153f472
   * SwiftFormat got bug fixes around trailing commas and that helps us get consistently formatted code in schema updates


## [0.1.2] - 2025-06-28

### 🐛 Fixed
- **Item.ts Property**: Added optional `ts` property to `Item` model for reaction event compatibility
  - Fixed DeepL translator demo app where `item.ts` was accessed but didn't exist
  - `Item` now has `public var ts: Swift.String?` to support both reaction events and other APIs
  - Maintains type safety by keeping `ts` optional since it's not present in all contexts

### ✨ Added
- **Form-Encoding Middleware**: Automatic JSON to form-urlencoded conversion for Slack API compatibility
  - `FormEncodingMiddleware` installed by default in `SlackClient`
  - Transparent handling of Slack's POST + `application/x-www-form-urlencoded` requirement
  - Nested objects automatically serialized as JSON strings in form data
- **swift-dotenv Integration**: Environment variable management for DeepL translator demo
  - Added swift-dotenv dependency for cleaner configuration management
  - Removed ProcessInfo fallbacks in favor of explicit environment variable loading

### 🔧 Enhanced
- **Code Generation Pipeline**: Improved schema generation with `ItemTsOptionalAdder` visitor
  - Automatically adds optional `ts` property to Item schema during generation
  - Ensures consistency across WebAPI and Events API usage
- **Documentation**: Updated README with form-encoding workaround explanation
  - Honest documentation of temporary workaround nature
  - Technical notes section explaining design decisions

### 📋 Technical Notes
- Form-encoding middleware addresses swift-openapi-generator limitation with nested form data
- This is a workaround solution that may be updated in future versions
- All tests passing with new middleware and model changes

## [0.1.1] - 2025-06-28

### 🐛 Fixed
- **Slack API Compatibility**: Resolved `conversations.replies` "invalid_arguments" errors
  - Root cause: Slack APIs expect POST + `application/x-www-form-urlencoded`, not `application/json`
  - swift-openapi-generator doesn't support nested containers with form-urlencoded
- **Modal View Protocol**: Fixed `callbackId` optionality mismatch between protocol and implementation
- **Test Suite**: Disabled WebSocket-dependent test that required mocking infrastructure

### ✨ Added
- **FormEncodingMiddleware**: Automatic request transformation for Slack API compatibility
  - Converts POST + JSON requests to POST + form-urlencoded automatically
  - Handles nested objects by serializing them as JSON strings in form fields
  - Installed by default in SlackClient for transparent operation

### 🔧 Enhanced
- **DeepL Translator Demo**: Improved error handling and API compatibility
  - Fixed reaction event handling with proper `conversations.replies` usage
  - Enhanced duplicate translation detection logic
  - Better fallback handling for non-threaded messages

## [0.1.0] - 2025-06-23

### 🚨 Breaking Changes
- **BREAKING**: Socket Mode interactive handlers now require explicit acknowledgment
  - Removed auto-acknowledgment for interactive handlers (global shortcuts, view submissions, slash commands, block actions, message shortcuts)
  - All interactive handlers must now call `try await context.ack()`
  - Event API handlers remain unchanged (no acknowledgment required)
  - **Migration**: Add `try await context.ack()` at the start of your interactive handlers

### ✨ Added
- **Custom Ack Functionality**: New `Ack` struct with multiple acknowledgment methods
  - `ack()` - Basic acknowledgment
  - `ack(responseAction: .update, view:)` - Update views to keep modals open during processing
  - `ack(errors: [String: String])` - Send validation errors back to forms
  - Support for response actions: `.update`, `.push`, `.clear`
- **StateValuesObject**: New form value extraction system for SlackBlockKit
  - Subscript access: `payload.view.state?["blockId", "actionId"]?.value`
  - Support for `selectedOption`, `selectedOptions`, `selectedDate`, etc.
  - Computed `state` property on `View` enum for easy access
  - Comprehensive unit tests for JSON decoding scenarios
- **DeepL Translator Demo App**: Complete real-world Slack bot implementation
  - Global shortcut and reaction-based translation features
  - Modal UI with form handling and loading states
  - Demonstrates proper custom Ack usage patterns
  - DeepL API integration with shared HTTPClient

### 🐛 Fixed
- Added missing `ts` field to `Item` struct for reaction events
- Fixed reaction event handling for proper `conversations.replies` API usage

### 📚 Documentation
- **Enhanced README**: Comprehensive Socket Mode acknowledgment documentation
- Added practical examples for form validation, loading states, and error handling
- Updated all Socket Mode code examples to demonstrate proper `ack()` usage
- Concrete type examples instead of generic placeholders

### 🔧 Changed
- Updated all examples to use explicit acknowledgment patterns
- Enhanced `SlackModalView` to require non-optional `callbackId`
- Improved error handling patterns throughout Socket Mode handlers

## [0.0.5] - 2025-01-06

### Changed
- **BREAKING**: Renamed `SocketModeMessageRouter` to `SocketModeRouter` for brevity and consistency
  - Class renamed from `SocketModeMessageRouter` to `SocketModeRouter`
  - Method renamed from `addSocketModeMessageRouter(_:)` to `addSocketModeRouter(_:)`
  - All related type references updated accordingly
- Updated Slack API schemas to latest version
- Improved schema update workflow to only detect changes in Generated directories

### Documentation
- Added BlockKit examples section to README
- Fixed various README formatting issues

## [0.0.4] - 2025-06-01

### Added
- **MarkdownBlock Support**: Full implementation of MarkdownBlock with DSL integration and result builder patterns
- **Enhanced RichText API**: Complete coverage of all 9 Slack RichText element types (text, emoji, link, user, channel, date, broadcast, color, usergroup)
- **DSL Convenience Patterns**: Ergonomic initializers and patterns for common input elements and usage scenarios
- **Comprehensive Examples**: New snippet examples demonstrating MarkdownBlock, RichText features, and DSL convenience patterns
- **Shields.io Badges**: Professional badges in README for Swift version, SPM compatibility, license, releases, documentation, and build status

### Enhanced
- **SlackBlockKitDSL**: Added comprehensive convenience initializers for PlainTextInput, StaticSelect, ChannelsSelect, UsersSelect, and other common elements
- **RichText Elements**: Complete implementation of RichTextColorElement and RichTextUsergroupElement with full encoding/decoding support
- **Result Builders**: Enhanced @RichTextElementBuilder and @RichTextContentBuilder to support all element types
- **Code Examples**: Extensive practical examples showing real-world usage patterns across all new features

### Technical
- **Example Organization**: Better organization of code examples with comprehensive DSL and RichText demonstrations

## [0.0.3] - 2025-05-31

### Added
- Comprehensive regression test suite for SocketModeMessageRouter
- Internal initializers for SocketModeMessageEnvelope and EventsApiEnvelope to support testing

### Fixed
- Event type casting issue in SocketModeMessageRouter.onEvent<T: SlackEvent> method
- Generic type parameter handling that was preventing proper event dispatch

### Technical
- Added test coverage for event dispatch mechanism with actual handler execution validation
- Improved testability of SocketMode components

## [0.0.2] - 2025-05-31

### Added
- Comprehensive SlackBlockKit DSL with SwiftUI-like declarative syntax
- Result builders for clean block construction (@BlockBuilder, @ActionElementBuilder, etc.)
- Smart Section handling that automatically converts single Text to text property
- TextObject conformance to ExpressibleByStringLiteral for cleaner syntax
- @autoclosure modifiers for improved DSL ergonomics

### Changed
- **BREAKING**: Renamed core types for better Swift conventions:
  - `ViewType` → `View`
  - `BlockType` → `Block`
  - `EventType` → `Event`
  - `SocketModeMessageType` → `SocketModeMessage`
- Moved Snippets examples to proper Sources directory structure
- Updated Ruby code generation scripts to use new enum names
- Improved CodingKeys handling throughout codebase for proper snake_case conversion

### Fixed
- Compilation errors in Snippets examples by wrapping types in namespace enums
- Redundant @BlockBuilder usage in DSL implementation
- Demo compilation and runtime issues

### Technical
- Enhanced code generation pipeline for better type safety
- Improved separation of concerns between SlackBlockKit and SlackBlockKitDSL modules
- Better error handling and validation in DSL builders

## [0.0.1] - Initial Release

### Added
- Swift Slack client library with auto-generated WebAPI from OpenAPI specs
- Socket Mode support for real-time events
- 141+ shared model types in separate SlackModels module
- Events API with 96+ event types
- Block Kit UI framework implementation
- Comprehensive Ruby-based code generation pipeline
- Conditional compilation support for modular trait selection
- Examples and documentation
