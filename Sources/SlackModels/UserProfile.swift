import Foundation

public struct UserProfile: Codable, Hashable, Sendable {
    public var name: Swift.String?
    public var team: Swift.String?
    public var firstName: Swift.String?
    public var realName: Swift.String?
    public var displayName: Swift.String?
    public var isRestricted: Swift.Bool?
    public var isUltraRestricted: Swift.Bool?
    public var avatarHash: Swift.String?
    public var image72: Swift.String?

    public init(
        name: Swift.String? = nil,
        team: Swift.String? = nil,
        firstName: Swift.String? = nil,
        realName: Swift.String? = nil,
        displayName: Swift.String? = nil,
        isRestricted: Swift.Bool? = nil,
        isUltraRestricted: Swift.Bool? = nil,
        avatarHash: Swift.String? = nil,
        image72: Swift.String? = nil
    ) {
        self.name = name
        self.team = team
        self.firstName = firstName
        self.realName = realName
        self.displayName = displayName
        self.isRestricted = isRestricted
        self.isUltraRestricted = isUltraRestricted
        self.avatarHash = avatarHash
        self.image72 = image72
    }
}
