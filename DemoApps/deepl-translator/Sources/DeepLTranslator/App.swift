import AsyncHTTPClient
import Foundation
import Logging
import SlackAppKit
import SwiftDotenv

@main
struct DeepLTranslatorApp {
    static let logger: Logger = {
        var logger = Logger(label: "deepl-translator")
        logger.logLevel = .info
        return logger
    }()

    static func main() async throws {
        logger.info("Starting DeepL Translator bot...")

        // Load environment variables from .env file if it exists
        do {
            let root = URL(fileURLWithPath: #filePath)
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .path()
            try Dotenv.configure(atPath: "\(root).env")
            logger.info("Loaded .env file")
        } catch {
            logger.info("No .env file found, using environment variables")
        }

        // Check required environment variables
        guard let slackToken = Dotenv.slackBotToken?.stringValue,
              let appToken = Dotenv.slackAppToken?.stringValue,
              let deepLAPIKey = Dotenv.deeplApiKey?.stringValue else {
            logger.error("Required environment variables not set")
            return
        }
        let isFreePlan = Dotenv.deeplFreeApiPlan?.stringValue == "1"
        let defaultLang = Languages.getOrderedLanguages(from: Dotenv.deeplRunnerLanguages?.stringValue).first ?? "en"

        logger.info("Using DeepL \(isFreePlan ? "Free" : "Pro") plan")

        // Initialize shared HTTP client
        let httpClient = HTTPClient()

        let deepL = DeepLClient(httpClient: httpClient, authKey: deepLAPIKey, isFreePlan: isFreePlan)
        let reactionHandler = ReactionHandler(deepL: deepL)

        // Create router
        let router = Router()

        // Handle global shortcut
        router.onGlobalShortcut("deepl-translation") { context, payload in
            try await context.ack()
            let modal = TranslationModal.buildNewModal(defaultLang: defaultLang)
            _ = try await context.client.viewsOpen(
                body: .json(.init(
                    triggerId: payload.triggerId,
                    view: modal
                ))
            )
        }

        // Handle view submissions
        router.onViewSubmission("run-translation") { context, payload in
            guard let state = payload.view.state,
                  let textValue = state["text", "a"]?.value,
                  let langValue = state["lang", "a"]?.selectedOption?.value else {
                try await context.ack()
                return
            }

            let loadingView = TranslationModal.buildLoadingView(lang: langValue, text: textValue)
            try await context.ack(responseAction: .update, view: loadingView)

            guard let translatedText = try await deepL.translate(text: textValue, targetLanguage: langValue) else {
                return
            }

            let resultView = TranslationModal.buildResultView(
                lang: langValue,
                originalText: textValue,
                translatedText: translatedText
            )

            _ = try await context.client.viewsUpdate(
                body: .json(.init(
                    viewId: payload.view.id,
                    view: resultView
                ))
            )
        }

        // Handle reaction events
        router.onEvent(ReactionAddedEvent.self) { context, envelope, event in
            try await reactionHandler.handleReactionAdded(
                client: context.client,
                event: event
            )
        }

        logger.info("DeepL Translator bot is running!")

        let app = SlackApp(
            configuration: .init(
                userAgent: "DeepLTranslator/1.0",
                appToken: appToken,
                token: slackToken
            ),
            router: router,
            mode: .socketMode()
        )

        do {
            try await app.run()
        } catch {
            logger.critical("Socket mode failed", metadata: ["error": "\(error)"])
            try await httpClient.shutdown()
            throw error
        }

        // Clean up HTTP client on normal exit
        try await httpClient.shutdown()
    }
}
