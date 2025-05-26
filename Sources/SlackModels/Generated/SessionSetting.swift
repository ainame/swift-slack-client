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
    /// - Remark: Generated from `#/components/schemas/SessionSetting/desktop_app_browser_quit`.
    public var desktopAppBrowserQuit: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SessionSetting/duration`.
    public var duration: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SessionSetting/user_id`.
    public var userId: Swift.String?
    /// Creates a new `SessionSetting`.
    ///
    /// - Parameters:
    ///   - desktopAppBrowserQuit:
    ///   - duration:
    ///   - userId:
    public init(
        desktopAppBrowserQuit: Swift.Bool? = nil,
        duration: Swift.Int? = nil,
        userId: Swift.String? = nil
    ) {
        self.desktopAppBrowserQuit = desktopAppBrowserQuit
        self.duration = duration
        self.userId = userId
    }
    public enum CodingKeys: String, CodingKey {
        case desktopAppBrowserQuit = "desktop_app_browser_quit"
        case duration
        case userId = "user_id"
    }
}
