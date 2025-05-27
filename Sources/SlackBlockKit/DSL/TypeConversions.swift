import Foundation

// MARK: - Type Conversion Extensions

extension Button {
    public func toActionElement() -> ActionElementType {
        .button(self.render())
    }
    
    public func toSectionAccessory() -> SectionAccessory {
        .button(self.render())
    }
}

extension TextField {
    public func toInputElement() -> InputElementType {
        .plainTextInput(self.render())
    }
}

extension StaticSelect {
    public func toActionElement() -> ActionElementType {
        .staticSelect(self.render())
    }
    
    public func toInputElement() -> InputElementType {
        .staticSelect(self.render())
    }
    
    public func toSectionAccessory() -> SectionAccessory {
        .staticSelect(self.render())
    }
}

extension DatePicker {
    public func toActionElement() -> ActionElementType {
        .datePicker(self.render())
    }
    
    public func toInputElement() -> InputElementType {
        .datePicker(self.render())
    }
    
    public func toSectionAccessory() -> SectionAccessory {
        .datePicker(self.render())
    }
}

extension Checkboxes {
    public func toActionElement() -> ActionElementType {
        .checkboxes(self.render())
    }
    
    public func toInputElement() -> InputElementType {
        .checkboxes(self.render())
    }
    
    public func toSectionAccessory() -> SectionAccessory {
        .checkboxes(self.render())
    }
}

extension RadioButtons {
    public func toActionElement() -> ActionElementType {
        .radioButtons(self.render())
    }
    
    public func toInputElement() -> InputElementType {
        .radioButtons(self.render())
    }
    
    public func toSectionAccessory() -> SectionAccessory {
        .radioButtons(self.render())
    }
}

extension Text {
    public func toContextElement() -> ContextElementType {
        .text(self.render())
    }
}

extension Markdown {
    public func toContextElement() -> ContextElementType {
        .text(self.render())
    }
}

extension ContextImage {
    public func toContextElement() -> ContextElementType {
        .image(self.render())
    }
}

// MARK: - Protocol for type conversions

public protocol ActionElement {
    func toActionElement() -> ActionElementType
}

public protocol InputElement {
    func toInputElement() -> InputElementType
}

public protocol ContextElement {
    func toContextElement() -> ContextElementType
}

public protocol SectionAccessoryElement {
    func toSectionAccessory() -> SectionAccessory
}

// Conform DSL types to protocols
extension Button: ActionElement, SectionAccessoryElement {}
extension TextField: InputElement {}
extension StaticSelect: ActionElement, InputElement, SectionAccessoryElement {}
extension DatePicker: ActionElement, InputElement, SectionAccessoryElement {}
extension Checkboxes: ActionElement, InputElement, SectionAccessoryElement {}
extension RadioButtons: ActionElement, InputElement, SectionAccessoryElement {}
extension Text: ContextElement {}
extension Markdown: ContextElement {}
extension ContextImage: ContextElement {}