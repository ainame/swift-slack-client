#if SocketMode

public typealias MessageHandler = @Sendable (APIProtocol, SocketModeMessageEnvelope) async throws -> Void
public typealias InteractivePayloadHandler = @Sendable (APIProtocol, InteractiveEnvelope) async throws -> Void

#if Events
public typealias EventHandler = @Sendable (APIProtocol, EventsApiEnvelope<EventType>) async throws -> Void
#endif

public final class SlackMessageRouter {
    private var handlers: [MessageHandler] = []

    public init() {
    }

    final class Container: Sendable {
        private let handlers: [MessageHandler]

        init(from router: SlackMessageRouter) {
            self.handlers = router.handlers
        }

        func dispatch(client: APIProtocol, messageEnvelope: SocketModeMessageEnvelope) async throws {
            for handler in handlers {
                try await handler(client, messageEnvelope)
            }
        }
    }

    deinit {
        handlers.removeAll()
    }

    public func onMessage(_ handler: @escaping MessageHandler) {
        handlers.append(handler)
    }

    public func onInteractive(_ handler: @escaping InteractivePayloadHandler) {
        let eventHandler: MessageHandler = { api, envelope in
            if case let .interactive(interactiveEnvelope) = envelope.payload {
                try await handler(api, interactiveEnvelope)
            }
        }
        handlers.append(eventHandler)
    }

#if Events
    public func onEvent(_ handler: @escaping EventHandler) {
        let eventHandler: MessageHandler = { api, envelope in
            if case let .eventsApi(eventsApiEnvelope) = envelope.payload {
                try await handler(api, eventsApiEnvelope)
            }
        }
        handlers.append(eventHandler)
    }
#endif
}

#endif
