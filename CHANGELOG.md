# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
