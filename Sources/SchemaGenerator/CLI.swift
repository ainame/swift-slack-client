import ArgumentParser
import Foundation

@main
struct SchemaGenerator: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "SchemaGenerator",
        abstract: "Generate Swift DTOs from the Slack JSON schema."
    )

    @Argument(help: "Path to the slack-api-ref repository")
    var slackApiRefPath: String

    func run() throws {
        // Derive the schema/methods paths
        let schemasPath = URL(fileURLWithPath: slackApiRefPath)
                            .appendingPathComponent("schemas").path
        let methodsPath = URL(fileURLWithPath: slackApiRefPath)
                             .appendingPathComponent("methods").path
        // Emit into the current working directory
        let outputPath = FileManager.default.currentDirectoryPath

        print("Generating from \(schemasPath) and \(methodsPath) -> \(outputPath)")
        // TODO: add your JSON-parsing & Swift-code-emission logic here
        let fileManager = FileManager.default
        let schemasURL = URL(fileURLWithPath: schemasPath)
        let methodsURL = URL(fileURLWithPath: methodsPath)

        // Process schema files
        guard let schemaFiles = try? fileManager.contentsOfDirectory(atPath: schemasPath)
                .filter({ $0.hasSuffix(".json") }) else {
            print("No schema files found at \(schemasPath)")
            return
        }
        for file in schemaFiles {
            let filePath = schemasURL.appendingPathComponent(file).path
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            try processSchema(data: data, fileName: file)
        }

        // Process method files
        guard let methodFiles = try? fileManager.contentsOfDirectory(atPath: methodsPath)
                .filter({ $0.hasSuffix(".json") }) else {
            print("No method files found at \(methodsPath)")
            return
        }
        for file in methodFiles {
            let filePath = methodsURL.appendingPathComponent(file).path
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            try processMethod(data: data, fileName: file)
        }
    }
}

func processSchema(data: Data, fileName: String) throws {
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else { return }
    let title = dict["title"] as? String ?? fileName.replacingOccurrences(of: ".json", with: "")
    guard let properties = dict["properties"] as? [String: Any] else { return }
    let required = dict["required"] as? [String] ?? []

    func swiftType(from jsonType: Any) -> String {
        if let typeStr = jsonType as? String {
            switch typeStr {
                case "string": return "String"
                case "integer": return "Int"
                case "boolean": return "Bool"
                case "array": return "[Any]"
                default: return "Any"
            }
        }
        return "Any"
    }

    func capitalizeSegments(_ name: String) -> String {
        return name.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .map { $0.prefix(1).uppercased() + $0.dropFirst() }
            .joined()
    }

    let structName = capitalizeSegments(title)

    var structString = "struct \(structName): Codable {\n"
    for (propName, propValue) in properties {
        if let propDict = propValue as? [String: Any],
           let type = propDict["type"] {
            let swiftTypeName = swiftType(from: type)
            let isRequired = required.contains(propName)
            let optionalMark = isRequired ? "" : "?"
            structString += "    let \(propName): \(swiftTypeName)\(optionalMark)\n"
        } else {
            structString += "    let \(propName): Any?\n"
        }
    }
    structString += "}\n"

    let fileManager = FileManager.default
    let currentDir = fileManager.currentDirectoryPath
    let schemasDir = URL(fileURLWithPath: currentDir).appendingPathComponent("Schemas")
    try fileManager.createDirectory(at: schemasDir, withIntermediateDirectories: true, attributes: nil)
    let fileURL = schemasDir.appendingPathComponent("\(structName).swift")
    try structString.write(to: fileURL, atomically: true, encoding: .utf8)
}

func processMethod(data: Data, fileName: String) throws {
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any],
          let name = dict["name"] as? String else { return }
    let arguments = dict["arguments"] as? [[String: Any]] ?? []

    func swiftType(from jsonType: Any) -> String {
        if let typeStr = jsonType as? String {
            switch typeStr {
                case "string": return "String"
                case "integer": return "Int"
                case "boolean": return "Bool"
                case "array": return "[Any]"
                default: return "Any"
            }
        }
        return "Any"
    }

    func capitalizeSegments(_ name: String) -> String {
        return name.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .map { $0.prefix(1).uppercased() + $0.dropFirst() }
            .joined()
    }

    let baseName = capitalizeSegments(name)

    var requestStruct = "struct \(baseName)Request: Codable {\n"
    for arg in arguments {
        if let argName = arg["name"] as? String,
           let argType = arg["type"] {
            let swiftTypeName = swiftType(from: argType)
            requestStruct += "    let \(argName): \(swiftTypeName)\n"
        }
    }
    requestStruct += "}\n"

    let responseStruct = """
    struct \(baseName)Response: Codable {
        let ok: Bool
        let error: String?
    }
    """

    let fileManager = FileManager.default
    let currentDir = fileManager.currentDirectoryPath
    let methodsDir = URL(fileURLWithPath: currentDir).appendingPathComponent("Methods")
    try fileManager.createDirectory(at: methodsDir, withIntermediateDirectories: true, attributes: nil)

    let requestURL = methodsDir.appendingPathComponent("\(baseName)Request.swift")
    try requestStruct.write(to: requestURL, atomically: true, encoding: .utf8)

    let responseURL = methodsDir.appendingPathComponent("\(baseName)Response.swift")
    try responseStruct.write(to: responseURL, atomically: true, encoding: .utf8)
}
