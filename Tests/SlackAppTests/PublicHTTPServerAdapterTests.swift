import SlackApp
import Testing

struct PublicHTTPServerAdapterTests {
    @Test func `custom HTTP server adapter can be used via public API`() async throws {
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
        handler _: @escaping HTTPServerHandler,
    ) async throws {}
}
