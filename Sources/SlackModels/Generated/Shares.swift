@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Shares`.
public struct Shares: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Shares/private`.
    public var _private: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Shares/public`.
    public var _public: OpenAPIRuntime.OpenAPIObjectContainer?
    /// Creates a new `Shares`.
    ///
    /// - Parameters:
    ///   - _private:
    ///   - _public:
    public init(
        _private: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        _public: OpenAPIRuntime.OpenAPIObjectContainer? = nil
    ) {
        self._private = _private
        self._public = _public
    }
}
