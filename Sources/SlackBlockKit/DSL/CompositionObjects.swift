import Foundation

/// DSL component for plain text
public struct Text: CompositionObject {
    let content: String
    let emoji: Bool
    
    public init(_ content: String, emoji: Bool = true) {
        self.content = content
        self.emoji = emoji
    }
    
    public func render() -> TextObject {
        TextObject(type: .plainText, text: content, emoji: emoji)
    }
}

/// DSL component for markdown text
public struct Markdown: CompositionObject {
    let content: String
    let verbatim: Bool
    
    public init(_ content: String, verbatim: Bool = false) {
        self.content = content
        self.verbatim = verbatim
    }
    
    public func render() -> TextObject {
        TextObject(type: .mrkdwn, text: content, verbatim: verbatim)
    }
}

/// DSL component for confirmation dialogs
public struct Confirm: CompositionObject {
    let title: String
    let text: String
    let confirm: String
    let deny: String
    let style: ConfirmationStyle?
    
    public init(
        title: String,
        text: String,
        confirm: String = "Yes",
        deny: String = "No",
        style: ConfirmationStyle? = nil
    ) {
        self.title = title
        self.text = text
        self.confirm = confirm
        self.deny = deny
        self.style = style
    }
    
    public func render() -> ConfirmationDialogObject {
        ConfirmationDialogObject(
            title: TextObject(type: .plainText, text: title),
            text: TextObject(type: .plainText, text: text),
            confirm: TextObject(type: .plainText, text: confirm),
            deny: TextObject(type: .plainText, text: deny),
            style: style
        )
    }
}

/// DSL component for options
public struct Option: CompositionObject {
    let text: String
    let value: String
    let description: String?
    let url: String?
    
    public init(
        _ text: String,
        value: String,
        description: String? = nil,
        url: String? = nil
    ) {
        self.text = text
        self.value = value
        self.description = description
        self.url = url
    }
    
    public func render() -> OptionObject {
        OptionObject(
            text: TextObject(type: .plainText, text: text),
            value: value,
            description: description.map { TextObject(type: .plainText, text: $0) },
            url: url.flatMap { URL(string: $0) }
        )
    }
}