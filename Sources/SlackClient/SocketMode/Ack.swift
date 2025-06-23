#if SocketMode
import Foundation
import Logging
import SlackBlockKit
import WSClient

/// Provides acknowledgment functionality for Socket Mode interactions with custom payloads
public struct Ack: Sendable {
    private let envelopeId: String
    private let writer: WebSocketOutboundWriter
    private let logger: Logger

    init(envelopeId: String, writer: WebSocketOutboundWriter, logger: Logger) {
        self.envelopeId = envelopeId
        self.writer = writer
        self.logger = logger
    }

    /// Send a basic acknowledgment
    public func callAsFunction() async throws {
        struct BasicAck: Encodable {
            let envelopeId: String

            private enum CodingKeys: String, CodingKey {
                case envelopeId = "envelope_id"
            }
        }

        let ack = BasicAck(envelopeId: envelopeId)
        let data = try JSONEncoder().encode(ack)
        try await writer.write(.text(String(decoding: data, as: UTF8.self)))
        logger.debug("Sent basic acknowledgment", metadata: ["envelopeId": "\(envelopeId)"])
    }

    /// Send acknowledgment with view update response for view submissions
    public func callAsFunction(responseAction: ResponseAction, view: View) async throws {
        struct ViewUpdateAck: Encodable {
            let envelopeId: String
            let payload: Payload

            struct Payload: Encodable {
                let responseAction: String
                let view: View

                private enum CodingKeys: String, CodingKey {
                    case responseAction = "response_action"
                    case view
                }
            }

            private enum CodingKeys: String, CodingKey {
                case envelopeId = "envelope_id"
                case payload
            }
        }

        let ack = ViewUpdateAck(
            envelopeId: envelopeId,
            payload: ViewUpdateAck.Payload(
                responseAction: responseAction.rawValue,
                view: view,
            ),
        )

        let data = try JSONEncoder().encode(ack)
        try await writer.write(.text(String(decoding: data, as: UTF8.self)))
        logger.debug("Sent view update acknowledgment", metadata: [
            "envelopeId": "\(envelopeId)",
            "responseAction": "\(responseAction.rawValue)",
        ])
    }

    /// Send acknowledgment with errors for view submissions
    public func callAsFunction(errors: [String: String]) async throws {
        struct ErrorAck: Encodable {
            let envelopeId: String
            let payload: Payload

            struct Payload: Encodable {
                let responseAction: String
                let errors: [String: String]

                private enum CodingKeys: String, CodingKey {
                    case responseAction = "response_action"
                    case errors
                }
            }

            private enum CodingKeys: String, CodingKey {
                case envelopeId = "envelope_id"
                case payload
            }
        }

        let ack = ErrorAck(
            envelopeId: envelopeId,
            payload: ErrorAck.Payload(
                responseAction: "errors",
                errors: errors,
            ),
        )

        let data = try JSONEncoder().encode(ack)
        try await writer.write(.text(String(decoding: data, as: UTF8.self)))
        logger.debug("Sent error acknowledgment", metadata: [
            "envelopeId": "\(envelopeId)",
            "errors": "\(errors)",
        ])
    }
}

extension Ack {
    public enum ResponseAction: String, Sendable {
        case update
        case push
        case clear
    }
}

#endif
