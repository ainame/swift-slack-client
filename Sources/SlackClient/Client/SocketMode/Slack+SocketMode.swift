#if SocketMode

import Foundation
import HTTPTypes
import Logging
import NIOCore
import OpenAPIRuntime
import WSClient

extension Slack {
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
}

extension Slack {
    public func runInSocketMode() async throws {
        let url = try await openConnection()
        try await doStartSocketMode(with: url)
    }

    func openConnection() async throws -> String {
        let result = try await client.appsConnectionsOpen(body: .json(.init(token: clientConfiguration.appLevelToken)))
        guard let url = try result.ok.body.json.url else {
            throw Error.genericError("invalid response body - no url found")
        }
        return url
    }

    func doStartSocketMode(with url: String) async throws {
        let ws = WebSocketClient(url: url, logger: logger) { inbound, outbound, context in
            context.logger.info("SocketMode client connected")
            await self.setWebSocketOutboundWriter(outbound)

            do {
                for try await frame in inbound {
                    guard frame.opcode == .text else { continue }

                    do {
                        try await self.onMessageRecieved(frame.data)
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

    @discardableResult
    private func onMessageRecieved(_ buffer: ByteBuffer) async throws -> SocketModeMessageWrapper {
        let messageWrapper = try jsonDecoder.decode(SocketModeMessageWrapper.self, from: buffer)
        switch messageWrapper.body {
        case .message(let message):
            try await ack(message)
        case .hello(let message):
            logger.info("\(message)")
        case .disconnect(let message):
            logger.info("\(message)")
        }
        return messageWrapper
    }

    private func ack(_ messageEnvelope: SocketModeMessageEnvelope) async throws {
        try await send(SocketModeAcknowledgementlMessage(envelopeId: messageEnvelope.envelopeId))
    }

    private func send(_ payload: Encodable) async throws {
        let data = try jsonEncoder.encode(payload)
        try await socketMode.writer?.write(.text(String(decoding: data, as: UTF8.self)))
    }

    private func setWebSocketOutboundWriter(_ webSocketOutboundWriter: WebSocketOutboundWriter) {
        socketMode = .ready(webSocketOutboundWriter)
    }
}

#endif
