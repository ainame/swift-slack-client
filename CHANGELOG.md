# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
