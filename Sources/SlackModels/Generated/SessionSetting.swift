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

/// - Remark: Generated from `#/components/schemas/SessionSetting`.
public struct SessionSetting: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SessionSetting/duration`.
    public var duration: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SessionSetting/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SessionSetting/desktopAppBrowserQuit`.
    public var desktopAppBrowserQuit: Swift.Bool?
    /// Creates a new `SessionSetting`.
    ///
    /// - Parameters:
    ///   - duration:
    ///   - userId:
    ///   - desktopAppBrowserQuit:
    public init(
        duration: Swift.Int? = nil,
        userId: Swift.String? = nil,
        desktopAppBrowserQuit: Swift.Bool? = nil
    ) {
        self.duration = duration
        self.userId = userId
        self.desktopAppBrowserQuit = desktopAppBrowserQuit
    }
}
