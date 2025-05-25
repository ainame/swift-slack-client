#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/Icons`.
public struct Icons: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Icons/image36`.
    public var image36: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icons/image48`.
    public var image48: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Icons/image72`.
    public var image72: Swift.String?
    /// Creates a new `Icons`.
    ///
    /// - Parameters:
    ///   - image36:
    ///   - image48:
    ///   - image72:
    public init(
        image36: Swift.String? = nil,
        image48: Swift.String? = nil,
        image72: Swift.String? = nil
    ) {
        self.image36 = image36
        self.image48 = image48
        self.image72 = image72
    }
}
