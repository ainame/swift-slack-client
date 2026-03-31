#if SocketMode
import SlackClient

extension Slack {
    package func openSocketModeConnection() async throws -> String {
        await setToken(clientConfiguration.appToken)
        let result = try await client.appsConnectionsOpen(body: .json(.init()))
        await setToken(clientConfiguration.token)
        guard let url = try result.ok.body.json.url else {
            throw Error.genericError("invalid response body - no url found")
        }
        return url
    }
}
#endif
