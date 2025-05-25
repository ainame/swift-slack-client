#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Self/manualPresence`.
    public var manualPresence: Swift.String?
    /// Creates a new `_Self`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - prefs:
    ///   - created:
    ///   - firstLogin:
    ///   - manualPresence:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        prefs: Components.Schemas.SelfPrefs? = nil,
        created: Swift.Int? = nil,
        firstLogin: Swift.Int? = nil,
        manualPresence: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.prefs = prefs
        self.created = created
        self.firstLogin = firstLogin
        self.manualPresence = manualPresence
    }
}
