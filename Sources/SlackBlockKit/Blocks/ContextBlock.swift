import Foundation

public struct ContextBlock: Codable {
    public let type: String // "context"
    public let elements: [ContextElement]
    public let blockId: String?
    
    public init(elements: [ContextElement], blockId: String? = nil) {
        self.type = "context"
        self.elements = elements
        self.blockId = blockId
    }
}

// Protocol for elements that can be used in Context block
public protocol ContextElement: Codable {
    var type: String { get }
}

// Extend applicable elements to conform to ContextElement
extension TextObject: ContextElement {}
extension ImageElement: ContextElement {}