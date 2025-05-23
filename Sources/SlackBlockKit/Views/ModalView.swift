import Foundation

public struct ModalView: Codable, Hashable, Sendable {
    public let type: String // "modal"
    public let title: TextObject
    public let blocks: [BlockType]
    public let close: TextObject?
    public let submit: TextObject?
    public let privateMetadata: String?
    public let callbackId: String?
    public let clearOnClose: Bool?
    public let notifyOnClose: Bool?
    public let externalId: String?
    public let submitDisabled: Bool?
    
    public init(
        title: TextObject,
        blocks: [BlockType],
        close: TextObject? = nil,
        submit: TextObject? = nil,
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        clearOnClose: Bool? = nil,
        notifyOnClose: Bool? = nil,
        externalId: String? = nil,
        submitDisabled: Bool? = nil
    ) {
        self.type = "modal"
        self.title = title
        self.blocks = blocks
        self.close = close
        self.submit = submit
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.clearOnClose = clearOnClose
        self.notifyOnClose = notifyOnClose
        self.externalId = externalId
        self.submitDisabled = submitDisabled
    }
}
