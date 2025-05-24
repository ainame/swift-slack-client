import Foundation

public struct OptionObject: Codable {
    public let text: TextObject
    public let value: String
    public let description: TextObject?
    public let url: URL?
    
    public init(text: TextObject, value: String, description: TextObject? = nil, url: URL? = nil) {
        self.text = text
        self.value = value
        self.description = description
        self.url = url
    }
}