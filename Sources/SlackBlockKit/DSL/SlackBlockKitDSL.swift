import Foundation

// Re-export all DSL components for easy import
public typealias SlackBlockKitDSL = (
    // Blocks
    Section,
    Divider,
    Header,
    Image,
    Context,
    Actions,
    Input,
    
    // Elements
    Button,
    TextField,
    StaticSelect,
    DatePicker,
    Checkboxes,
    RadioButtons,
    ContextImage,
    
    // Composition Objects
    Text,
    Markdown,
    Confirm,
    Option,
    
    // Views
    Modal,
    HomeTab
)

/// Extension to make building views more convenient
extension ViewType {
    /// Build a modal view using DSL
    public static func modal(
        title: String,
        close: String? = "Close",
        submit: String? = nil,
        @BlockBuilder content: () -> [BlockType]
    ) -> ViewType {
        let modal = Modal(
            title: title,
            close: close,
            submit: submit,
            content: content
        )
        return .modal(modal.build())
    }
    
    /// Build a home tab view using DSL
    public static func home(
        @BlockBuilder content: () -> [BlockType]
    ) -> ViewType {
        let home = HomeTab(content: content)
        return .homeTab(home.build())
    }
}