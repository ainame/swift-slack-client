import Foundation

/// DSL component for Section blocks
public struct Section: BlockComponent {
    let text: TextObject?
    let fields: [TextObject]?
    let accessory: SectionAccessory?
    
    public init(text: String? = nil, markdown: Bool = false, accessory: SectionAccessory? = nil) {
        if let text = text {
            self.text = TextObject(type: markdown ? .mrkdwn : .plainText, text: text)
        } else {
            self.text = nil
        }
        self.fields = nil
        self.accessory = accessory
    }
    
    public init(@TextBuilder text: () -> String, markdown: Bool = false, accessory: SectionAccessory? = nil) {
        let content = text()
        self.text = TextObject(type: markdown ? .mrkdwn : .plainText, text: content)
        self.fields = nil
        self.accessory = accessory
    }
    
    public init(fields: [String], markdown: Bool = false, accessory: SectionAccessory? = nil) {
        self.text = nil
        self.fields = fields.map { TextObject(type: markdown ? .mrkdwn : .plainText, text: $0) }
        self.accessory = accessory
    }
    
    // Convenience initializer with Button
    public init(text: String? = nil, markdown: Bool = false, accessory button: Button) {
        if let text = text {
            self.text = TextObject(type: markdown ? .mrkdwn : .plainText, text: text)
        } else {
            self.text = nil
        }
        self.fields = nil
        self.accessory = .button(button.render())
    }
    
    public func render() -> BlockType {
        let section = SectionBlock(
            text: text,
            fields: fields,
            accessory: accessory
        )
        return .section(section)
    }
}

/// DSL component for Divider blocks
public struct Divider: BlockComponent {
    public init() {}
    
    public func render() -> BlockType {
        .divider(DividerBlock())
    }
}

/// DSL component for Header blocks
public struct Header: BlockComponent {
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public func render() -> BlockType {
        .header(HeaderBlock(
            text: TextObject(type: .plainText, text: text, emoji: true)
        ))
    }
}

/// DSL component for Image blocks
public struct Image: BlockComponent {
    let imageUrl: String
    let altText: String
    let title: String?
    
    public init(url: String, alt: String, title: String? = nil) {
        self.imageUrl = url
        self.altText = alt
        self.title = title
    }
    
    public func render() -> BlockType {
        .image(ImageBlock(
            altText: altText,
            imageUrl: URL(string: imageUrl),
            title: title.map { TextObject(type: .plainText, text: $0) }
        ))
    }
}

/// DSL component for Context blocks
public struct Context: BlockComponent {
    let elements: [ContextElementType]
    
    public init(@ContextElementBuilder content: () -> [ContextElementType]) {
        self.elements = content()
    }
    
    public func render() -> BlockType {
        .context(ContextBlock(
            elements: elements
        ))
    }
}

/// DSL component for Actions blocks
public struct Actions: BlockComponent {
    let elements: [ActionElementType]
    
    public init(@ActionElementBuilder content: () -> [ActionElementType]) {
        self.elements = content()
    }
    
    public func render() -> BlockType {
        .actions(ActionsBlock(
            elements: elements
        ))
    }
}

/// DSL component for Input blocks
public struct Input: BlockComponent {
    let label: String
    let element: InputElementType
    let hint: String?
    let optional: Bool
    let dispatchAction: Bool
    
    public init(
        label: String,
        element: any InputElement,
        hint: String? = nil,
        optional: Bool = false,
        dispatchAction: Bool = false
    ) {
        self.label = label
        self.element = element.toInputElement()
        self.hint = hint
        self.optional = optional
        self.dispatchAction = dispatchAction
    }
    
    public func render() -> BlockType {
        .input(InputBlock(
            label: TextObject(type: .plainText, text: label),
            element: element,
            dispatchAction: dispatchAction,
            hint: hint.map { TextObject(type: .plainText, text: $0) },
            optional: optional
        ))
    }
}