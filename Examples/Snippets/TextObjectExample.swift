import SlackBlockKitDSL

// MARK: - Demonstrating TextObject ExpressibleByStringLiteral

struct TextExampleModal: SlackModalView {
    var title: TextObject {
        "Text Examples" // ✨ String literal becomes plain text automatically
    }
    
    var submit: TextObject? {
        "Submit" // ✨ Clean and simple
    }
    
    var blocks: [BlockType] {
        Header {
            Text("Text Object Examples")
        }
        
        // ✨ Plain text (default from string literal)
        Section {
            Text("This is plain text")
        }
        
        // ✨ Markdown text (explicit conversion)
        Section {
            Text("*This is bold* and _this is italic_")
                .style(.mrkdwn)
        }
        
        // ✨ You can also use the extension for markdown
        Section {
            Text("**Bold markdown** with `code`")
                .text("**Bold markdown** with `code`".asMrkdwnTextObject())
        }
        
        Divider()
        
        // ✨ Complex example with mixed content
        Section {
            Text("🌟 Features:")
                .style(.mrkdwn)
        }
        
        for feature in [
            "*Bold* important items",
            "`Code` snippets", 
            "_Italic_ emphasis",
            "~Strikethrough~ text",
            "> Quoted text"
        ] {
            Section {
                Text("• \(feature)")
                    .style(.mrkdwn)
            }
        }
        
        // ✨ Input fields with clean syntax
        Input(
            element: {
                PlainTextInput()
                    .actionId("user_input")
                    .placeholder(Text("Type something here...")) // String literal works!
            },
            label: {
                Text("Your Input") // ✨ No .asTextObject() needed
            }
        )
        
        // ✨ Buttons with clean text
        Actions {
            Button("Primary Action") // String literal for button text
                .actionId("primary")
                .style(.primary)
            
            Button("Secondary Action")
                .actionId("secondary")
        }
    }
}

// MARK: - Advanced TextObject Usage

struct AdvancedTextModal: SlackModalView {
    let userName: String
    let isVip: Bool
    
    var title: TextObject {
        isVip ? "VIP Dashboard" : "User Dashboard" // ✨ Conditional string literals
    }
    
    var blocks: [BlockType] {
        Header {
            Text(isVip ? "👑 VIP Welcome" : "👋 Welcome")
        }
        
        Section {
            // ✨ String interpolation works naturally
            Text("Hello \(userName)! \(isVip ? "You have VIP access." : "Standard access.")")
        }
        
        if isVip {
            Section {
                Text("*🌟 VIP Benefits:*")
                    .style(.mrkdwn)
            }
            
            for benefit in [
                "Priority support",
                "Advanced features", 
                "Custom integrations"
            ] {
                Section {
                    Text("✅ \(benefit)")
                }
            }
        }
        
        // ✨ Complex markdown with string literal base
        Section {
            Text("Visit our *help center* or contact `support@company.com`")
                .style(.mrkdwn)
        }
    }
}

// MARK: - Comparison: Before vs After

// ❌ Old verbose way (still works but not recommended)
struct OldWayModal: SlackModalView {
    var title: TextObject {
        TextObject(type: .plainText, text: "Old Way")
    }
    
    var submit: TextObject? {
        TextObject(type: .plainText, text: "Submit")
    }
    
    var blocks: [BlockType] {
        Section {
            Text("This is the old verbose way")
                .text(TextObject(type: .plainText, text: "Explicit TextObject creation"))
        }
    }
}

// ✅ New clean way (recommended)
struct NewWayModal: SlackModalView {
    var title: TextObject {
        "New Clean Way" // ✨ String literal magic!
    }
    
    var submit: TextObject? {
        "Submit" // ✨ So clean!
    }
    
    var blocks: [BlockType] {
        Section {
            Text("This is the new clean way - much more readable!")
        }
    }
}

func demonstrateTextObjectUsage() {
    // ✨ All of these now work with clean string literals
    let textModal = TextExampleModal()
    let advancedModal = AdvancedTextModal(userName: "Alice", isVip: true)
    let newWayModal = NewWayModal()
    
    print("Text modal title: '\(textModal.title.text)'")
    print("Advanced modal title: '\(advancedModal.title.text)'") 
    print("New way modal title: '\(newWayModal.title.text)'")
    
    // ✨ Direct TextObject creation from string literal
    let directText: TextObject = "This is a TextObject created from a string literal"
    print("Direct text: '\(directText.text)', type: \(directText.type)")
}