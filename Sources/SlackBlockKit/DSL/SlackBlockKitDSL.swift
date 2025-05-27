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

/// Protocol for types that can be converted to BlockType.
public protocol BlockConvertible {
    /// Converts to BlockType. Use this method to get the final block representation.
    func asBlock() -> BlockType
}

// MARK: - StaticSelect DSL

/// A DSL component for creating static select menus.
public struct StaticSelect: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var options: [Option]?
    private var optionGroups: [OptionGroup]?
    private var actionId: String?
    private var initialOption: Option?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    /// Initialize with options using a result builder
    public init(@OptionBuilder options: () -> [Option]) {
        self.options = options()
    }

    /// Initialize with option groups using a result builder
    public init(@OptionGroupBuilder optionGroups: () -> [OptionGroup]) {
        self.optionGroups = optionGroups()
    }

    public func actionId(_ id: String) -> StaticSelect {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> StaticSelect {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> StaticSelect {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialOption(_ option: @autoclosure () -> Option) -> StaticSelect {
        var copy = self
        copy.initialOption = option()
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> StaticSelect {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> StaticSelect {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .staticSelect(StaticSelectElement(
            options: options?.map { $0.render() },
            optionGroups: optionGroups?.map { $0.render() },
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .staticSelect(StaticSelectElement(
            options: options?.map { $0.render() },
            optionGroups: optionGroups?.map { $0.render() },
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .staticSelect(StaticSelectElement(
            options: options?.map { $0.render() },
            optionGroups: optionGroups?.map { $0.render() },
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - OptionGroup DSL

/// A DSL component for creating option groups.
public struct OptionGroup {
    private var label: Text
    private var options: [Option]

    public init(label: Text, @OptionBuilder options: () -> [Option]) {
        self.label = label
        self.options = options()
    }

    public init(label: String, @OptionBuilder options: () -> [Option]) {
        self.label = Text(label)
        self.options = options()
    }

    public func render() -> OptionGroupObject {
        OptionGroupObject(
            label: label.render(),
            options: options.map { $0.render() }
        )
    }
}

// MARK: - HomeTab DSL

/// A DSL component for creating home tab views.
public struct HomeTab: ViewConvertible {
    private var blocks: [BlockType]
    private var privateMetadata: String?
    private var callbackId: String?
    private var externalId: String?

    public init(@BlockBuilder blocks: () -> [BlockType]) {
        self.blocks = blocks()
    }

    public func privateMetadata(_ metadata: String) -> HomeTab {
        var copy = self
        copy.privateMetadata = metadata
        return copy
    }

    public func callbackId(_ id: String) -> HomeTab {
        var copy = self
        copy.callbackId = id
        return copy
    }

    public func externalId(_ id: String) -> HomeTab {
        var copy = self
        copy.externalId = id
        return copy
    }

    public func asView() -> ViewType {
        .homeTab(HomeTabView(
            blocks: blocks,
            privateMetadata: privateMetadata,
            callbackId: callbackId,
            externalId: externalId
        ))
    }
}

// MARK: - ChannelsSelect DSL

/// A DSL component for creating channel select menus.
public struct ChannelsSelect: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var initialChannel: String?
    private var responseUrlEnabled: Bool?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> ChannelsSelect {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> ChannelsSelect {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> ChannelsSelect {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialChannel(_ channelId: String) -> ChannelsSelect {
        var copy = self
        copy.initialChannel = channelId
        return copy
    }

    public func responseUrlEnabled(_ enabled: Bool = true) -> ChannelsSelect {
        var copy = self
        copy.responseUrlEnabled = enabled
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> ChannelsSelect {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> ChannelsSelect {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .channelsSelect(ChannelsSelectElement(
            actionId: actionId,
            initialChannel: initialChannel,
            responseUrlEnabled: responseUrlEnabled,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .channelsSelect(ChannelsSelectElement(
            actionId: actionId,
            initialChannel: initialChannel,
            responseUrlEnabled: responseUrlEnabled,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .channelsSelect(ChannelsSelectElement(
            actionId: actionId,
            initialChannel: initialChannel,
            responseUrlEnabled: responseUrlEnabled,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - ExternalSelect DSL

/// A DSL component for creating external select menus.
public struct ExternalSelect: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var initialOption: Option?
    private var minQueryLength: Int?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> ExternalSelect {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> ExternalSelect {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> ExternalSelect {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialOption(_ option: @autoclosure () -> Option) -> ExternalSelect {
        var copy = self
        copy.initialOption = option()
        return copy
    }

    public func minQueryLength(_ length: Int) -> ExternalSelect {
        var copy = self
        copy.minQueryLength = length
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> ExternalSelect {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> ExternalSelect {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .externalSelect(ExternalSelectElement(
            actionId: actionId,
            initialOption: initialOption?.render(),
            minQueryLength: minQueryLength,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .externalSelect(ExternalSelectElement(
            actionId: actionId,
            initialOption: initialOption?.render(),
            minQueryLength: minQueryLength,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .externalSelect(ExternalSelectElement(
            actionId: actionId,
            initialOption: initialOption?.render(),
            minQueryLength: minQueryLength,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - UsersSelect DSL

/// A DSL component for creating user select menus.
public struct UsersSelect: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var initialUser: String?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> UsersSelect {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> UsersSelect {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> UsersSelect {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialUser(_ userId: String) -> UsersSelect {
        var copy = self
        copy.initialUser = userId
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> UsersSelect {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> UsersSelect {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .usersSelect(UsersSelectElement(
            actionId: actionId,
            initialUser: initialUser,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .usersSelect(UsersSelectElement(
            actionId: actionId,
            initialUser: initialUser,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .usersSelect(UsersSelectElement(
            actionId: actionId,
            initialUser: initialUser,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - ConversationsSelect DSL

/// A DSL component for creating conversation select menus.
public struct ConversationsSelect: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var initialConversation: String?
    private var defaultToCurrentConversation: Bool?
    private var confirm: ConfirmationDialog?
    private var responseUrlEnabled: Bool?
    private var filter: ConversationFilterObject?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> ConversationsSelect {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> ConversationsSelect {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> ConversationsSelect {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialConversation(_ conversationId: String) -> ConversationsSelect {
        var copy = self
        copy.initialConversation = conversationId
        return copy
    }

    public func defaultToCurrentConversation(_ useDefault: Bool = true) -> ConversationsSelect {
        var copy = self
        copy.defaultToCurrentConversation = useDefault
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> ConversationsSelect {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func responseUrlEnabled(_ enabled: Bool = true) -> ConversationsSelect {
        var copy = self
        copy.responseUrlEnabled = enabled
        return copy
    }

    public func filter(_ filter: ConversationFilterObject) -> ConversationsSelect {
        var copy = self
        copy.filter = filter
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> ConversationsSelect {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .conversationsSelect(ConversationsSelectElement(
            actionId: actionId,
            initialConversation: initialConversation,
            defaultToCurrentConversation: defaultToCurrentConversation,
            responseUrlEnabled: responseUrlEnabled,
            filter: filter,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .conversationsSelect(ConversationsSelectElement(
            actionId: actionId,
            initialConversation: initialConversation,
            defaultToCurrentConversation: defaultToCurrentConversation,
            responseUrlEnabled: responseUrlEnabled,
            filter: filter,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .conversationsSelect(ConversationsSelectElement(
            actionId: actionId,
            initialConversation: initialConversation,
            defaultToCurrentConversation: defaultToCurrentConversation,
            responseUrlEnabled: responseUrlEnabled,
            filter: filter,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - DatePicker DSL

/// A DSL component for creating date picker elements.
public struct DatePicker: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var initialDate: String?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> DatePicker {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> DatePicker {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> DatePicker {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialDate(_ date: String) -> DatePicker {
        var copy = self
        copy.initialDate = date
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> DatePicker {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> DatePicker {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .datePicker(DatePickerElement(
            actionId: actionId,
            initialDate: initialDate,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .datePicker(DatePickerElement(
            actionId: actionId,
            initialDate: initialDate,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .datePicker(DatePickerElement(
            actionId: actionId,
            initialDate: initialDate,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - TimePicker DSL

/// A DSL component for creating time picker elements.
public struct TimePicker: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var initialTime: String?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> TimePicker {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> TimePicker {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> TimePicker {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialTime(_ time: String) -> TimePicker {
        var copy = self
        copy.initialTime = time
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> TimePicker {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> TimePicker {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .timePicker(TimePickerElement(
            actionId: actionId,
            initialTime: initialTime,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asActionElement() -> ActionElementType {
        .timePicker(TimePickerElement(
            actionId: actionId,
            initialTime: initialTime,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .timePicker(TimePickerElement(
            actionId: actionId,
            initialTime: initialTime,
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - RadioButtons DSL

/// A DSL component for creating radio button groups.
public struct RadioButtons: InputElementConvertible, ActionElementConvertible, SectionAccessoryConvertible {
    private var actionId: String?
    private var options: [Option]?
    private var initialOption: Option?
    private var confirm: ConfirmationDialog?
    private var focusOnLoad: Bool?

    public init() {}

    public init(@OptionBuilder options: () -> [Option]) {
        self.options = options()
    }

    public func actionId(_ id: String) -> RadioButtons {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func options(_ options: [Option]) -> RadioButtons {
        var copy = self
        copy.options = options
        return copy
    }

    public func options(@OptionBuilder _ options: () -> [Option]) -> RadioButtons {
        var copy = self
        copy.options = options()
        return copy
    }

    public func initialOption(_ option: @autoclosure () -> Option) -> RadioButtons {
        var copy = self
        copy.initialOption = option()
        return copy
    }

    public func confirm(_ confirm: @autoclosure () -> ConfirmationDialog) -> RadioButtons {
        var copy = self
        copy.confirm = confirm()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> RadioButtons {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .radioButtons(RadioButtonsElement(
            options: options?.map { $0.render() } ?? [],
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad
        ))
    }

    public func asActionElement() -> ActionElementType {
        .radioButtons(RadioButtonsElement(
            options: options?.map { $0.render() } ?? [],
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad
        ))
    }

    public func asSectionAccessory() -> SectionAccessory {
        .radioButtons(RadioButtonsElement(
            options: options?.map { $0.render() } ?? [],
            actionId: actionId,
            initialOption: initialOption?.render(),
            confirm: confirm?.render(),
            focusOnLoad: focusOnLoad
        ))
    }
}

// MARK: - Image DSL

/// A DSL component for creating image blocks.
public struct Image: BlockConvertible {
    private var imageUrl: URL
    private var altText: String
    private var title: Text?
    private var blockId: String?

    public init(imageUrl: URL, altText: String) {
        self.imageUrl = imageUrl
        self.altText = altText
    }

    public func title(_ title: @autoclosure () -> Text) -> Image {
        var copy = self
        copy.title = title()
        return copy
    }

    public func title(_ title: String) -> Image {
        var copy = self
        copy.title = Text(title)
        return copy
    }

    public func blockId(_ id: String) -> Image {
        var copy = self
        copy.blockId = id
        return copy
    }

    public func asBlock() -> BlockType {
        .image(ImageBlock(
            altText: altText,
            imageUrl: imageUrl,
            title: title?.render(),
            blockId: blockId
        ))
    }
}

// MARK: - Video DSL

/// A DSL component for creating video blocks.
public struct Video: BlockConvertible {
    private var altText: String
    private var authorName: String?
    private var description: Text?
    private var providerIconUrl: URL?
    private var providerName: String?
    private var title: Text
    private var titleUrl: URL?
    private var thumbnailUrl: URL
    private var videoUrl: URL
    private var blockId: String?

    public init(
        videoUrl: URL,
        thumbnailUrl: URL,
        altText: String,
        title: Text
    ) {
        self.videoUrl = videoUrl
        self.thumbnailUrl = thumbnailUrl
        self.altText = altText
        self.title = title
    }

    public init(
        videoUrl: URL,
        thumbnailUrl: URL,
        altText: String,
        title: String
    ) {
        self.videoUrl = videoUrl
        self.thumbnailUrl = thumbnailUrl
        self.altText = altText
        self.title = Text(title)
    }

    public func authorName(_ name: String) -> Video {
        var copy = self
        copy.authorName = name
        return copy
    }

    public func description(_ description: @autoclosure () -> Text) -> Video {
        var copy = self
        copy.description = description()
        return copy
    }

    public func description(_ description: String) -> Video {
        var copy = self
        copy.description = Text(description)
        return copy
    }

    public func provider(name: String, iconUrl: URL? = nil) -> Video {
        var copy = self
        copy.providerName = name
        copy.providerIconUrl = iconUrl
        return copy
    }

    public func titleUrl(_ url: URL) -> Video {
        var copy = self
        copy.titleUrl = url
        return copy
    }

    public func blockId(_ id: String) -> Video {
        var copy = self
        copy.blockId = id
        return copy
    }

    public func asBlock() -> BlockType {
        .video(VideoBlock(
            altText: altText,
            videoUrl: videoUrl,
            thumbnailUrl: thumbnailUrl,
            title: title.render(),
            titleUrl: titleUrl,
            description: description?.render(),
            providerName: providerName,
            providerIconUrl: providerIconUrl,
            authorName: authorName,
            blockId: blockId
        ))
    }
}

// MARK: - NumberInput DSL

/// A DSL component for creating number input elements.
public struct NumberInput: InputElementConvertible {
    private var isDecimalAllowed: Bool?
    private var actionId: String?
    private var initialValue: String?
    private var minValue: String?
    private var maxValue: String?
    private var dispatchActionConfig: DispatchActionConfigurationObject?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> NumberInput {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> NumberInput {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> NumberInput {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialValue(_ value: String) -> NumberInput {
        var copy = self
        copy.initialValue = value
        return copy
    }

    public func minValue(_ value: String) -> NumberInput {
        var copy = self
        copy.minValue = value
        return copy
    }

    public func maxValue(_ value: String) -> NumberInput {
        var copy = self
        copy.maxValue = value
        return copy
    }

    public func allowDecimal(_ allow: Bool = true) -> NumberInput {
        var copy = self
        copy.isDecimalAllowed = allow
        return copy
    }

    public func dispatchActionConfig(_ config: @autoclosure () -> DispatchActionConfig) -> NumberInput {
        var copy = self
        copy.dispatchActionConfig = config().render()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> NumberInput {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .numberInput(NumberInputElement(
            isDecimalAllowed: isDecimalAllowed ?? false,
            actionId: actionId,
            initialValue: initialValue,
            minValue: minValue,
            maxValue: maxValue,
            dispatchActionConfig: dispatchActionConfig,
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}

// MARK: - EmailInput DSL

/// A DSL component for creating email input elements.
public struct EmailInput: InputElementConvertible {
    private var actionId: String?
    private var initialValue: String?
    private var dispatchActionConfig: DispatchActionConfigurationObject?
    private var focusOnLoad: Bool?
    private var placeholder: Text?

    public init() {}

    public func actionId(_ id: String) -> EmailInput {
        var copy = self
        copy.actionId = id
        return copy
    }

    public func placeholder(_ placeholder: @autoclosure () -> Text) -> EmailInput {
        var copy = self
        copy.placeholder = placeholder()
        return copy
    }

    public func placeholder(_ placeholder: String) -> EmailInput {
        var copy = self
        copy.placeholder = Text(placeholder)
        return copy
    }

    public func initialValue(_ value: String) -> EmailInput {
        var copy = self
        copy.initialValue = value
        return copy
    }

    public func dispatchActionConfig(_ config: @autoclosure () -> DispatchActionConfig) -> EmailInput {
        var copy = self
        copy.dispatchActionConfig = config().render()
        return copy
    }

    public func focusOnLoad(_ focus: Bool = true) -> EmailInput {
        var copy = self
        copy.focusOnLoad = focus
        return copy
    }

    public func asInputElement() -> InputElementType {
        .emailInput(EmailInputElement(
            actionId: actionId,
            initialValue: initialValue,
            dispatchActionConfig: dispatchActionConfig,
            focusOnLoad: focusOnLoad,
            placeholder: placeholder?.render()
        ))
    }
}
