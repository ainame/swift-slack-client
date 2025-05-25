#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Error/user`.
    public var user: Swift.String?
    /// Creates a new `_Error`.
    ///
    /// - Parameters:
    ///   - ok:
    ///   - error:
    ///   - user:
    public init(
        ok: Swift.Bool,
        error: Swift.String? = nil,
        user: Swift.String? = nil
    ) {
        self.ok = ok
        self.error = error
        self.user = user
    }
}
