import Foundation
import SlackBlockKit
import SlackBlockKitDSL

/// Comprehensive examples demonstrating all RichText element types and capabilities
public enum RichTextComprehensiveExample {
    /// Example demonstrating all basic rich text content elements
    public static var allContentElements: Block {
        RichText {
            RichSection {
                RichTextContent("This is ")
                RichTextContent("bold text", bold: true)
                RichTextContent(" and ")
                RichTextContent("italic text", italic: true)
                RichTextContent(" and ")
                RichTextContent("strikethrough", strike: true)
                RichTextContent(" and ")
                RichTextContent("code", code: true)
                RichTextContent(".")
            }

            RichSection {
                RichTextContent("Here's a link: ")
                RichLink("https://slack.com", text: "Slack Homepage", bold: true)
                RichTextContent(" and an emoji ")
                RichEmoji("rocket")
                RichTextContent(" and a color ")
                RichColor("#FF0000")
                RichTextContent(".")
            }

            RichSection {
                RichTextContent("User mention: ")
                RichUser("U1234567890", bold: true)
                RichTextContent(" and channel: ")
                RichChannel("C1234567890", italic: true)
                RichTextContent(" and usergroup: ")
                RichUsergroup("S1234567890", highlight: true)
            }

            RichSection {
                RichTextContent("Date reference: ")
                RichDate(timestamp: 1_640_995_200, format: "{date_short} at {time}")
                RichTextContent(" and broadcast: ")
                RichBroadcast.here
            }
        }
        .blockId("all_content_elements")
        .render()
    }

    /// Example demonstrating rich text lists
    public static var richTextLists: Block {
        RichText {
            RichSection {
                RichTextContent("Shopping List:", bold: true)
            }

            RichList(style: .bullet) {
                RichSection {
                    RichEmoji("apple")
                    RichTextContent(" ")
                    RichTextContent("Apples", bold: true)
                    RichTextContent(" - ")
                    RichTextContent("Get the red ones", italic: true)
                }
                RichSection {
                    RichEmoji("bread")
                    RichTextContent(" Whole grain bread")
                }
                RichSection {
                    RichEmoji("cheese_wedge")
                    RichTextContent(" ")
                    RichLink("https://example.com/cheese", text: "Premium cheese")
                }
            }

            RichSection {
                RichTextContent("Priority Order:", bold: true)
            }

            RichList(style: .ordered) {
                RichSection {
                    RichTextContent("Review the ")
                    RichTextContent("quarterly report", code: true)
                    RichTextContent(" by ")
                    RichDate(timestamp: 1_640_995_200, format: "{date_short}")
                }
                RichSection {
                    RichTextContent("Contact ")
                    RichUser("U1234567890")
                    RichTextContent(" about the project")
                }
                RichSection {
                    RichTextContent("Post update in ")
                    RichChannel("C1234567890")
                    RichTextContent(" channel")
                }
            }
        }
        .blockId("rich_text_lists")
        .render()
    }

    /// Example demonstrating code blocks and quotes
    public static var codeAndQuotes: Block {
        RichText {
            RichSection {
                RichTextContent("Code Example:", bold: true)
            }

            RichPreformatted {
                RichTextContent("func greet(name: String) {")
                RichTextContent("\n    print(\"Hello, \\(name)!\")")
                RichTextContent("\n}")
            }

            RichSection {
                RichTextContent("Quote from our CEO:", bold: true)
            }

            RichQuote {
                RichTextContent("Innovation distinguishes between a leader and a follower.", italic: true)
                RichTextContent("\n\n- ")
                RichTextContent("Steve Jobs", bold: true)
            }
        }
        .blockId("code_and_quotes")
        .render()
    }

    /// Example demonstrating team communication patterns
    public static var teamCommunication: Block {
        RichText {
            RichSection {
                RichEmoji("mega")
                RichTextContent(" ")
                RichTextContent("Team Announcement", bold: true)
            }

            RichSection {
                RichBroadcast.channel
                RichTextContent(" Please review the new ")
                RichLink("https://company.com/policy", text: "remote work policy", bold: true)
                RichTextContent(" by ")
                RichDate(timestamp: 1_640_995_200, format: "{date_long}")
                RichTextContent(".")
            }

            RichSection {
                RichTextContent("Questions? Contact ")
                RichUsergroup("S0123456789")
                RichTextContent(" or reach out in ")
                RichChannel("C9876543210")
                RichTextContent(".")
            }

            RichSection {
                RichTextContent("Status: ")
                RichColor("#00FF00")
                RichTextContent(" Active")
            }
        }
        .blockId("team_communication")
        .render()
    }
}

/// Home tab view showcasing comprehensive RichText usage
public struct RichTextShowcaseHomeTab: SlackHomeTabView {
    public var blocks: [Block] {
        Header {
            Text("🎨 RichText Showcase")
        }

        Section {
            Text("*Comprehensive demonstration of all RichText capabilities*")
                .type(.mrkdwn)
        }

        Divider()

        Header {
            Text("📝 Content Elements")
        }

        RichTextComprehensiveExample.allContentElements

        Divider()

        Header {
            Text("📋 Lists & Structure")
        }

        RichTextComprehensiveExample.richTextLists

        Divider()

        Header {
            Text("💻 Code & Quotes")
        }

        RichTextComprehensiveExample.codeAndQuotes

        Divider()

        Header {
            Text("👥 Team Communication")
        }

        RichTextComprehensiveExample.teamCommunication

        Context {
            Text("💡 RichText supports all Slack formatting with type-safe DSL components")
        }
    }

    public var callbackId: String {
        "richtext_showcase"
    }

    public var externalId: String? {
        "richtext_demo_v1"
    }
}
