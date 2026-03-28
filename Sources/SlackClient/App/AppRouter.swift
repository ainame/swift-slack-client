#if Events
import Foundation
#else
import Foundation
#endif
import Logging

typealias AppRequestHandler = @Sendable (AppContext, AppRequest) async throws -> Void
public typealias AppRequestPayloadHandler<Payload: Sendable> =
    @Sendable (AppContext, Payload) async throws -> Void
public typealias AppRequestEnvelopePayloadHandler<Envelope: Sendable, Payload: Sendable> =
    @Sendable (AppContext, Envelope, Payload) async throws -> Void
typealias AppErrorHandler = @Sendable (AppContext, AppRequest, Swift.Error) async throws -> Void

public struct AppContext: Sendable {
    public let client: APIProtocol
    public let logger: Logger
    public let respond: Respond
    public let say: Say
    public let ack: Ack
}

public enum AppRequest: Sendable {
    case interactive(InteractiveEnvelope)
    case slashCommand(SlashCommandsPayload)
    #if Events
    case event(EventsApiEnvelope<Event>)
    #endif
    case unsupported(String)
}

public class AppRouter {
    private var handlers: [AppRequestHandler] = []
    private var errorHandler: AppErrorHandler?

    public init() {}

    struct FixedRouter {
        private let handlers: [AppRequestHandler]
        private let errorHandler: AppErrorHandler?

        init(from router: AppRouter) {
            handlers = router.handlers
            errorHandler = router.errorHandler
        }

        func dispatch(context: AppContext, request: AppRequest) async throws {
            try await withThrowingDiscardingTaskGroup { group in
                for handler in handlers {
                    group.addTask {
                        do {
                            try await handler(context, request)
                        } catch {
                            if let errorHandler {
                                try await errorHandler(context, request, error)
                            }
                            throw error
                        }
                    }
                }
            }
        }
    }

    func onRequest(_ handler: @escaping AppRequestHandler) {
        handlers.append(handler)
    }

    public func onInteractive(_ handler: @escaping AppRequestPayloadHandler<InteractiveEnvelope>) {
        handlers.append { context, request in
            guard case let .interactive(payload) = request else { return }
            try await handler(context, payload)
        }
    }

    public func onGlboalShortcut(_ callbackId: String, handler: @escaping AppRequestPayloadHandler<GlobalShortcutPayload>) {
        handlers.append { context, request in
            guard case let .interactive(interactiveEnvelope) = request,
                  case let .shortcut(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onMessageShortcut(_ callbackId: String, handler: @escaping AppRequestPayloadHandler<MessageShortcutPayload>) {
        handlers.append { context, request in
            guard case let .interactive(interactiveEnvelope) = request,
                  case let .messageAction(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onSlashCommand(
        _ command: String,
        handler: @escaping AppRequestPayloadHandler<SlashCommandsPayload>
    ) {
        precondition(command.hasPrefix("/"), "A command should be registered with `/` prefix; e.g. `/command`")

        handlers.append { context, request in
            guard case let .slashCommand(payload) = request,
                  payload.command == command else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onBlockAction(_ callbackId: String, handler: @escaping AppRequestPayloadHandler<BlockActionsPaylaod>) {
        handlers.append { context, request in
            guard case let .interactive(interactiveEnvelope) = request,
                  case let .blockActions(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onView(_ callbackId: String, handler: @escaping AppRequestPayloadHandler<InteractivePayload>) {
        handlers.append { context, request in
            guard case let .interactive(interactiveEnvelope) = request else { return }
            if case let .viewSubmission(payload) = interactiveEnvelope.body,
               payload.callbackId == callbackId {
                try await handler(context, interactiveEnvelope.body)
            } else if case let .viewClosed(payload) = interactiveEnvelope.body,
                      payload.callbackId == callbackId {
                try await handler(context, interactiveEnvelope.body)
            }
        }
    }

    public func onViewSubmission(_ callbackId: String, handler: @escaping AppRequestPayloadHandler<ViewSubmissionPayload>) {
        handlers.append { context, request in
            guard case let .interactive(interactiveEnvelope) = request,
                  case let .viewSubmission(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onViewClosed(_ callbackId: String, handler: @escaping AppRequestPayloadHandler<ViewClosedPayload>) {
        handlers.append { context, request in
            guard case let .interactive(interactiveEnvelope) = request,
                  case let .viewClosed(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    func onError(_ handler: @escaping AppErrorHandler) {
        errorHandler = handler
    }

    #if Events
    public func onEvent(_ handler: @escaping AppRequestPayloadHandler<EventsApiEnvelope<Event>>) {
        handlers.append { context, request in
            guard case let .event(payload) = request else { return }
            try await handler(context, payload)
        }
    }

    public func onEvent<T: SlackEvent>(
        _: T.Type,
        handler: @escaping AppRequestEnvelopePayloadHandler<EventsApiEnvelope<Event>, T>
    ) {
        handlers.append { context, request in
            guard case let .event(payload) = request,
                  let event = payload.event.payload as? T else {
                return
            }
            try await handler(context, payload, event)
        }
    }

    public func onSlackMessageMatched(
        with regexPatterns: String...,
        handler: @escaping AppRequestEnvelopePayloadHandler<EventsApiEnvelope<Event>, MessageEvent>
    ) {
        handlers.append { context, request in
            guard case let .event(payload) = request,
                  case let .message(messageEvent) = payload.event,
                  let text = messageEvent.text else {
                return
            }

            let patterns = regexPatterns.compactMap { try? Regex($0) }
            guard patterns.contains(where: { text.contains($0) }) else {
                return
            }

            try await handler(context, payload, messageEvent)
        }
    }
    #endif
}
