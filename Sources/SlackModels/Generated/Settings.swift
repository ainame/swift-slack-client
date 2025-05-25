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

/// - Remark: Generated from `#/components/schemas/Settings`.
public struct Settings: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Settings/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Settings/interactivity`.
    public var interactivity: SlackModels.Interactivity?
    /// - Remark: Generated from `#/components/schemas/Settings/longDescription`.
    public var longDescription: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Settings/backgroundColor`.
    public var backgroundColor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Settings/eventSubscriptions`.
    public var eventSubscriptions: SlackModels.EventSubscriptions?
    /// - Remark: Generated from `#/components/schemas/Settings/allowedIpAddressRanges`.
    public var allowedIpAddressRanges: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Settings/orgDeployEnabled`.
    public var orgDeployEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Settings/socketModeEnabled`.
    public var socketModeEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Settings/tokenRotationEnabled`.
    public var tokenRotationEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Settings/hermesAppType`.
    public var hermesAppType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Settings/functionRuntime`.
    public var functionRuntime: Swift.String?
    /// Creates a new `Settings`.
    ///
    /// - Parameters:
    ///   - description:
    ///   - interactivity:
    ///   - longDescription:
    ///   - backgroundColor:
    ///   - eventSubscriptions:
    ///   - allowedIpAddressRanges:
    ///   - orgDeployEnabled:
    ///   - socketModeEnabled:
    ///   - tokenRotationEnabled:
    ///   - hermesAppType:
    ///   - functionRuntime:
    public init(
        description: Swift.String? = nil,
        interactivity: SlackModels.Interactivity? = nil,
        longDescription: Swift.String? = nil,
        backgroundColor: Swift.String? = nil,
        eventSubscriptions: SlackModels.EventSubscriptions? = nil,
        allowedIpAddressRanges: [Swift.String]? = nil,
        orgDeployEnabled: Swift.Bool? = nil,
        socketModeEnabled: Swift.Bool? = nil,
        tokenRotationEnabled: Swift.Bool? = nil,
        hermesAppType: Swift.String? = nil,
        functionRuntime: Swift.String? = nil
    ) {
        self.description = description
        self.interactivity = interactivity
        self.longDescription = longDescription
        self.backgroundColor = backgroundColor
        self.eventSubscriptions = eventSubscriptions
        self.allowedIpAddressRanges = allowedIpAddressRanges
        self.orgDeployEnabled = orgDeployEnabled
        self.socketModeEnabled = socketModeEnabled
        self.tokenRotationEnabled = tokenRotationEnabled
        self.hermesAppType = hermesAppType
        self.functionRuntime = functionRuntime
    }
}
