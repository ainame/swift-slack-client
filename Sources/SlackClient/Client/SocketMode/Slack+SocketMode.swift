#if SocketMode

import Foundation
import HTTPTypes
import Logging
import NIOCore
import OpenAPIRuntime
import WSClient

extension Slack {
    public func runInSocketMode() async throws {
        let url = try await openConnection()
        try await doStartSocketMode(with: url)
    }

    public func addMessageRouter(_ messageRouter: SlackMessageRouter) {
        messageRouters.append(SlackMessageRouter.Container(from: messageRouter))
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
                        let message = try await self.onMessageRecieved(frame.data)
                        if case .message(let envelope) = message.body {
                            for router in await self.messageRouters {
                                try await router.dispatch(client: self.client, messageEnvelope: envelope)
                            }
                        }
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

    private func onMessageRecieved(_ buffer: ByteBuffer) async throws -> SocketModeMessageType {
        let messageType = try jsonDecoder.decode(SocketModeMessageType.self, from: buffer)
        switch messageType.body {
        case .message(let message):
            try await ack(message)
        case .hello(let message):
            logger.info("\(message)")
        case .disconnect(let message):
            logger.info("\(message)")
        }
        return messageType
    }

    private func ack(_ messageEnvelope: SocketModeMessageEnvelope) async throws {
        try await send(SocketModeAcknowledgementlMessage(envelopeId: messageEnvelope.envelopeId))
    }

    private func send(_ payload: Encodable) async throws {
        let data = try jsonEncoder.encode(payload)
        try await socketModeState.writer?.write(.text(String(decoding: data, as: UTF8.self)))
    }

    private func setWebSocketOutboundWriter(_ webSocketOutboundWriter: WebSocketOutboundWriter) {
        socketModeState = .ready(webSocketOutboundWriter)
    }
}

#endif
