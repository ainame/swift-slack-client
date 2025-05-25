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
