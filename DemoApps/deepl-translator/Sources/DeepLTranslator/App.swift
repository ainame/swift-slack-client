import AsyncHTTPClient
import Foundation
import Logging
import OpenAPIAsyncHTTPClient
import SlackClient
import SlackModels
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
            try await context.ack()
            let modal = TranslationModal.buildNewModal(defaultLang: defaultLang)
            _ = try await context.client.viewsOpen(
                body: .json(.init(
                    view: modal,
                    triggerId: payload.triggerId
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
                    view: resultView,
                    viewId: payload.view.id
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

        // Add router and run
        await slack.addSocketModeRouter(router)

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
