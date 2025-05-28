#if SocketMode
import Logging

public typealias SocketModeMessageHandler = @Sendable (SocketModeMessageRouter.Context, SocketModeMessageEnvelope) async throws -> Void
public typealias SocketModeMessagePayloadHandler<Payload: Sendable> =
    @Sendable (SocketModeMessageRouter.Context, Payload) async throws -> Void
public typealias SocketModeMessageEnvelopePayloadHandler<Envelope: Sendable, Payload: Sendable> =
    @Sendable (SocketModeMessageRouter.Context, Envelope, Payload) async throws -> Void

public final class SocketModeMessageRouter {
    public struct Context: Sendable {
        public let client: APIProtocol
        public let logger: Logger
    }

    private var handlers: [SocketModeMessageHandler] = []

    public init() {
    }

    final class FixedRouter: Sendable {
        private let handlers: [SocketModeMessageHandler]

        init(from router: SocketModeMessageRouter) {
            self.handlers = router.handlers
        }

        func dispatch(context: SocketModeMessageRouter.Context, messageEnvelope: SocketModeMessageEnvelope) async throws {
            try await withThrowingDiscardingTaskGroup { group in
                for handler in handlers {
                    group.addTask {
                        try await handler(context, messageEnvelope)
                    }
                }
            }
        }
    }

    deinit {
        handlers.removeAll()
    }

    public func onSocketModeMessage(_ handler: @escaping SocketModeMessageHandler) {
        handlers.append(handler)
    }

    public func onInteractive(_ handler: @escaping SocketModeMessagePayloadHandler<InteractiveEnvelope>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            if case let .interactive(interactiveEnvelope) = envelope.payload {
                try await handler(context, interactiveEnvelope)
            }
        }
        handlers.append(filterHandler)
    }

    public func onGlboalShortcut(_ callbackId: String, handler: @escaping SocketModeMessagePayloadHandler<GlobalShortcutPayload>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .interactive(interactiveEnvelope) = envelope.payload else { return }
            guard case let .shortcut(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
        handlers.append(filterHandler)
    }

    public func onMessageShortcut(_ callbackId: String, handler: @escaping SocketModeMessagePayloadHandler<MessageShortcutPayload>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .interactive(interactiveEnvelope) = envelope.payload else { return }
            guard case let .messageAction(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
        handlers.append(filterHandler)
    }

    public func onSlashCommand(
        _ command: String,
        handler: @escaping SocketModeMessagePayloadHandler<SlashCommandsPayload>
    ) {
        precondition(command.hasPrefix("/"), "A command should be registered with `/` prefix; e.g. `/command`")

        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .slashCommands(payload) = envelope.payload,
                  payload.command == command else {
                return
            }
            try await handler(context, payload)
        }
        handlers.append(filterHandler)
    }

    public func onBlockAction(_ callbackId: String, handler: @escaping SocketModeMessagePayloadHandler<BlockActionsPaylaod>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .interactive(interactiveEnvelope) = envelope.payload,
                  case let .blockActions(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
        handlers.append(filterHandler)
    }

    public func onView(_ callbackId: String, handler: @escaping SocketModeMessagePayloadHandler<InteractivePayload>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .interactive(interactiveEnvelope) = envelope.payload else { return }
            if case let .viewSubmission(payload) = interactiveEnvelope.body,
               payload.callbackId == callbackId {
                try await handler(context, interactiveEnvelope.body)
            } else if case let .viewClosed(payload) = interactiveEnvelope.body,
               payload.callbackId == callbackId {
                try await handler(context, interactiveEnvelope.body)
            }
        }
        handlers.append(filterHandler)
    }

    public func onViewSubmission(_ callbackId: String, handler: @escaping SocketModeMessagePayloadHandler<ViewSubmissionPayload>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .interactive(interactiveEnvelope) = envelope.payload else { return }
            guard case let .viewSubmission(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
        handlers.append(filterHandler)
    }

    public func onViewClosed(_ callbackId: String, handler: @escaping SocketModeMessagePayloadHandler<ViewClosedPayload>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .interactive(interactiveEnvelope) = envelope.payload else { return }
            guard case let .viewClosed(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
        handlers.append(filterHandler)
    }

#if Events
    public func onEvent(_ handler: @escaping SocketModeMessagePayloadHandler<EventsApiEnvelope<EventType>>) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            if case let .eventsApi(eventsApiEnvelope) = envelope.payload {
                try await handler(context, eventsApiEnvelope)
            }
        }
        handlers.append(filterHandler)
    }

    public func onEvent<Event: SlackEvent>(
        _ eventType: Event.Type,
        handler: @escaping SocketModeMessageEnvelopePayloadHandler<EventsApiEnvelope<EventType>, Event>
    ) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .eventsApi(eventsApiEnvelope) = envelope.payload,
                  let payload = eventsApiEnvelope.event.payload as? Event else {
                return
            }
            try await handler(context, eventsApiEnvelope, payload)
        }
        handlers.append(filterHandler)
    }

    // Regex isn't Sendable at this moment. Compile string pattern in Sendable closure.
    public func onSlackMessageMatched(
        with regexPatterns: String...,
        handler: @escaping SocketModeMessageEnvelopePayloadHandler<EventsApiEnvelope<EventType>, MessageEvent>
    ) {
        let filterHandler: SocketModeMessageHandler = { context, envelope in
            guard case let .eventsApi(eventsApiEnvelope) = envelope.payload,
                  case let .message(messageEvent) = eventsApiEnvelope.event,
                  let text = messageEvent.text else {
                return
            }

            let patterns = regexPatterns.compactMap({ try? Regex($0) })
            guard patterns.contains(where: { text.contains($0) }) else {
                return
            }

            try await handler(context, eventsApiEnvelope, messageEvent)
        }
        handlers.append(filterHandler)
    }
#endif
}

#endif
