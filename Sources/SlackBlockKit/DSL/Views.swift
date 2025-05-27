import Foundation

/// DSL component for Modal views
public struct Modal {
    let title: String
    let blocks: [BlockType]
    let close: String?
    let submit: String?
    let privateMetadata: String?
    let callbackId: String?
    let clearOnClose: Bool
    let notifyOnClose: Bool
    let externalId: String?
    
    public init(
        title: String,
        close: String? = "Close",
        submit: String? = nil,
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        clearOnClose: Bool = false,
        notifyOnClose: Bool = false,
        externalId: String? = nil,
        @BlockBuilder content: () -> [BlockType]
    ) {
        self.title = title
        self.blocks = content()
        self.close = close
        self.submit = submit
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.clearOnClose = clearOnClose
        self.notifyOnClose = notifyOnClose
        self.externalId = externalId
    }
    
    public func build() -> ModalView {
        ModalView(
            title: TextObject(type: .plainText, text: title, emoji: true),
            blocks: blocks,
            close: close.map { TextObject(type: .plainText, text: $0, emoji: true) },
            submit: submit.map { TextObject(type: .plainText, text: $0, emoji: true) },
            privateMetadata: privateMetadata,
            callbackId: callbackId,
            clearOnClose: clearOnClose,
            notifyOnClose: notifyOnClose,
            externalId: externalId
        )
    }
}

/// DSL component for Home tab views
public struct HomeTab {
    let blocks: [BlockType]
    let privateMetadata: String?
    let callbackId: String?
    let externalId: String?
    
    public init(
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        externalId: String? = nil,
        @BlockBuilder content: () -> [BlockType]
    ) {
        self.blocks = content()
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.externalId = externalId
    }
    
    public func build() -> HomeTabView {
        HomeTabView(
            blocks: blocks,
            privateMetadata: privateMetadata,
            callbackId: callbackId,
            externalId: externalId
        )
    }
}

/// Helper extensions for ViewType
extension ViewType {
    public static func modal(_ modal: Modal) -> ViewType {
        .modal(modal.build())
    }
    
    public static func home(_ home: HomeTab) -> ViewType {
        .homeTab(home.build())
    }
}
