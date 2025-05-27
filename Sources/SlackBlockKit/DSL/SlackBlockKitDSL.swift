import Foundation

// MARK: - Text DSL

public struct Text: CompositionObject {
    internal var text: String
    private var style: TextStyle
    private var verbatim: Bool
    private var emoji: Bool
    
    public init(_ text: String) {
        self.text = text
        self.style = .plainText
        self.verbatim = false
        self.emoji = true
    }
    
    public func style(_ style: TextStyle) -> Text {
        var copy = self
        copy.style = style
        return copy
    }
    
    public func verbatim(_ verbatim: Bool = true) -> Text {
        var copy = self
        copy.verbatim = verbatim
        return copy
    }
    
    public func emoji(_ emoji: Bool) -> Text {
        var copy = self
        copy.emoji = emoji
        return copy
    }
    
    public func render() -> TextObject {
        switch style {
        case .plainText:
            return TextObject(type: .plainText, text: text, emoji: emoji, verbatim: nil)
        case .mrkdwn:
            return TextObject(type: .mrkdwn, text: text, emoji: nil, verbatim: verbatim)
        }
    }
}

public enum TextStyle {
    case plainText
    case mrkdwn
}

// MARK: - Option DSL

public struct Option: CompositionObject {
    private var text: Text
    private var value: String?
    private var description: Text?
    private var url: URL?
    
    public init(_ text: Text) {
        self.text = text
    }
    
    public init(_ text: String) {
        self.text = Text(text)
    }
    
    public func value(_ value: String) -> Option {
        var copy = self
        copy.value = value
        return copy
    }
    
    public func description(_ description: Text) -> Option {
        var copy = self
        copy.description = description
        return copy
    }
    
    public func description(_ description: String) -> Option {
        var copy = self
        copy.description = Text(description)
        return copy
    }
    
    public func url(_ url: URL) -> Option {
        var copy = self
        copy.url = url
        return copy
    }
    
    public func render() -> OptionObject {
        OptionObject(
            text: text.render(),
            value: value ?? text.text,
            description: description?.render(),
            url: url
        )
    }
}

// MARK: - Section DSL

public struct Section: BlockComponent {
    private var text: Text?
    private var accessory: SectionAccessory?
    private var fields: [Text]?
    private var blockId: String?
    
    public init(@TextListBuilder content: () -> [Text]) {
        let texts = content()
        if texts.count == 1 {
            // If only one text, use it as the main text
            self.text = texts.first
            self.fields = nil
        } else {
            // If multiple texts, use them as fields
            self.text = nil
            self.fields = texts
        }
    }
    
    public init() {
        // Empty section for accessory-only use
    }
    
    public func accessory<T: SectionAccessoryConvertible>(_ accessory: @autoclosure () -> T) -> Section {
        var copy = self
        copy.accessory = accessory().asSectionAccessory()
        return copy
    }
    
    public func blockId(_ id: String) -> Section {
        var copy = self
        copy.blockId = id
        return copy
    }
    
    public func render() -> BlockType {
        .section(SectionBlock(
            text: text?.render(),
            fields: fields?.map { $0.render() },
            accessory: accessory,
            blockId: blockId
        ))
    }
}

// MARK: - Input DSL

public struct Input<Element: InputElementConvertible>: BlockComponent {
    private var element: Element
    private var label: Text
    private var hint: Text?
    private var optional: Bool?
    private var blockId: String?
    private var dispatchAction: Bool?
    
    public init(
        @InputElementBuilder element: () -> Element,
        @TextBuilder label: () -> Text
    ) {
        self.element = element()
        self.label = label()
    }
    
    public func hint(_ hint: @autoclosure () -> Text) -> Input {
        var copy = self
        copy.hint = hint()
        return copy
    }
    
    public func hint(_ hint: String) -> Input {
        var copy = self
        copy.hint = Text(hint)
        return copy
    }
    
    public func optional(_ optional: Bool = true) -> Input {
        var copy = self
        copy.optional = optional
        return copy
    }
    
    public func blockId(_ id: String) -> Input {
        var copy = self
        copy.blockId = id
        return copy
    }
    
    public func dispatchAction(_ dispatch: Bool = true) -> Input {
        var copy = self
        copy.dispatchAction = dispatch
        return copy
    }
    
    public func render() -> BlockType {
        .input(InputBlock(
            label: label.render(),
            element: element.asInputElement(),
            blockId: blockId,
            dispatchAction: dispatchAction,
            hint: hint?.render(),
            optional: optional
        ))
    }
}

// MARK: - Checkboxes DSL

public struct Checkboxes: InputElementConvertible, ActionElementConvertible {
    private var options: [Option]
    private var initialOptions: [Option]?
    private var actionId: String?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    
    public init(@OptionBuilder options: () -> [Option]) {
        self.options = options()
    }
    
    public func initialOptions(@OptionBuilder options: () -> [Option]) -> Checkboxes {
        var copy = self
        copy.initialOptions = options()
        return copy
    }
    
    public func initialOptions(_ options: [Option]) -> Checkboxes {
        var copy = self
        copy.initialOptions = options
        return copy
    }
    
    public func actionId(_ id: String) -> Checkboxes {
        var copy = self
        copy.actionId = id
        return copy
    }
    
    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> Checkboxes {
        var copy = self
        copy.confirm = confirm()
        return copy
    }
    
    public func focusOnLoad(_ focus: Bool = true) -> Checkboxes {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }
    
    public func asInputElement() -> InputElementType {
        .checkboxes(CheckboxesElement(
            options: options.map { $0.render() },
            actionId: actionId,
            initialOptions: initialOptions?.map { $0.render() },
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad
        ))
    }
    
    public func asActionElement() -> ActionElementType {
        .checkboxes(CheckboxesElement(
            options: options.map { $0.render() },
            actionId: actionId,
            initialOptions: initialOptions?.map { $0.render() },
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad
        ))
    }
}

// MARK: - PlainTextInput DSL

public struct PlainTextInput: InputElementConvertible {
    private var placeholder: Text?
    private var initialValue: String?
    private var multiline: Bool?
    private var minLength: Int?
    private var maxLength: Int?
    private var actionId: String?
    private var focusOnLoad: Bool?
    private var dispatchActionConfig: DispatchActionConfig?
    
    public init() {}
    
    public func placeholder(_ placeholder: @autoclosure () -> Text) -> PlainTextInput {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }
    
    public func placeholder(_ placeholder: String) -> PlainTextInput {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }
    
    public func initialValue(_ value: String) -> PlainTextInput {
        var copy = self
        copy.initialValue = value
        return copy
    }
    
    public func multiline(_ multiline: Bool = true) -> PlainTextInput {
        var copy = self
        copy.multiline = multiline
        return copy
    }
    
    public func minLength(_ length: Int) -> PlainTextInput {
        var copy = self
        copy.minLength = length
        return copy
    }
    
    public func maxLength(_ length: Int) -> PlainTextInput {
        var copy = self
        copy.maxLength = length
        return copy
    }
    
    public func actionId(_ id: String) -> PlainTextInput {
        var copy = self
        copy.actionId = id
        return copy
    }
    
    public func focusOnLoad(_ focus: Bool = true) -> PlainTextInput {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }
    
    public func dispatchActionConfig(_ config: DispatchActionConfig) -> PlainTextInput {
        var copy = self
        copy.dispatchActionConfig = config
        return copy
    }
    
    public func asInputElement() -> InputElementType {
        .plainTextInput(PlainTextInputElement(
            actionId: actionId,
            initialValue: initialValue,
            multiline: multiline,
            minLength: minLength,
            maxLength: maxLength,
            dispatchActionConfig: dispatchActionConfig?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - Button DSL

public struct Button: ActionElementConvertible, SectionAccessoryConvertible {
    private var text: Text
    private var actionId: String?
    private var url: URL?
    private var value: String?
    private var style: ButtonStyle?
    private var confirm: ConfirmationDialog?
    private var accessibilityLabel: String?
    
    public init(_ text: Text) {
        self.text = text
    }
    
    public init(_ text: String) {
        self.text = Text(text)
    }
    
    public func actionId(_ id: String) -> Button {
        var copy = self
        copy.actionId = id
        return copy
    }
    
    public func url(_ url: URL) -> Button {
        var copy = self
        copy.url = url
        return copy
    }
    
    public func value(_ value: String) -> Button {
        var copy = self
        copy.value = value
        return copy
    }
    
    public func style(_ style: ButtonStyle) -> Button {
        var copy = self
        copy.style = style
        return copy
    }
    
    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> Button {
        var copy = self
        copy.confirm = confirm()
        return copy
    }
    
    public func accessibilityLabel(_ label: String) -> Button {
        var copy = self
        copy.accessibilityLabel = label
        return copy
    }
    
    public func asActionElement() -> ActionElementType {
        .button(ButtonElement(
            text: text.render(),
            actionId: actionId,
            url: url,
            value: value,
            style: style,
            confirm: confirm?.render(),
            accessibilityLabel: accessibilityLabel
        ))
    }
    
    public func asSectionAccessory() -> SectionAccessory {
        .button(ButtonElement(
            text: text.render(),
            actionId: actionId,
            url: url,
            value: value,
            style: style,
            confirm: confirm?.render(),
            accessibilityLabel: accessibilityLabel
        ))
    }
}

// MARK: - ConfirmationDialog DSL

public struct ConfirmationDialog: CompositionObject {
    private var title: Text
    private var text: Text
    private var confirm: Text
    private var deny: Text
    private var style: ConfirmationStyle?
    
    public init(
        title: Text,
        text: Text,
        confirm: Text = Text("Confirm"),
        deny: Text = Text("Cancel")
    ) {
        self.title = title
        self.text = text
        self.confirm = confirm
        self.deny = deny
    }
    
    public func style(_ style: ConfirmationStyle) -> ConfirmationDialog {
        var copy = self
        copy.style = style
        return copy
    }
    
    public func render() -> ConfirmationDialogObject {
        ConfirmationDialogObject(
            title: title.render(),
            text: text.render(),
            confirm: confirm.render(),
            deny: deny.render(),
            style: style
        )
    }
}

// MARK: - DispatchActionConfig DSL

public struct DispatchActionConfig: CompositionObject {
    private var triggerActionsOn: [TriggerAction]
    
    public init(triggerActionsOn: [TriggerAction]) {
        self.triggerActionsOn = triggerActionsOn
    }
    
    public func render() -> DispatchActionConfigurationObject {
        DispatchActionConfigurationObject(
            triggerActionsOn: triggerActionsOn
        )
    }
}

// MARK: - Actions DSL

public struct Actions: BlockComponent {
    private var elements: [ActionElementType]
    private var blockId: String?
    
    public init(@ActionElementBuilder elements: () -> [ActionElementType]) {
        self.elements = elements()
    }
    
    public func blockId(_ id: String) -> Actions {
        var copy = self
        copy.blockId = id
        return copy
    }
    
    public func render() -> BlockType {
        .actions(ActionsBlock(
            elements: elements,
            blockId: blockId
        ))
    }
}

// MARK: - Header DSL

public struct Header: BlockComponent {
    private var text: Text
    private var blockId: String?
    
    public init(@TextBuilder content: () -> Text) {
        self.text = content()
    }
    
    public func blockId(_ id: String) -> Header {
        var copy = self
        copy.blockId = id
        return copy
    }
    
    public func render() -> BlockType {
        .header(HeaderBlock(
            text: text.render(),
            blockId: blockId
        ))
    }
}

// MARK: - Divider DSL

public struct Divider: BlockComponent {
    private var blockId: String?
    
    public init() {}
    
    public func blockId(_ id: String) -> Divider {
        var copy = self
        copy.blockId = id
        return copy
    }
    
    public func render() -> BlockType {
        .divider(DividerBlock(blockId: blockId))
    }
}

// MARK: - Context DSL

public struct Context: BlockComponent {
    private var elements: [ContextElementType]
    private var blockId: String?
    
    public init(@ContextElementBuilder content: () -> [ContextElementType]) {
        self.elements = content()
    }
    
    public func blockId(_ id: String) -> Context {
        var copy = self
        copy.blockId = id
        return copy
    }
    
    public func render() -> BlockType {
        .context(ContextBlock(
            elements: elements,
            blockId: blockId
        ))
    }
}

// MARK: - ContextImage DSL

public struct ContextImage {
    private var imageUrl: URL
    private var altText: String
    
    public init(imageUrl: URL, altText: String) {
        self.imageUrl = imageUrl
        self.altText = altText
    }
    
    public func asContextElement() -> ContextElementType {
        .image(ImageElement(
            altText: altText,
            imageUrl: imageUrl
        ))
    }
}

// MARK: - Modal DSL

public struct Modal: ViewConvertible {
    private var title: Text
    private var blocks: [BlockType]
    private var close: Text?
    private var submit: Text?
    private var privateMetadata: String?
    private var callbackId: String?
    private var clearOnClose: Bool?
    private var notifyOnClose: Bool?
    private var externalId: String?
    
    public init(
        title: Text,
        @BlockBuilder blocks: () -> [BlockType]
    ) {
        self.title = title
        self.blocks = blocks()
    }
    
    public func close(_ text: Text) -> Modal {
        var copy = self
        copy.close = text
        return copy
    }
    
    public func submit(_ text: Text) -> Modal {
        var copy = self
        copy.submit = text
        return copy
    }
    
    public func privateMetadata(_ metadata: String) -> Modal {
        var copy = self
        copy.privateMetadata = metadata
        return copy
    }
    
    public func callbackId(_ id: String) -> Modal {
        var copy = self
        copy.callbackId = id
        return copy
    }
    
    public func clearOnClose(_ clear: Bool = true) -> Modal {
        var copy = self
        copy.clearOnClose = clear
        return copy
    }
    
    public func notifyOnClose(_ notify: Bool = true) -> Modal {
        var copy = self
        copy.notifyOnClose = notify
        return copy
    }
    
    public func externalId(_ id: String) -> Modal {
        var copy = self
        copy.externalId = id
        return copy
    }
    
    public func asView() -> ViewType {
        .modal(ModalView(
            title: title.render(),
            blocks: blocks,
            close: close?.render(),
            submit: submit?.render(),
            privateMetadata: privateMetadata,
            callbackId: callbackId,
            clearOnClose: clearOnClose,
            notifyOnClose: notifyOnClose,
            externalId: externalId
        ))
    }
}

// MARK: - Protocol Conformances

/// Protocol for types that can be converted to InputElementType.
/// Note: The conversion methods are implementation details and not intended for direct use.
public protocol InputElementConvertible {
    /// Converts to InputElementType. This is an implementation detail.
    func asInputElement() -> InputElementType
}

/// Protocol for types that can be converted to ActionElementType.
/// Note: The conversion methods are implementation details and not intended for direct use.
public protocol ActionElementConvertible {
    /// Converts to ActionElementType. This is an implementation detail.
    func asActionElement() -> ActionElementType
}

/// Protocol for types that can be converted to SectionAccessory.
/// Note: The conversion methods are implementation details and not intended for direct use.
public protocol SectionAccessoryConvertible {
    /// Converts to SectionAccessory. This is an implementation detail.
    func asSectionAccessory() -> SectionAccessory
}

/// Protocol for types that can be converted to ViewType.
public protocol ViewConvertible {
    /// Converts to ViewType. Use this method to get the final view representation.
    func asView() -> ViewType
}

