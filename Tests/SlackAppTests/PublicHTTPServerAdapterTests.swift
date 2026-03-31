import SlackApp
import Testing

struct PublicHTTPServerAdapterTests {
    @Test func customHTTPServerAdapterCanBeUsedViaPublicAPI() async throws {
        let app = SlackApp(
            configuration: .init(token: "xoxb-test", signingSecret: "secret"),
            router: Router(),
            mode: .http(PublicCustomAdapter()),
        )

        try await app.run()
    }
}

private struct PublicCustomAdapter: HTTPServerAdapter {
    func run(
        handler _: @Sendable @escaping (HTTPServerRequest) async throws -> HTTPServerResponse,
    ) async throws {}
}
