import Foundation

// https://docs.slack.dev/reference/interaction-payloads
public struct InteractiveEnvelope: Decodable, Hashable, Sendable {
    public let type: String
    public let body: InteractivePayload

    enum CodingKeys: CodingKey {
        case type
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        self.type = type

        switch type {
        case "block_actions":
            self.body = .blockActions(try BlockActionsPaylaod(from: decoder))
        case "shortcut":
            self.body = .shortcut(try GlobalShortcutPayload(from: decoder))
        case "view_submission":
            self.body = .viewSubmission(try ViewSubmissionPayload(from: decoder))
        case "view_closed":
            self.body = .viewClosed(try ViewClosedPayload(from: decoder))
        default:
            self.body = .unsupported(type)
        }
    }
}
