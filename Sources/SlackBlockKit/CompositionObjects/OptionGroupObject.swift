import Foundation

public struct OptionGroupObject: Codable, Hashable, Sendable {
    public let label: TextObject
    public let options: [OptionObject]

    public init(label: TextObject, options: [OptionObject]) {
        self.label = label
        self.options = options
    }
}
