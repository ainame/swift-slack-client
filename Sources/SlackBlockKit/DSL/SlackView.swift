import Foundation

// MARK: - Base Protocol

/// A protocol that represents a Slack view composed of blocks
public protocol SlackView {
    /// The blocks that make up this view
    @BlockBuilder
    var blocks: [BlockType] { get }
}

// MARK: - Modal View Protocol

/// A protocol for views that can be rendered as Slack modals
public protocol SlackModalView: SlackView {
    /// The title of the modal
    var title: TextObject { get }

    /// The text for the submit button (optional)
    var submit: TextObject? { get }

    /// The text for the close button (optional)
    var close: TextObject? { get }

    /// A string that acts as a unique identifier for a view
    var callbackId: String? { get }

    /// Whether to clear all views in the stack when this modal is closed
    var clearOnClose: Bool? { get }

    /// Whether to send a view_closed event when the modal is closed
    var notifyOnClose: Bool? { get }

    /// A unique identifier for the view set by the developer
    var externalId: String? { get }

    /// Whether the submit button should be disabled
    var submitDisabled: Bool? { get }

    /// Private metadata that will be passed to your app in view submissions
    var privateMetadata: String? { get }
}

// MARK: - Home Tab View Protocol

/// A protocol for views that can be rendered as Slack home tabs
public protocol SlackHomeTabView: SlackView {
    /// A unique identifier for the view set by the developer
    var externalId: String? { get }

    /// Private metadata that will be passed to your app
    var privateMetadata: String? { get }
}

// MARK: - Default Implementations

public extension SlackModalView {
    // Provide defaults for all optional properties
    var submit: TextObject? { nil }
    var close: TextObject? { nil }
    var callbackId: String? { nil }
    var clearOnClose: Bool? { nil }
    var notifyOnClose: Bool? { nil }
    var externalId: String? { nil }
    var submitDisabled: Bool? { nil }
    var privateMetadata: String? { nil }

    /// Builds this modal view into a ModalView
    func build() -> ModalView {
        ModalView(
            title: title,
            blocks: blocks,
            close: close,
            submit: submit,
            privateMetadata: privateMetadata,
            callbackId: callbackId,
            clearOnClose: clearOnClose,
            notifyOnClose: notifyOnClose,
            externalId: externalId,
            submitDisabled: submitDisabled
        )
    }
}

public extension SlackHomeTabView {
    // Provide defaults for all optional properties
    var externalId: String? { nil }
    var privateMetadata: String? { nil }

    /// Builds this home tab view into a HomeTabView
    func build() -> HomeTabView {
        HomeTabView(
            blocks: blocks,
            privateMetadata: privateMetadata,
            callbackId: nil,
            externalId: externalId
        )
    }
}

// MARK: - Built-in Views

/// An empty view that renders no blocks
public struct EmptyView: SlackView {
    @BlockBuilder
    public var blocks: [BlockType] {
        // Empty - produces no blocks
    }

    public init() {}
}

/// A view that groups multiple blocks together
public struct Group: SlackView {
    private let _blocks: [BlockType]

    @BlockBuilder
    public var blocks: [BlockType] {
        for block in _blocks {
            block
        }
    }

    public init(@BlockBuilder content: () -> [BlockType]) {
        self._blocks = content()
    }
}

// MARK: - Type Erasure

/// A type-erased Slack view
public struct AnySlackView: SlackView {
    private let _blocks: () -> [BlockType]

    @BlockBuilder
    public var blocks: [BlockType] {
        for block in _blocks() {
            block
        }
    }

    public init<V: SlackView>(_ view: V) {
        self._blocks = { view.blocks }
    }
}

// MARK: - Convenience Extensions

/// Extension to allow embedding SlackViews within other views
extension BlockBuilder {
    public static func buildExpression<V: SlackView>(_ expression: V) -> [BlockType] {
        expression.blocks
    }
}

// MARK: - Helper Extensions

public extension String {
    /// Converts a string to a plain text TextObject
    func asTextObject() -> TextObject {
        TextObject(type: .plainText, text: self)
    }

    /// Converts a string to a markdown TextObject
    func asMrkdwnTextObject() -> TextObject {
        TextObject(type: .mrkdwn, text: self)
    }
}

public extension Text {
    /// Converts a Text to a TextObject
    func asTextObject() -> TextObject {
        render()
    }
}
