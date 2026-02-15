import Foundation
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
    func teamProfileGetResponseUsesTeamProfile() {
        #if WebAPI_Team
        let profile = TeamProfile(
            fields: [.init(fieldName: "department", type: "text")],
            sections: [.init(sectionType: "custom", label: "Default")],
        )
        let response = Components.Schemas.TeamProfileGetResponse(ok: true, profile: profile)
        #expect(response.profile?.fields?.first?.fieldName == "department")
        #endif
    }

    @Test
    func userProfileDecodesDocumentedFields() throws {
        let json = """
        {
            "title": "Engineer",
            "phone": "12345",
            "real_name": "Alice Example",
            "real_name_normalized": "Alice Example",
            "display_name": "alice",
            "display_name_normalized": "alice",
            "status_text": "In focus mode",
            "status_emoji": ":technologist:",
            "status_expiration": 1700000000,
            "avatar_hash": "hash",
            "image_24": "https://example.com/24.png",
            "image_72": "https://example.com/72.png",
            "image_512": "https://example.com/512.png",
            "email": "alice@example.com",
            "pronouns": "she/her",
            "huddle_state": "default",
            "huddle_state_expiration_ts": 1700000001,
            "fields": {
                "X123": {
                    "value": "remote",
                    "alt": "Remote",
                    "label": "Location"
                }
            },
            "status_emoji_display_info": [
                {
                    "emoji_name": "technologist",
                    "display_alias": ":technologist:",
                    "display_url": "https://example.com/emoji.png",
                    "unicode": "1F9D1-200D-1F4BB"
                }
            ]
        }
        """.data(using: .utf8)!

        let profile = try JSONDecoder().decode(UserProfile.self, from: json)
        #expect(profile.title == "Engineer")
        #expect(profile.realNameNormalized == "Alice Example")
        #expect(profile.displayNameNormalized == "alice")
        #expect(profile.statusExpiration == 1_700_000_000)
        #expect(profile.image24 == "https://example.com/24.png")
        #expect(profile.image512 == "https://example.com/512.png")
        #expect(profile.fields?["X123"]?.label == "Location")
        #expect(profile.statusEmojiDisplayInfo?.first?.emojiName == "technologist")
    }

    @Test
    func teamProfileDecodesDocumentedFields() throws {
        let json = """
        {
            "fields": [
                {
                    "id": "Xf01",
                    "section_id": "S01",
                    "field_name": "department",
                    "ordering": 100,
                    "label": "Department",
                    "hint": "Your team",
                    "type": "text",
                    "possible_values": ["Engineering"],
                    "options": {
                        "is_protected": false,
                        "is_scim": false
                    },
                    "is_hidden": false,
                    "is_inverse": false,
                    "permissions": {
                        "api": ["users.profile:write"],
                        "ui": true,
                        "scim": false
                    }
                }
            ],
            "sections": [
                {
                    "id": "S01",
                    "team_id": "T01",
                    "section_type": "default",
                    "label": "Profile",
                    "order": 1,
                    "is_hidden": false
                }
            ]
        }
        """.data(using: .utf8)!

        let profile = try JSONDecoder().decode(TeamProfile.self, from: json)
        #expect(profile.fields?.first?.fieldName == "department")
        #expect(profile.fields?.first?.options?.isProtected == false)
        #expect(profile.fields?.first?.permissions?.api?.first == "users.profile:write")
        #expect(profile.sections?.first?.sectionType == "default")
    }
}
