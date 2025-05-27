import Foundation

public struct FileInputElement: Codable, Hashable, Sendable {
    public let type: String // "file_input"
    public let actionId: String
    public let filetypes: [String]?
    public let maxFiles: Int?
    
    public init(
        actionId: String,
        filetypes: [String]? = nil,
        maxFiles: Int? = nil
    ) {
        self.type = "file_input"
        self.actionId = actionId
        self.filetypes = filetypes
        self.maxFiles = maxFiles
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case filetypes
        case maxFiles = "max_files"
    }
}
