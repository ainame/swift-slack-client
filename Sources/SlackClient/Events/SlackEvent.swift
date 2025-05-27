public protocol SlackEvent: Decodable, Sendable, Hashable {
    var _type: String { get }
}
