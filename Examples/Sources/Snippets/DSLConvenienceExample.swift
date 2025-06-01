import Foundation
import SlackBlockKit
import SlackBlockKitDSL

/// Examples demonstrating convenient DSL patterns and shortcuts
public struct DSLConvenienceExample {
    
    /// Example showing convenient input patterns
    public static var convenientInputs: Block {
        Section {
            Text("*Input Examples with Convenient DSL Patterns*")
                .type(.mrkdwn)
        }
        .render()
    }
    
    /// Example showing all convenient initializer patterns
    public static var allConveniencePatterns: [Block] {
        [
            Header {
                Text("🎯 DSL Convenience Patterns")
            }
            .render(),
            
            Section {
                Text("*Text Input with Action ID*")
                    .type(.mrkdwn)
            }
            .render(),
            
            // Convenient Input with string label and actionId in element
            Input("Enter your name") {
                PlainTextInput("user_name_input")
                    .placeholder("Type your full name...")
                    .maxLength(100)
            }
            .render(),
            
            // Select with convenient actionId initializer
            Input("Choose your team") {
                StaticSelect("team_select") {
                    Option("Engineering")
                        .value("eng")
                    Option("Design")
                        .value("design")
                    Option("Product")
                        .value("product")
                }
                .placeholder("Select your team...")
            }
            .render(),
            
            // User select with actionId
            Input("Select a mentor") {
                UsersSelect("mentor_select")
                    .placeholder("Choose a team member...")
            }
            .render(),
            
            // Channel select with actionId
            Input("Project channel") {
                ChannelsSelect("project_channel")
                    .placeholder("Select project channel...")
            }
            .render(),
            
            // Date picker with actionId
            Input("Start date") {
                DatePicker("start_date")
                    .placeholder("Choose start date...")
            }
            .render(),
            
            Section {
                Text("*Rich Text with All Elements*")
                    .type(.mrkdwn)
            }
            .render(),
            
            // Comprehensive RichText example
            RichText {
                RichSection {
                    RichTextContent("Hello ")
                    RichUser("U123456789", bold: true)
                    RichTextContent(", welcome to ")
                    RichChannel("C987654321", italic: true)
                    RichTextContent("!")
                }
                
                RichSection {
                    RichTextContent("Here's your personalized link: ")
                    RichLink("https://example.com/dashboard", text: "Dashboard", bold: true)
                    RichTextContent(" 🚀")
                }
                
                RichSection {
                    RichTextContent("Team alert: ")
                    RichBroadcast.here
                    RichTextContent(" Please review the ")
                    RichColor("#FF6B6B")
                    RichTextContent(" urgent items.")
                }
                
                RichPreformatted {
                    RichTextContent("// Quick start command")
                    RichTextContent("\nnpm install && npm start")
                }
                
                RichQuote {
                    RichTextContent("Success is not final, failure is not fatal", italic: true)
                    RichTextContent("\n— Winston Churchill")
                }
            }
            .blockId("rich_text_showcase")
            .render()
        ]
    }
}

/// Modal example using convenient DSL patterns
public struct ConvenientModal: SlackModalView {
    public var title: TextObject { Text("🚀 Quick Setup").render() }
    
    public var blocks: [Block] {
        Section {
            Text("*Let's get you set up quickly with our convenient DSL patterns!*")
                .type(.mrkdwn)
        }
        
        // Multiple inputs using convenient patterns
        Input("Full Name") {
            PlainTextInput("full_name")
                .placeholder("Enter your full name...")
                .maxLength(100)
        }
        
        Input("Email Address") {
            PlainTextInput("email")
                .placeholder("your.email@company.com")
        }
        
        Input("Department") {
            StaticSelect("department") {
                Option("🔧 Engineering")
                    .value("engineering")
                Option("🎨 Design")
                    .value("design")
                Option("📊 Product")
                    .value("product")
                Option("💼 Sales")
                    .value("sales")
            }
            .placeholder("Choose your department...")
        }
        
        Input("Manager") {
            UsersSelect("manager")
                .placeholder("Select your manager...")
        }
        
        Input("Start Date") {
            DatePicker("start_date")
                .placeholder("Choose your start date...")
        }
        
        Divider()
        
        RichText {
            RichSection {
                RichEmoji("wave")
                RichTextContent(" ")
                RichTextContent("Welcome aboard! ", bold: true)
                RichTextContent("We're excited to have you join our team.")
            }
            
            RichSection {
                RichTextContent("Questions? Reach out to ")
                RichUsergroup("S1234567890")
                RichTextContent(" anytime!")
            }
        }
        .blockId("welcome_message")
    }
    
    public var submit: TextObject? { Text("Complete Setup").render() }
    public var close: TextObject? { Text("Cancel").render() }
    public var callbackId: String? { "convenient_setup_modal" }
}

/// Home tab showcasing all convenience patterns
public struct ConvenienceShowcaseHomeTab: SlackHomeTabView {
    public var blocks: [Block] {
        var allBlocks = DSLConvenienceExample.allConveniencePatterns
        allBlocks.append(
            Context {
                Text("💡 All patterns use convenient DSL initializers for cleaner, more readable code")
            }
            .render()
        )
        return allBlocks
    }
    
    public var callbackId: String? { "convenience_showcase" }
    public var externalId: String? { "dsl_patterns_demo" }
}