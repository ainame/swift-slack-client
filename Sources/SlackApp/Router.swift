import Foundation
import Logging
import OpenAPIRuntime
import SlackClient

enum DispatchContext: Sendable {
    case request(SlackApp.Context)
    #if Events
    case event(SlackApp.EventContext)
    #endif

    var requestContext: SlackApp.Context? {
        guard case let .request(context) = self else { return nil }
        return context
    }

    #if Events
    var eventContext: SlackApp.EventContext? {
        guard case let .event(context) = self else { return nil }
        return context
    }
    #endif
}

typealias RequestHandler = @Sendable (DispatchContext, Request) async throws -> Void
public typealias RequestPayloadHandler<Payload: Sendable> =
    @Sendable (SlackApp.Context, Payload) async throws -> Void
public typealias RequestEnvelopePayloadHandler<Envelope: Sendable, Payload: Sendable> =
    @Sendable (SlackApp.Context, Envelope, Payload) async throws -> Void
#if Events
public typealias EventRequestPayloadHandler<Payload: Sendable> =
    @Sendable (SlackApp.EventContext, Payload) async throws -> Void
public typealias EventRequestEnvelopePayloadHandler<Envelope: Sendable, Payload: Sendable> =
    @Sendable (SlackApp.EventContext, Envelope, Payload) async throws -> Void
#endif
typealias ErrorHandler = @Sendable (DispatchContext, Request, Swift.Error) async throws -> Void

enum Request: Sendable {
    case interactive(InteractiveEnvelope)
    case slashCommand(SlashCommandsPayload)
    #if Events
    case event(EventsApiEnvelope<Event>)
    #endif
    case unsupported(String)
}

public class Router {
    private var handlers: [RequestHandler] = []
    private var errorHandler: ErrorHandler?

    public init() {}

    struct FixedRouter {
        private let handlers: [RequestHandler]
        private let errorHandler: ErrorHandler?

        init(from router: Router) {
            handlers = router.handlers
            errorHandler = router.errorHandler
        }

        func dispatch(context: DispatchContext, request: Request) async throws {
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

    func onRequest(_ handler: @escaping RequestHandler) {
        handlers.append(handler)
    }

    public func onInteractive(_ handler: @escaping RequestPayloadHandler<InteractiveEnvelope>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(payload) = request else { return }
            try await handler(context, payload)
        }
    }

    public func onGlboalShortcut(_ callbackId: String, handler: @escaping RequestPayloadHandler<GlobalShortcutPayload>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(interactiveEnvelope) = request,
                  case let .shortcut(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onMessageShortcut(_ callbackId: String, handler: @escaping RequestPayloadHandler<MessageShortcutPayload>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(interactiveEnvelope) = request,
                  case let .messageAction(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onSlashCommand(
        _ command: String,
        handler: @escaping RequestPayloadHandler<SlashCommandsPayload>
    ) {
        precondition(command.hasPrefix("/"), "A command should be registered with `/` prefix; e.g. `/command`")

        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .slashCommand(payload) = request,
                  payload.command == command else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onBlockAction(_ callbackId: String, handler: @escaping RequestPayloadHandler<BlockActionsPaylaod>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(interactiveEnvelope) = request,
                  case let .blockActions(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onView(_ callbackId: String, handler: @escaping RequestPayloadHandler<InteractivePayload>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(interactiveEnvelope) = request else { return }
            if case let .viewSubmission(payload) = interactiveEnvelope.body,
               payload.callbackId == callbackId {
                try await handler(context, interactiveEnvelope.body)
            } else if case let .viewClosed(payload) = interactiveEnvelope.body,
                      payload.callbackId == callbackId {
                try await handler(context, interactiveEnvelope.body)
            }
        }
    }

    public func onViewSubmission(_ callbackId: String, handler: @escaping RequestPayloadHandler<ViewSubmissionPayload>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(interactiveEnvelope) = request,
                  case let .viewSubmission(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    public func onViewClosed(_ callbackId: String, handler: @escaping RequestPayloadHandler<ViewClosedPayload>) {
        handlers.append { context, request in
            guard let context = context.requestContext,
                  case let .interactive(interactiveEnvelope) = request,
                  case let .viewClosed(payload) = interactiveEnvelope.body,
                  payload.callbackId == callbackId else {
                return
            }
            try await handler(context, payload)
        }
    }

    func onError(_ handler: @escaping ErrorHandler) {
        errorHandler = handler
    }

    #if Events
    public func onEvent(_ handler: @escaping EventRequestPayloadHandler<EventsApiEnvelope<Event>>) {
        handlers.append { context, request in
            guard let context = context.eventContext,
                  case let .event(payload) = request else { return }
            try await handler(context, payload)
        }
    }

    public func onEvent<T: SlackEvent>(
        _: T.Type,
        handler: @escaping EventRequestEnvelopePayloadHandler<EventsApiEnvelope<Event>, T>
    ) {
        handlers.append { context, request in
            guard let context = context.eventContext,
                  case let .event(payload) = request,
                  let event = payload.event.payload as? T else {
                return
            }
            try await handler(context, payload, event)
        }
    }

    public func onSlackMessageMatched(
        with regexPatterns: String...,
        handler: @escaping EventRequestEnvelopePayloadHandler<EventsApiEnvelope<Event>, MessageEvent>
    ) {
        handlers.append { context, request in
            guard let context = context.eventContext,
                  case let .event(payload) = request,
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
