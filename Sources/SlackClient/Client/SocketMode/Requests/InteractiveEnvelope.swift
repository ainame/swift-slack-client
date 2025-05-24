import Foundation

// https://docs.slack.dev/reference/interaction-payloads
public struct InteractiveEnvelope: Decodable, Sendable {
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
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(BlockActionsPaylaod.self)
            self.body = .blockActions(payload)
        case "shortcut":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(GlobalShortcutPayload.self)
            self.body = .shortcut(payload)
        case "view_submission":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(ViewSubmissionPayload.self)
            self.body = .viewSubmission(payload)
        case "view_closed":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(ViewClosedPayload.self)
            self.body = .viewClosed(payload)
        default:
            self.body = .unsupported(type)
        }
    }
}
