import Foundation
import SlackBlockKit

/// Protocol for components that can render to BlockKit blocks
public protocol BlockComponent {
    /// Renders this component to its BlockKit representation
    func render() -> BlockType
}

/// Protocol for components that can be used inside blocks (elements)
public protocol BlockElement {
    /// The concrete element type this component renders to
    associatedtype Output: Codable

    /// Renders this element to its BlockKit representation
    func render() -> Output
}

/// Protocol for composition objects like Text
public protocol CompositionObject {
    /// The concrete object type this component renders to
    associatedtype Output: Codable

    /// Renders this object to its BlockKit representation
    func render() -> Output
}
