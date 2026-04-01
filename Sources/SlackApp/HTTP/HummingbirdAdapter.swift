#if HummingbirdHTTPAdapter
import Foundation
import HTTPTypes
import Hummingbird
import NIOCore
import NIOFoundationCompat

public struct HummingbirdAdapter: HTTPServerAdapter {
    private let hostname: String
    private let port: Int

    public init(hostname: String = "0.0.0.0", port: Int = 8080) {
        self.hostname = hostname
        self.port = port
    }

    public func run(handler: @Sendable @escaping (HTTPServerRequest) async throws -> HTTPServerResponse) async throws {
        let router = Hummingbird.Router()
        router.get("/healthz") { _, _ -> Response in
            Response(status: .ok)
        }
        router.post("/slack/events") { request, _ -> Response in
            let bodyBuffer = try await request.body.collect(upTo: 4 * 1024 * 1024)
            let response = try await handler(
                HTTPServerRequest(
                    method: request.method,
                    path: request.uri.path,
                    headerFields: request.headers,
                    body: Foundation.Data(bodyBuffer.readableBytesView),
                ),
            )
            return makeResponse(from: response)
        }
        router.post("/slack/interactive-endpoint") { request, _ -> Response in
            let bodyBuffer = try await request.body.collect(upTo: 4 * 1024 * 1024)
            let response = try await handler(
                HTTPServerRequest(
                    method: request.method,
                    path: request.uri.path,
                    headerFields: request.headers,
                    body: Foundation.Data(bodyBuffer.readableBytesView),
                ),
            )
            return makeResponse(from: response)
        }

        let app = Application(
            router: router,
            configuration: .init(address: .hostname(hostname, port: port)),
        )
        try await app.run()
    }

    private func makeResponse(from response: HTTPServerResponse) -> Response {
        return Response(
            status: response.status,
            headers: response.headerFields,
            body: response.body.map { .init(byteBuffer: ByteBuffer(data: $0)) } ?? .init(),
        )
    }
}
#endif
