@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/ConnectedWorkspace`.
public struct ConnectedWorkspace: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ConnectedWorkspace/workspace_id`.
    public var workspaceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ConnectedWorkspace/workspace_name`.
    public var workspaceName: Swift.String?
    /// Creates a new `ConnectedWorkspace`.
    ///
    /// - Parameters:
    ///   - workspaceId:
    ///   - workspaceName:
    public init(
        workspaceId: Swift.String? = nil,
        workspaceName: Swift.String? = nil,
    ) {
        self.workspaceId = workspaceId
        self.workspaceName = workspaceName
    }

    public enum CodingKeys: String, CodingKey {
        case workspaceId = "workspace_id"
        case workspaceName = "workspace_name"
    }
}
