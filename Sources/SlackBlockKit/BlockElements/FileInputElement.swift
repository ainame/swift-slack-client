import Foundation

public struct FileInputElement: Codable {
    public let type: String = "file_input"
    public let actionId: String
    public let filetypes: [String]?
    public let maxFiles: Int?
    
    public init(
        actionId: String,
        filetypes: [String]? = nil,
        maxFiles: Int? = nil
    ) {
        self.actionId = actionId
        self.filetypes = filetypes
        self.maxFiles = maxFiles
    }
}