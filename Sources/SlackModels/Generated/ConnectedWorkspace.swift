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

/// - Remark: Generated from `#/components/schemas/ConnectedWorkspace`.
public struct ConnectedWorkspace: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ConnectedWorkspace/workspaceId`.
    public var workspaceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ConnectedWorkspace/workspaceName`.
    public var workspaceName: Swift.String?
    /// Creates a new `ConnectedWorkspace`.
    ///
    /// - Parameters:
    ///   - workspaceId:
    ///   - workspaceName:
    public init(
        workspaceId: Swift.String? = nil,
        workspaceName: Swift.String? = nil
    ) {
        self.workspaceId = workspaceId
        self.workspaceName = workspaceName
    }
}
