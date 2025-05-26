public protocol SlackEvent: Decodable, Sendable, Hashable {
    var type: String { get }
}
