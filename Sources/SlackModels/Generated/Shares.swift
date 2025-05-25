#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Shares`.
public struct Shares: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Shares/public`.
    public var _public: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Shares/private`.
    public var _private: OpenAPIRuntime.OpenAPIObjectContainer?
    /// Creates a new `Shares`.
    ///
    /// - Parameters:
    ///   - _public:
    ///   - _private:
    public init(
        _public: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        _private: OpenAPIRuntime.OpenAPIObjectContainer? = nil
    ) {
        self._public = _public
        self._private = _private
    }
}
