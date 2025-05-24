public enum ViewType: Codable, Hashable {
    case modal(ModalView)
    case homeTab(HomeTabView)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)

        switch type {
        case "modal":
            self = .modal(try container.decode(ModalView.self))
        case "home":
            self = .homeTab(try container.decode(HomeTabView.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown view type: \(type)")
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .modal(let view):
            try container.encode(view)
        case .homeTab(let view):
            try container.encode(view)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}
