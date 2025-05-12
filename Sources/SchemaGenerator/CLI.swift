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

    @Option(name: .shortAndLong, help: "Output directory for generated Swift files")
    var outputPath: String

    func run() throws {
        // Derive the schema/methods paths
        let schemasPath = URL(fileURLWithPath: slackApiRefPath)
                            .appendingPathComponent("schemas").path
        let methodsPath = URL(fileURLWithPath: slackApiRefPath)
                             .appendingPathComponent("methods").path
        print("Generating from \(schemasPath) and \(methodsPath) -> \(outputPath)")
        // Use the provided output directory
        let baseOutputURL = URL(fileURLWithPath: outputPath)
        // TODO: add your JSON-parsing & Swift-code-emission logic here
        let fileManager = FileManager.default
        let schemasURL = URL(fileURLWithPath: schemasPath)
        let methodsURL = URL(fileURLWithPath: methodsPath)

        // Process schema files recursively
        if let enumerator = fileManager.enumerator(atPath: schemasPath) {
            for case let relativePath as String in enumerator where relativePath.hasSuffix(".json") {
                let fileURL = schemasURL.appendingPathComponent(relativePath)
                let data = try Data(contentsOf: fileURL)
                let fileName = URL(fileURLWithPath: relativePath).lastPathComponent
                try processSchema(data: data, fileName: fileName, outputBaseURL: baseOutputURL)
            }
        } else {
            print("Unable to enumerate schemas at \(schemasPath)")
            return
        }

        // Process method files recursively
        if let enumerator = fileManager.enumerator(atPath: methodsPath) {
            for case let relativePath as String in enumerator where relativePath.hasSuffix(".json") {
                let fileURL = methodsURL.appendingPathComponent(relativePath)
                let data = try Data(contentsOf: fileURL)
                try processMethod(data: data, relativePath: relativePath, outputBaseURL: baseOutputURL)
            }
        } else {
            print("Unable to enumerate methods at \(methodsPath)")
            return
        }
    }
}

func processSchema(data: Data, fileName: String, outputBaseURL: URL) throws {
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
                case "array": return "[String]"
                default: return "String"
            }
        }
        return "String"
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
            structString += "    let \(propName): String?\n"
        }
    }
    structString += "}\n"

    let fileManager = FileManager.default
    let schemasDir = outputBaseURL.appendingPathComponent("Schemas")
    try fileManager.createDirectory(at: schemasDir, withIntermediateDirectories: true, attributes: nil)
    let fileURL = schemasDir.appendingPathComponent("\(structName).swift")
    try structString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)

    // Generate structs for any nested definitions
    if let definitions = dict["definitions"] as? [String: Any] {
        for (defName, defValue) in definitions {
            guard let defDict = defValue as? [String: Any] else { continue }
            let subProperties = defDict["properties"] as? [String: Any] ?? [:]
            let subRequired = defDict["required"] as? [String] ?? []
            let defStructName = capitalizeSegments(defName)

            var defStructString = "struct \(defStructName): Codable {\n"
            for (propName, propValue) in subProperties {
                if let propDict = propValue as? [String: Any],
                   let type = propDict["type"] {
                    let swiftTypeName = swiftType(from: type)
                    let isRequired = subRequired.contains(propName)
                    let optionalMark = isRequired ? "" : "?"
                    defStructString += "    let \(propName): \(swiftTypeName)\(optionalMark)\n"
                } else {
                    defStructString += "    let \(propName): String?\n"
                }
            }
            defStructString += "}\n"

            let defFileURL = schemasDir.appendingPathComponent("\(defStructName).swift")
            try defStructString.write(to: defFileURL, atomically: true, encoding: String.Encoding.utf8)
        }
    }
}

func processMethod(data: Data, relativePath: String, outputBaseURL: URL) throws {
    let fileName = URL(fileURLWithPath: relativePath).lastPathComponent
    let groupFolder = URL(fileURLWithPath: relativePath)
                        .deletingLastPathComponent()
                        .lastPathComponent

    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else { return }
    let title = dict["title"] as? String ?? fileName.replacingOccurrences(of: ".json", with: "")
    // Use the "args" object from Slack API definitions
    let argsDict = dict["args"] as? [String: Any] ?? [:]

    func swiftType(from jsonType: Any) -> String {
        if let typeStr = jsonType as? String {
            switch typeStr {
                case "string": return "String"
                case "integer": return "Int"
                case "boolean": return "Bool"
                case "array": return "[String]"
                default: return "String"
            }
        }
        return "String"
    }

    // Convert snake_case to camelCase
    func camelCase(_ snake: String) -> String {
        let parts = snake.split(separator: "_")
        let first = parts.first?.lowercased() ?? ""
        let rest = parts.dropFirst().map { $0.prefix(1).uppercased() + $0.dropFirst() }.joined()
        return first + rest
    }

    func capitalizeSegments(_ name: String) -> String {
        return name.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .map { $0.prefix(1).uppercased() + $0.dropFirst() }
            .joined()
    }

    let baseName = capitalizeSegments(title)

    // Build the Request struct with camelCase properties
    var requestStruct = "struct \(baseName)Request: Encodable {\n"
    for (paramName, paramValue) in argsDict {
        if let paramDict = paramValue as? [String: Any],
           let type = paramDict["type"] {
            let swiftTypeName = swiftType(from: type)
            let isRequired = (paramDict["required"] as? Bool) ?? false
            let optionalMark = isRequired ? "" : "?"
            let propName = camelCase(paramName)
            requestStruct += "    let \(propName): \(swiftTypeName)\(optionalMark)\n"
        } else {
            let propName = camelCase(paramName)
            requestStruct += "    let \(propName): String?\n"
        }
    }
    requestStruct += "}\n"

    let responseStruct = """
    struct \(baseName)Response: Decodable {
        let ok: Bool
        let error: String?
    }
    """

    let fileManager = FileManager.default
    // Build Methods/<GroupName> (e.g. Methods/Chat)
    var methodsDir = outputBaseURL.appendingPathComponent("Methods")
    if !groupFolder.isEmpty {
        methodsDir = methodsDir.appendingPathComponent(capitalizeSegments(groupFolder))
    }
    try fileManager.createDirectory(at: methodsDir, withIntermediateDirectories: true, attributes: nil)

    let requestURL = methodsDir.appendingPathComponent("\(baseName)Request.swift")
    try requestStruct.write(to: requestURL, atomically: true, encoding: String.Encoding.utf8)

    let responseURL = methodsDir.appendingPathComponent("\(baseName)Response.swift")
    try responseStruct.write(to: responseURL, atomically: true, encoding: String.Encoding.utf8)
}
