import Foundation

public struct TriggerObject: Codable {
    public let url: URL
    public let customizableInputParameters: [InputParameter]?
    
    public init(url: URL, customizableInputParameters: [InputParameter]? = nil) {
        self.url = url
        self.customizableInputParameters = customizableInputParameters
    }
}

public struct InputParameter: Codable {
    public let name: String
    public let value: String
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}