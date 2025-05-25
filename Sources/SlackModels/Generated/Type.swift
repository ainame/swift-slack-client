@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Type`.
public struct _Type: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Type/value1`.
    public var value1: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Type/value2`.
    public var value2: Swift.String?
    /// Creates a new `_Type`.
    ///
    /// - Parameters:
    ///   - value1:
    ///   - value2:
    public init(
        value1: Swift.Bool? = nil,
        value2: Swift.String? = nil
    ) {
        self.value1 = value1
        self.value2 = value2
    }
    public init(from decoder: any Decoder) throws {
        var errors: [any Error] = []
        do {
            self.value1 = try decoder.decodeFromSingleValueContainer()
        } catch {
            errors.append(error)
        }
        do {
            self.value2 = try decoder.decodeFromSingleValueContainer()
        } catch {
            errors.append(error)
        }
        try Swift.DecodingError.verifyAtLeastOneSchemaIsNotNil(
            [
                self.value1,
                self.value2
            ],
            type: Self.self,
            codingPath: decoder.codingPath,
            errors: errors
        )
    }
    public func encode(to encoder: any Encoder) throws {
        try encoder.encodeFirstNonNilValueToSingleValueContainer([
            self.value1,
            self.value2
        ])
    }
}
