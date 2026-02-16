import Foundation
import SlackBlockKit

// MARK: - Base Protocol

/// A protocol that represents a Slack view composed of blocks
public protocol SlackView {
    /// The blocks that make up this view
    @BlockBuilder
    var blocks: [Block] { get }
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

extension SlackModalView {
    /// Provide defaults for all optional properties
    public var submit: TextObject? {
        nil
    }

    public var close: TextObject? {
        nil
    }

    public var callbackId: String? {
        nil
    }

    public var clearOnClose: Bool? {
        nil
    }

    public var notifyOnClose: Bool? {
        nil
    }

    public var externalId: String? {
        nil
    }

    public var submitDisabled: Bool? {
        nil
    }

    public var privateMetadata: String? {
        nil
    }

    /// Builds this modal view into a ModalView
    public func render() -> View {
        .modal(
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
                submitDisabled: submitDisabled,
            ),
        )
    }
}

extension SlackHomeTabView {
    /// Provide defaults for all optional properties
    public var externalId: String? {
        nil
    }

    public var privateMetadata: String? {
        nil
    }

    /// Builds this home tab view into a View
    public func render() -> View {
        .homeTab(
            HomeTabView(
                blocks: blocks,
                privateMetadata: privateMetadata,
                callbackId: nil,
                externalId: externalId,
            ),
        )
    }
}

// MARK: - Convenience Extensions

/// Extension to allow embedding SlackViews within other views
extension BlockBuilder {
    public static func buildExpression(_ expression: some SlackView) -> [Block] {
        expression.blocks
    }
}
