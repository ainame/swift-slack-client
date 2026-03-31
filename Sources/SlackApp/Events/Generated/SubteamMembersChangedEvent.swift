#if Events
import Foundation

public struct SubteamMembersChangedEvent: SlackEvent {
    public var addedUsers: [Swift.String]?
    public var addedUsersCount: Swift.Int?
    public var datePreviousUpdate: Swift.Int?
    public var dateUpdate: Swift.Int?
    public var eventTs: Swift.String?
    public var removedUsers: [Swift.String]?
    public var removedUsersCount: Swift.Int?
    public var subteamId: Swift.String?
    public var teamId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case addedUsers = "added_users"
        case addedUsersCount = "added_users_count"
        case datePreviousUpdate = "date_previous_update"
        case dateUpdate = "date_update"
        case eventTs = "event_ts"
        case removedUsers = "removed_users"
        case removedUsersCount = "removed_users_count"
        case subteamId = "subteam_id"
        case teamId = "team_id"
        case _type = "type"
    }
}
#endif
