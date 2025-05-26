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

/// - Remark: Generated from `#/components/schemas/Created`.
public struct Created: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Created/device_hardware`.
    public var deviceHardware: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/ip`.
    public var ip: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/os`.
    public var os: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/os_version`.
    public var osVersion: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/slack_client_version`.
    public var slackClientVersion: Swift.String?
    /// Creates a new `Created`.
    ///
    /// - Parameters:
    ///   - deviceHardware:
    ///   - ip:
    ///   - os:
    ///   - osVersion:
    ///   - slackClientVersion:
    public init(
        deviceHardware: Swift.String? = nil,
        ip: Swift.String? = nil,
        os: Swift.String? = nil,
        osVersion: Swift.String? = nil,
        slackClientVersion: Swift.String? = nil
    ) {
        self.deviceHardware = deviceHardware
        self.ip = ip
        self.os = os
        self.osVersion = osVersion
        self.slackClientVersion = slackClientVersion
    }
}
