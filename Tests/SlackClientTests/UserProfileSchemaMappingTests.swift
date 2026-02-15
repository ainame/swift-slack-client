@testable import SlackClient
import SlackModels
import Testing

struct UserProfileSchemaMappingTests {
    @Test
    func userShapedSchemasUseUserProfile() {
        let userProfile = UserProfile(displayName: "alice")

        let user = User(profile: userProfile)
        #expect(user.profile?.displayName == "alice")

        let member = Member(profile: userProfile)
        #expect(member.profile?.displayName == "alice")

        let invitingUser = InvitingUser(profile: userProfile)
        #expect(invitingUser.profile?.displayName == "alice")

        let tingUser = TingUser(profile: userProfile)
        #expect(tingUser.profile?.displayName == "alice")
    }

    @Test
    func nonUserProfileContextsStillUseProfile() {
        #if WebAPI_Team
        let profile = Profile(avatarHash: "abc")
        let response = Components.Schemas.TeamProfileGetResponse(ok: true, profile: profile)
        #expect(response.profile?.avatarHash == "abc")
        #endif
    }
}
