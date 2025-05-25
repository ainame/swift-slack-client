#if Events
import Foundation

public struct SubteamMembersChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var subteamId: Swift.String?
    public var teamId: Swift.String?
    public var datePreviousUpdate: Swift.Int?
    public var dateUpdate: Swift.Int?
    public var addedUsers: [Swift.String]?
    public var addedUsersCount: Swift.Int?
    public var removedUsers: [Swift.String]?
    public var removedUsersCount: Swift.Int?
    public var eventTs: Swift.String?
}
#endif
