import Foundation

/// Result builder for constructing arrays of blocks
@resultBuilder
public struct BlockBuilder {
    public static func buildBlock() -> [BlockType] {
        []
    }
    
    // Handle arrays of BlockType (which is what gets passed from buildExpression)
    public static func buildBlock(_ components: [BlockType]...) -> [BlockType] {
        components.flatMap { $0 }
    }
    
    // Handle single BlockComponent  
    public static func buildBlock<C: BlockComponent>(_ component: C) -> [BlockType] where C.Output == BlockType {
        [component.render()]
    }
    
    // Handle multiple BlockComponents
    public static func buildBlock(_ first: any BlockComponent, _ rest: any BlockComponent...) -> [BlockType] {
        var result: [BlockType] = []
        if let blockType = first.render() as? BlockType {
            result.append(blockType)
        }
        for component in rest {
            if let blockType = component.render() as? BlockType {
                result.append(blockType)
            }
        }
        return result
    }
    
    public static func buildArray(_ components: [[BlockType]]) -> [BlockType] {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: [BlockType]?) -> [BlockType] {
        component ?? []
    }
    
    public static func buildEither(first component: [BlockType]) -> [BlockType] {
        component
    }
    
    public static func buildEither(second component: [BlockType]) -> [BlockType] {
        component
    }
    
    public static func buildExpression<C: BlockComponent>(_ expression: C) -> [BlockType] where C.Output == BlockType {
        [expression.render()]
    }
}

/// Result builder for constructing arrays of action elements
@resultBuilder
public struct ActionElementBuilder {
    public static func buildBlock() -> [ActionElementType] {
        []
    }
    
    // Handle arrays of ActionElementType (from buildExpression)
    public static func buildBlock(_ components: [ActionElementType]...) -> [ActionElementType] {
        components.flatMap { $0 }
    }
    
    // Handle single ActionElement
    public static func buildBlock(_ element: any ActionElement) -> [ActionElementType] {
        [element.toActionElement()]
    }
    
    // Handle multiple ActionElements
    public static func buildBlock(_ elements: any ActionElement...) -> [ActionElementType] {
        elements.map { $0.toActionElement() }
    }
    
    public static func buildArray(_ components: [[ActionElementType]]) -> [ActionElementType] {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: [ActionElementType]?) -> [ActionElementType] {
        component ?? []
    }
    
    public static func buildEither(first component: [ActionElementType]) -> [ActionElementType] {
        component
    }
    
    public static func buildEither(second component: [ActionElementType]) -> [ActionElementType] {
        component
    }
    
    public static func buildExpression(_ expression: any ActionElement) -> [ActionElementType] {
        [expression.toActionElement()]
    }
}

/// Result builder for constructing arrays of context elements
@resultBuilder
public struct ContextElementBuilder {
    public static func buildBlock() -> [ContextElementType] {
        []
    }
    
    // Handle arrays of ContextElementType (from buildExpression)
    public static func buildBlock(_ components: [ContextElementType]...) -> [ContextElementType] {
        components.flatMap { $0 }
    }
    
    // Handle single ContextElement
    public static func buildBlock(_ element: any ContextElement) -> [ContextElementType] {
        [element.toContextElement()]
    }
    
    // Handle multiple ContextElements
    public static func buildBlock(_ elements: any ContextElement...) -> [ContextElementType] {
        elements.map { $0.toContextElement() }
    }
    
    public static func buildArray(_ components: [[ContextElementType]]) -> [ContextElementType] {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: [ContextElementType]?) -> [ContextElementType] {
        component ?? []
    }
    
    public static func buildEither(first component: [ContextElementType]) -> [ContextElementType] {
        component
    }
    
    public static func buildEither(second component: [ContextElementType]) -> [ContextElementType] {
        component
    }
    
    public static func buildExpression(_ expression: any ContextElement) -> [ContextElementType] {
        [expression.toContextElement()]
    }
}

/// Result builder for text content
@resultBuilder
public struct TextBuilder {
    public static func buildBlock() -> String {
        ""
    }
    
    public static func buildBlock(_ components: String...) -> String {
        components.joined()
    }
    
    public static func buildArray(_ components: [String]) -> String {
        components.joined()
    }
    
    public static func buildOptional(_ component: String?) -> String {
        component ?? ""
    }
    
    public static func buildEither(first component: String) -> String {
        component
    }
    
    public static func buildEither(second component: String) -> String {
        component
    }
}