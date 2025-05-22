import Foundation
import HTTPTypes
import OpenAPIRuntime
import Logging

#if SocketMode
import NIOCore
import WSClient
#endif

#if SocketMode
extension Slack {
    public func startSocketMode() async throws {
        try await doStartSocketMode()
    }

    enum SocketMode {
        case notReady
        case ready(WebSocketOutboundWriter)

        var writer: WebSocketOutboundWriter? {
            switch self {
            case .ready(let writer):
                return writer
            case .notReady:
                return nil
            }
        }
    }

    func send(_ payload: Encodable) async throws {
        let data = try jsonEncoder.encode(payload)
        try await socketMode.writer?.write(.text(String(decoding: data, as: UTF8.self)))
    }

    func doStartSocketMode() async throws {
        let result = try await client.appsConnectionsOpen(body: .json(.init()))
        guard let url = try result.ok.body.json.url else {
            throw Error.genericError("invalid response body - no url found")
        }

        let ws = WebSocketClient(url: url, logger: logger) { inbound, outbound, context in
            context.logger.info("SocketMode client connected")
            socketMode = .ready(outbound)

            do {
                for try await frame in inbound {
                    guard frame.opcode == .text else { continue }

                    do {
                        try await onMessageRecieved(frame.data)
                    } catch {
                        let message = String(buffer: frame.data)
                        context.logger.error("Parsing message failed: \(error.localizedDescription) /// \(message)")
                    }
                }
            } catch {
                context.logger.error("Error during WebSocketClient run: \(error.localizedDescription)")
            }
            context.logger.info("SocketMode client disconnected")
        }
        try await ws.run()
    }

    func onMessageRecieved(_ buffer: ByteBuffer) async throws -> SlackMessageWrapper {
    }
}
#endif
