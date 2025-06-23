import Foundation
import HTTPTypes
import OpenAPIRuntime

struct FormEncodingMiddleware: ClientMiddleware, Sendable {
    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        let transformedRequest = try await transformToFormEncoded(request, body: body)
        return try await next(transformedRequest.request, transformedRequest.body, baseURL)
    }
    
    private func transformToFormEncoded(_ request: HTTPRequest, body: HTTPBody?) async throws -> (request: HTTPRequest, body: HTTPBody?) {
        // Only transform POST requests with application/json content-type
        guard request.method == .post,
              let contentType = request.headerFields[.contentType],
              contentType.contains("application/json"),
              let body = body else {
            return (request, body)
        }
        
        // Read the JSON body
        let jsonData = try await Data(collecting: body, upTo: .max)
        
        // Parse JSON to extract fields
        guard let jsonObject = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            return (request, body)
        }
        
        // Convert to form-urlencoded
        let formData = try convertJSONToForm(jsonObject)
        let formBody = HTTPBody(Data(formData.utf8))
        
        // Update request headers
        var transformedRequest = request
        transformedRequest.headerFields[.contentType] = "application/x-www-form-urlencoded"
        
        return (transformedRequest, formBody)
    }
    
    private func convertJSONToForm(_ jsonObject: [String: Any]) throws -> String {
        var formComponents: [String] = []
        
        for (key, value) in jsonObject {
            let formValue: String
            
            if isNestedStructure(value) {
                // Convert nested objects/arrays to JSON strings
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                formValue = String(data: jsonData, encoding: .utf8) ?? ""
            } else if let stringValue = value as? String {
                formValue = stringValue
            } else if let numberValue = value as? NSNumber {
                formValue = numberValue.stringValue
            } else if let boolValue = value as? Bool {
                formValue = boolValue ? "true" : "false"
            } else {
                // Fallback: convert to JSON string
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                formValue = String(data: jsonData, encoding: .utf8) ?? ""
            }
            
            // URL encode both key and value
            let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? key
            let encodedValue = formValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? formValue
            
            formComponents.append("\(encodedKey)=\(encodedValue)")
        }
        
        return formComponents.joined(separator: "&")
    }
    
    private func isNestedStructure(_ value: Any) -> Bool {
        return value is [String: Any] || value is [Any]
    }
}