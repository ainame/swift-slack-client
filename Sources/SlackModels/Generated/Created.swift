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

/// - Remark: Generated from `#/components/schemas/Created`.
public struct Created: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Created/os`.
    public var os: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/ip`.
    public var ip: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/deviceHardware`.
    public var deviceHardware: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/osVersion`.
    public var osVersion: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Created/slackClientVersion`.
    public var slackClientVersion: Swift.String?
    /// Creates a new `Created`.
    ///
    /// - Parameters:
    ///   - os:
    ///   - ip:
    ///   - deviceHardware:
    ///   - osVersion:
    ///   - slackClientVersion:
    public init(
        os: Swift.String? = nil,
        ip: Swift.String? = nil,
        deviceHardware: Swift.String? = nil,
        osVersion: Swift.String? = nil,
        slackClientVersion: Swift.String? = nil
    ) {
        self.os = os
        self.ip = ip
        self.deviceHardware = deviceHardware
        self.osVersion = osVersion
        self.slackClientVersion = slackClientVersion
    }
}
