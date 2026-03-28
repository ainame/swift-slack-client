import Foundation
import HTTPTypes
import SlackClient
import SlackBlockKit

private actor HTTPAcknowledgmentState {
    private enum StoredResponse {
        case empty
        case json(Data)
    }

    private var storedResponse: StoredResponse?

    func storeEmptyIfNeeded() throws {
        try store(.empty)
    }

    func storeJSON(_ data: Data) throws {
        try store(.json(data))
    }

    private func store(_ response: StoredResponse) throws {
        guard storedResponse == nil else {
            throw Slack.Error.genericError("ack() already called")
        }
        storedResponse = response
    }

    func response() -> HTTPServerResponse? {
        switch storedResponse {
        case .empty:
            return HTTPServerResponse(status: .ok)
        case let .json(data):
            return HTTPServerResponse(
                status: .ok,
                headerFields: HTTPFields([HTTPField(name: .contentType, value: "application/json")]),
                body: data,
            )
        case nil:
            return nil
        }
    }
}

struct AppHTTPHandler {
    private static let contentTypeField = HTTPField.Name.contentType

    private let slack: Slack
    private let router: Router.FixedRouter
    private let jsonDecoder = JSONDecoder()
    private let jsonEncoder = JSONEncoder()

    init(slack: Slack, router: Router) {
        self.slack = slack
        self.router = .init(from: router)
    }

    func handle(_ request: HTTPServerRequest) async throws -> HTTPServerResponse {
        if request.method == .get && request.path == "/healthz" {
            return HTTPServerResponse(status: .ok, body: Data("OK".utf8))
        }

        guard request.method == .post, request.path == "/slack/events" else {
            return HTTPServerResponse(status: .notFound)
        }

        let configuration = await slack.clientConfiguration
        let verifier = HTTPRequestVerifier(signingSecret: configuration.signingSecret ?? "")

        do {
            try verifier.verify(headerFields: request.headerFields, body: request.body)
        } catch {
            return HTTPServerResponse(status: .unauthorized)
        }

        if let response = try await handleJSONRequestIfNeeded(request, configuration: configuration) {
            return response
        }

        if let response = try await handleFormRequestIfNeeded(request) {
            return response
        }

        return HTTPServerResponse(status: .unsupportedMediaType)
    }

    private func handleJSONRequestIfNeeded(
        _ request: HTTPServerRequest,
        configuration _: Slack.Configuration
    ) async throws -> HTTPServerResponse? {
        guard contentType(of: request.headerFields)?.starts(with: "application/json") == true else {
            return nil
        }

        let typeContainer = try jsonDecoder.decode(HTTPEventTypeContainer.self, from: request.body)
        if typeContainer.type == "url_verification" {
            let payload = try jsonDecoder.decode(URLVerificationPayload.self, from: request.body)
            let data = try jsonEncoder.encode(["challenge": payload.challenge])
            return HTTPServerResponse(
                status: .ok,
                headerFields: HTTPFields([HTTPField(name: .contentType, value: "application/json")]),
                body: data,
            )
        }

        #if Events
        let payload = try jsonDecoder.decode(EventsApiEnvelope<Event>.self, from: request.body)
        return try await dispatch(.event(payload), kind: .event)
        #else
        return HTTPServerResponse(status: .notImplemented)
        #endif
    }

    private func handleFormRequestIfNeeded(_ request: HTTPServerRequest) async throws -> HTTPServerResponse? {
        guard contentType(of: request.headerFields)?.starts(with: "application/x-www-form-urlencoded") == true else {
            return nil
        }

        let values = Self.decodeFormBody(request.body)

        if let payloadString = values["payload"] {
            let payload = try jsonDecoder.decode(InteractiveEnvelope.self, from: Data(payloadString.utf8))
            return try await dispatch(.interactive(payload), kind: .interactive)
        }

        let json = try JSONSerialization.data(withJSONObject: values, options: [])
        let payload = try jsonDecoder.decode(SlashCommandsPayload.self, from: json)
        return try await dispatch(.slashCommand(payload), kind: .slashCommand)
    }

    private func dispatch(_ request: Request, kind: RequestKind) async throws -> HTTPServerResponse {
        let client = await slack.client
        let transport = await slack.transport
        let logger = await slack.logger
        let respond = Respond(transport: transport, logger: logger)
        let say = Say(client: client, logger: logger)

        switch kind {
        case .event:
            let context = SlackApp.EventContext(
                client: client,
                logger: logger,
                respond: respond,
                say: say,
            )
            try await router.dispatch(context: .event(context), request: request)
            return HTTPServerResponse(status: .ok)
        case .interactive, .slashCommand:
            let state = HTTPAcknowledgmentState()
            let context = SlackApp.Context(
                client: client,
                logger: logger,
                respond: respond,
                say: say,
                ack: Ack(
                    basicHandler: {
                        try await state.storeEmptyIfNeeded()
                    },
                    viewHandler: { responseAction, view in
                        let data = try jsonEncoder.encode(HTTPViewAckPayload(responseAction: responseAction.rawValue, view: view))
                        try await state.storeJSON(data)
                    },
                    errorHandler: { errors in
                        let data = try jsonEncoder.encode(HTTPErrorAckPayload(responseAction: "errors", errors: errors))
                        try await state.storeJSON(data)
                    },
                ),
            )
            try await router.dispatch(context: .request(context), request: request)

            if let response = await state.response() {
                return response
            }

            return HTTPServerResponse(status: .internalServerError)
        }
    }

    private func contentType(of headers: HTTPFields) -> String? {
        headers[values: Self.contentTypeField].first
    }

    private static func decodeFormBody(_ body: Data) -> [String: String] {
        let query = String(decoding: body, as: UTF8.self)
        var result: [String: String] = [:]
        for part in query.split(separator: "&") {
            let pair = part.split(separator: "=", maxSplits: 1).map(String.init)
            guard let key = pair.first?.removingPercentEncoding else { continue }
            let value = pair.count == 2 ? (pair[1].replacingOccurrences(of: "+", with: " ").removingPercentEncoding ?? pair[1]) : ""
            result[key] = value
        }
        return result
    }

    private enum RequestKind {
        case event
        case interactive
        case slashCommand
    }
}

private struct HTTPEventTypeContainer: Decodable {
    let type: String
}

private struct URLVerificationPayload: Decodable {
    let challenge: String
}

private struct HTTPViewAckPayload: Encodable {
    let responseAction: String
    let view: View

    private enum CodingKeys: String, CodingKey {
        case responseAction = "response_action"
        case view
    }
}

private struct HTTPErrorAckPayload: Encodable {
    let responseAction: String
    let errors: [String: String]

    private enum CodingKeys: String, CodingKey {
        case responseAction = "response_action"
        case errors
    }
}
