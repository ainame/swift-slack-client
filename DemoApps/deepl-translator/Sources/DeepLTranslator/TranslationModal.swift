import Foundation
import SlackModels
import SlackBlockKit
import SlackBlockKitDSL

public struct TranslationModal {
    public static func buildNewModal(defaultLang: String) -> View {
        struct NewModal: SlackModalView {
            let defaultLang: String
            
            var callbackId: String { "run-translation" }
            var title: TextObject { "DeepL API Runner :books:" }
            var submit: TextObject? { "Translate" }
            var privateMetadata: String? { defaultLang }
            
            var blocks: [Block] {
                Block.input(InputBlock(
                    label: TextObject(type: .plainText, text: "Text"),
                    element: PlainTextInput()
                        .actionId("a")
                        .multiline(true)
                        .placeholder(Text("Put the text to translate"))
                        .asInputElement(),
                    blockId: "text"
                ))
                
                Block.input(InputBlock(
                    label: TextObject(type: .plainText, text: "Language"),
                    element: createLanguageSelect(defaultLang: defaultLang, options: languageOptions),
                    blockId: "lang"
                ))
            }
            
            private var languageOptions: [Option] {
                let orderedLangs = Languages.getOrderedLanguages(from: ProcessInfo.processInfo.environment["DEEPL_RUNNER_LANGUAGES"])
                return orderedLangs.compactMap { lang in
                    guard let reaction = Languages.langToReaction[lang],
                          let name = Languages.langToName[lang] else { return nil }
                    return Option("\(reaction) \(name)").value(lang)
                }
            }
            
            private func createLanguageSelect(defaultLang: String, options: [Option]) -> InputElementType {
                return StaticSelect {
                    for option in options {
                        option
                    }
                }
                .actionId("a")
                .placeholder(Text("Select language"))
                .initialOption(options.first ?? Option("English").value("en"))
                .asInputElement()
            }
        }
        
        let view = NewModal(defaultLang: defaultLang).render()
        switch view {
        case .modal(let modalView):
            return .modal(modalView)
        case .homeTab:
            fatalError("Expected modal view")
        }
    }
    
    public static func buildLoadingView(lang: String, text: String) -> View {
        struct LoadingView: SlackModalView {
            let lang: String
            let text: String
            
            var callbackId: String { "run-translation" }
            var title: TextObject { "DeepL API Runner :books:" }
            var close: TextObject? { "Close" }
            var submit: TextObject? { nil }
            
            var blocks: [Block] {
                Section {
                    Text(":hourglass_flowing_sand: Translating...")
                }
            }
        }
        
        let view = LoadingView(lang: lang, text: text).render()
        switch view {
        case .modal(let modalView):
            return .modal(modalView)
        case .homeTab:
            fatalError("Expected modal view")
        }
    }
    
    public static func buildResultView(lang: String, originalText: String, translatedText: String) -> View {
        struct ResultView: SlackModalView {
            let lang: String
            let originalText: String
            let translatedText: String
            
            var callbackId: String { "new-runner" }
            var title: TextObject { "DeepL API Runner :books:" }
            var close: TextObject? { "Close" }
            var submit: TextObject? { nil }
            var privateMetadata: String? { lang }
            
            var blocks: [Block] {
                Section {
                    Text("*Original:*\n\(originalText)")
                        .type(.mrkdwn)
                }
                
                Section {
                    Text("*Translated (\(Languages.langToName[lang] ?? lang)):*\n\(translatedText)")
                        .type(.mrkdwn)
                }
            }
        }
        
        let view = ResultView(lang: lang, originalText: originalText, translatedText: translatedText).render()
        switch view {
        case .modal(let modalView):
            return .modal(modalView)
        case .homeTab:
            fatalError("Expected modal view")
        }
    }
}