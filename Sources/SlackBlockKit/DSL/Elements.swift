import Foundation

/// DSL component for Button elements
public struct Button: BlockElement {
    let text: String
    let actionId: String
    let value: String?
    let url: String?
    let style: ButtonStyle?
    let confirm: ConfirmationDialogObject?
    
    public init(
        _ text: String,
        actionId: String,
        value: String? = nil,
        url: String? = nil,
        style: ButtonStyle? = nil,
        confirm: Confirm? = nil
    ) {
        self.text = text
        self.actionId = actionId
        self.value = value
        self.url = url
        self.style = style
        self.confirm = confirm?.render()
    }
    
    public func render() -> ButtonElement {
        ButtonElement(
            text: TextObject(type: .plainText, text: text, emoji: true),
            actionId: actionId,
            url: url.flatMap { URL(string: $0) },
            value: value,
            style: style,
            confirm: confirm
        )
    }
}

/// DSL component for TextField elements
public struct TextField: BlockElement {
    let actionId: String
    let placeholder: String?
    let initialValue: String?
    let multiline: Bool
    let minLength: Int?
    let maxLength: Int?
    let dispatchActionConfig: DispatchActionConfigurationObject?
    
    public init(
        actionId: String,
        placeholder: String? = nil,
        initialValue: String? = nil,
        multiline: Bool = false,
        minLength: Int? = nil,
        maxLength: Int? = nil,
        dispatchOnEnter: Bool = false,
        dispatchOnCharacter: Bool = false
    ) {
        self.actionId = actionId
        self.placeholder = placeholder
        self.initialValue = initialValue
        self.multiline = multiline
        self.minLength = minLength
        self.maxLength = maxLength
        
        if dispatchOnEnter || dispatchOnCharacter {
            var triggers: [TriggerAction] = []
            if dispatchOnEnter { triggers.append(.onEnterPressed) }
            if dispatchOnCharacter { triggers.append(.onCharacterEntered) }
            self.dispatchActionConfig = DispatchActionConfigurationObject(triggerActionsOn: triggers)
        } else {
            self.dispatchActionConfig = nil
        }
    }
    
    public func render() -> PlainTextInputElement {
        PlainTextInputElement(
            actionId: actionId,
            initialValue: initialValue,
            multiline: multiline,
            minLength: minLength,
            maxLength: maxLength,
            dispatchActionConfig: dispatchActionConfig,
            placeholder: placeholder.map { TextObject(type: .plainText, text: $0) }
        )
    }
}

/// DSL component for StaticSelect elements
public struct StaticSelect: BlockElement {
    let actionId: String
    let placeholder: String
    let options: [OptionObject]
    let initialOption: OptionObject?
    let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        placeholder: String,
        options: [Option],
        initialOption: Option? = nil,
        confirm: Confirm? = nil
    ) {
        self.actionId = actionId
        self.placeholder = placeholder
        self.options = options.map { $0.render() }
        self.initialOption = initialOption?.render()
        self.confirm = confirm?.render()
    }
    
    public func render() -> StaticSelectElement {
        StaticSelectElement(
            options: options,
            optionGroups: nil,
            actionId: actionId,
            initialOption: initialOption,
            confirm: confirm,
            placeholder: TextObject(type: .plainText, text: placeholder)
        )
    }
}

/// DSL component for DatePicker elements
public struct DatePicker: BlockElement {
    let actionId: String
    let placeholder: String?
    let initialDate: String?
    let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        placeholder: String? = nil,
        initialDate: String? = nil,
        confirm: Confirm? = nil
    ) {
        self.actionId = actionId
        self.placeholder = placeholder
        self.initialDate = initialDate
        self.confirm = confirm?.render()
    }
    
    public func render() -> DatePickerElement {
        DatePickerElement(
            actionId: actionId,
            initialDate: initialDate,
            confirm: confirm,
            placeholder: placeholder.map { TextObject(type: .plainText, text: $0) }
        )
    }
}

/// DSL component for Checkbox elements
public struct Checkboxes: BlockElement {
    let actionId: String
    let options: [OptionObject]
    let initialOptions: [OptionObject]?
    let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        options: [Option],
        initialOptions: [Option]? = nil,
        confirm: Confirm? = nil
    ) {
        self.actionId = actionId
        self.options = options.map { $0.render() }
        self.initialOptions = initialOptions?.map { $0.render() }
        self.confirm = confirm?.render()
    }
    
    public func render() -> CheckboxesElement {
        CheckboxesElement(
            options: options,
            actionId: actionId,
            initialOptions: initialOptions,
            confirm: confirm
        )
    }
}

/// DSL component for Radio Button elements
public struct RadioButtons: BlockElement {
    let actionId: String
    let options: [OptionObject]
    let initialOption: OptionObject?
    let confirm: ConfirmationDialogObject?
    
    public init(
        actionId: String,
        options: [Option],
        initialOption: Option? = nil,
        confirm: Confirm? = nil
    ) {
        self.actionId = actionId
        self.options = options.map { $0.render() }
        self.initialOption = initialOption?.render()
        self.confirm = confirm?.render()
    }
    
    public func render() -> RadioButtonsElement {
        RadioButtonsElement(
            options: options,
            actionId: actionId,
            initialOption: initialOption,
            confirm: confirm
        )
    }
}

/// DSL component for Image elements (in context blocks)
public struct ContextImage: BlockElement {
    let imageUrl: String
    let altText: String
    
    public init(url: String, alt: String) {
        self.imageUrl = url
        self.altText = alt
    }
    
    public func render() -> SlackBlockKit.ImageElement {
        SlackBlockKit.ImageElement(
            altText: altText,
            imageUrl: URL(string: imageUrl)
        )
    }
}