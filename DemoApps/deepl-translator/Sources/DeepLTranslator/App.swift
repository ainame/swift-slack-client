import Foundation
import Logging
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackModels
import AsyncHTTPClient

@main
struct DeepLTranslatorApp {
    static let logger: Logger = {
        var logger = Logger(label: "deepl-translator")
        logger.logLevel = .debug
        return logger
    }()

    static func main() async throws {
        logger.info("Starting DeepL Translator bot...")

        // Check required environment variables
        guard let slackToken = ProcessInfo.processInfo.environment["SLACK_BOT_TOKEN"] else {
            logger.critical("SLACK_BOT_TOKEN is missing!")
            fatalError("SLACK_BOT_TOKEN is missing!")
        }

        guard let appToken = ProcessInfo.processInfo.environment["SLACK_APP_TOKEN"] else {
            logger.critical("SLACK_APP_TOKEN is missing!")
            fatalError("SLACK_APP_TOKEN is missing!")
        }

        guard let deepLAPIKey = ProcessInfo.processInfo.environment["DEEPL_API_KEY"] else {
            logger.critical("DEEPL_API_KEY is missing!")
            fatalError("DEEPL_API_KEY is missing!")
        }

        let isFreePlan = ProcessInfo.processInfo.environment["DEEPL_FREE_API_PLAN"] == "1"
        logger.info("Using DeepL \(isFreePlan ? "Free" : "Pro") plan")

        // Initialize shared HTTP client
        let httpClient = HTTPClient()
        
        // Initialize clients with shared HTTP client
        let transport = AsyncHTTPClientTransport(
            configuration: .init(client: httpClient)
        )
        let slack = Slack(
            transport: transport,
            configuration: .init(
                userAgent: "DeepLTranslator/1.0",
                appToken: appToken,
                token: slackToken
            )
        )
        let deepL = DeepLClient(httpClient: httpClient, authKey: deepLAPIKey, isFreePlan: isFreePlan)
        let reactionHandler = ReactionHandler(deepL: deepL)

        // Create router
        let router = SocketModeRouter()

        // Handle global shortcut
        router.onGlboalShortcut("deepl-translation") { context, payload in
            // Acknowledge the shortcut immediately
            try await context.ack()
            logger.debug("Global shortcut 'deepl-translation' triggered", metadata: [
                "user": "\(payload.user.name ?? "unknown")",
                "triggerId": "\(payload.triggerId)",
                "team": "\(payload.team.name ?? "unknown")"
            ])

            let defaultLang = Languages.getOrderedLanguages(from: ProcessInfo.processInfo.environment["DEEPL_RUNNER_LANGUAGES"]).first ?? "en"
            logger.debug("Using default language", metadata: ["lang": "\(defaultLang)"])

            let modal = TranslationModal.buildNewModal(defaultLang: defaultLang)
            logger.debug("Built modal", metadata: ["callbackId": "\(modal.callbackId ?? "none")"])

            do {
                _ = try await context.client.viewsOpen(
                    body: .json(.init(
                        view: modal,
                        triggerId: payload.triggerId
                    ))
                )
                logger.debug("Modal opened successfully")
            } catch {
                logger.error("Failed to open modal", metadata: ["error": "\(error)"])
            }
        }

        // Handle view submissions
        router.onViewSubmission("run-translation") { context, payload in
            logger.debug("View submission 'run-translation' received", metadata: [
                "user": "\(payload.user.name ?? "unknown")",
                "viewId": "\(payload.view.id ?? "none")",
                "callbackId": "\(payload.view.callbackId ?? "none")"
            ])

            do {
                try await handleTranslationSubmission(
                    context: context,
                    payload: payload,
                    deepL: deepL,
                    logger: logger
                )
            } catch {
                logger.error("Translation submission failed", metadata: ["error": "\(error)"])
                // Ack with error to prevent hanging
                try? await context.ack()
            }
        }


        // Handle reaction events
        router.onEvent(ReactionAddedEvent.self) { context, envelope, event in
            var metadata: Logger.Metadata = [
                "reaction": "\(event.reaction ?? "unknown")",
                "user": "\(event.user ?? "unknown")",
                "itemType": "\(event.item?._type ?? "unknown")"
            ]

            if let item = event.item, item._type == "message" {
                metadata["channel"] = "\(item.channel ?? "unknown")"
                if let message = item.message {
                    metadata["timestamp"] = "\(message.ts ?? "unknown")"
                }
            }

            logger.debug("Reaction added event received", metadata: metadata)

            do {
                try await reactionHandler.handleReactionAdded(
                    client: context.client,
                    event: event
                )
            } catch {
                logger.error("Reaction handling failed", metadata: [
                    "error": "\(error)",
                    "errorType": "\(type(of: error))"
                ])
            }
        }

        // Add router and run
        logger.debug("Adding socket mode router...")
        await slack.addSocketModeRouter(router)

        logger.debug("Starting socket mode connection...")
        logger.info("DeepL Translator bot is running!")

        do {
            try await slack.runInSocketMode()
        } catch {
            logger.critical("Socket mode failed", metadata: ["error": "\(error)"])
            try await httpClient.shutdown()
            throw error
        }
        
        // Clean up HTTP client on normal exit
        try await httpClient.shutdown()
    }
}

// MARK: - Helper Functions

private func handleTranslationSubmission(
    context: SocketModeRouter.Context,
    payload: ViewSubmissionPayload,
    deepL: DeepLClient,
    logger: Logger
) async throws {
    logger.debug("Processing translation submission...")

    // Extract form values from view state
    guard let state = payload.view.state else {
        logger.error("No state found in view")
        return
    }

    logger.debug("View state found, extracting form values...")

    // Extract text input value (block_id="text", action_id="a")
    guard let textValue = state["text", "a"]?.value else {
        logger.error("No text input found in state", metadata: [
            "availableBlocks": "\(state.values?.value.keys.sorted() ?? [])"
        ])
        return
    }

    // Extract language selection (block_id="lang", action_id="a")
    guard let langValue = state["lang", "a"]?.selectedOption?.value else {
        logger.error("No language selected", metadata: [
            "langBlockContent": "\(state["lang"]?.keys.sorted() ?? [])"
        ])
        return
    }

    logger.info("Translation submission received", metadata: [
        "user": "\(payload.user.name ?? "unknown")",
        "text": "\(textValue)",
        "targetLang": "\(langValue)"
    ])

    // Ack with loading view update (prevents modal from closing)
    logger.debug("Acknowledging with loading state...")
    let loadingView = TranslationModal.buildLoadingView(lang: langValue, text: textValue)
    do {
        try await context.ack(responseAction: .update, view: loadingView)
        logger.debug("Loading view ack sent successfully")
    } catch {
        logger.error("Failed to ack with loading view", metadata: ["error": "\(error)"])
        return
    }

    // Perform actual translation
    logger.debug("Starting translation...")
    guard let translatedText = try await deepL.translate(
        text: textValue,
        targetLanguage: langValue
    ) else {
        // Handle translation error
        logger.error("Translation failed - DeepL returned nil")
        return
    }

    logger.debug("Translation completed successfully", metadata: [
        "translatedText": "\(translatedText)"
    ])

    // Update view to show result using views.update API
    logger.debug("Updating view to show result...")
    let resultView = TranslationModal.buildResultView(
        lang: langValue,
        originalText: textValue,
        translatedText: translatedText
    )

    do {
        _ = try await context.client.viewsUpdate(
            body: .json(.init(
                view: resultView,
                viewId: payload.view.id
            ))
        )
        logger.debug("Result view updated successfully")
    } catch {
        logger.error("Failed to update result view", metadata: ["error": "\(error)"])
    }
}
