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
                let fileName = URL(fileURLWithPath: relativePath).lastPathComponent
                try processMethod(data: data, fileName: fileName, outputBaseURL: baseOutputURL)
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
    let schemasDir = outputBaseURL.appendingPathComponent("Schemas")
    try fileManager.createDirectory(at: schemasDir, withIntermediateDirectories: true, attributes: nil)
    let fileURL = schemasDir.appendingPathComponent("\(structName).swift")
    try structString.write(to: fileURL, atomically: true, encoding: .utf8)

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
                    defStructString += "    let \(propName): Any?\n"
                }
            }
            defStructString += "}\n"

            let defFileURL = schemasDir.appendingPathComponent("\(defStructName).swift")
            try defStructString.write(to: defFileURL, atomically: true, encoding: .utf8)
        }
    }
}

func processMethod(data: Data, fileName: String, outputBaseURL: URL) throws {
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else { return }
    // Determine method title and request schema
    let title = dict["title"] as? String ?? fileName.replacingOccurrences(of: ".json", with: "")
    let properties = dict["properties"] as? [String: Any] ?? [:]
    let requiredParams = dict["required"] as? [String] ?? []

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

    let baseName = capitalizeSegments(title)

    // Build the Request struct from parameter properties
    var requestStruct = "struct \(baseName)Request: Codable {\n"
    for (paramName, paramValue) in properties {
        if let paramDict = paramValue as? [String: Any],
           let type = paramDict["type"] {
            let swiftTypeName = swiftType(from: type)
            let isRequired = requiredParams.contains(paramName)
            let optionalMark = isRequired ? "" : "?"
            requestStruct += "    let \(paramName): \(swiftTypeName)\(optionalMark)\n"
        } else {
            requestStruct += "    let \(paramName): Any?\n"
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
    let methodsDir = outputBaseURL.appendingPathComponent("Methods")
    try fileManager.createDirectory(at: methodsDir, withIntermediateDirectories: true, attributes: nil)

    let requestURL = methodsDir.appendingPathComponent("\(baseName)Request.swift")
    try requestStruct.write(to: requestURL, atomically: true, encoding: .utf8)

    let responseURL = methodsDir.appendingPathComponent("\(baseName)Response.swift")
    try responseStruct.write(to: responseURL, atomically: true, encoding: .utf8)
}
