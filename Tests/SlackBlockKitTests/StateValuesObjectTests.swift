import Foundation
import Testing
@testable import SlackBlockKit
import OpenAPIRuntime

@Test("Decode plain text input state values") 
func testDecodePlainTextInput() throws {
    let json = """
    {
        "values": {
            "text_block": {
                "text_action": {
                    "type": "plain_text_input",
                    "value": "Hello, world!"
                }
            }
        }
    }
    """
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    // Test subscript access
    let textValue = stateValues["text_block", "text_action"]
    #expect(textValue?.type == "plain_text_input")
    #expect(textValue?.value == "Hello, world!")
    
    // Test block-level subscript
    let blockValues = stateValues["text_block"]
    #expect(blockValues?["text_action"]?.value == "Hello, world!")
}

@Test("Decode static select state values")
func testDecodeStaticSelect() throws {
    let json = """
    {
        "values": {
            "language_block": {
                "language_select": {
                    "type": "static_select",
                    "selected_option": {
                        "text": {
                            "type": "plain_text",
                            "text": "Spanish"
                        },
                        "value": "es"
                    }
                }
            }
        }
    }
    """
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    let selectValue = stateValues["language_block", "language_select"]
    #expect(selectValue?.type == "static_select")
    #expect(selectValue?.selectedOption?.value == "es")
    #expect(selectValue?.selectedOption?.text.text == "Spanish")
}

@Test("Decode multi-select state values")
func testDecodeMultiSelect() throws {
    let json = """
    {
        "values": {
            "users_block": {
                "users_select": {
                    "type": "multi_users_select",
                    "selected_users": ["U123ABC", "U456DEF"]
                }
            }
        }
    }
    """
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    let usersValue = stateValues["users_block", "users_select"]
    #expect(usersValue?.type == "multi_users_select")
    #expect(usersValue?.selectedUsers == ["U123ABC", "U456DEF"])
}

@Test("Decode date picker state values")
func testDecodeDatePicker() throws {
    let json = """
    {
        "values": {
            "date_block": {
                "date_action": {
                    "type": "datepicker",
                    "selected_date": "2024-01-15"
                }
            }
        }
    }
    """
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    let dateValue = stateValues["date_block", "date_action"]
    #expect(dateValue?.type == "datepicker")
    #expect(dateValue?.selectedDate == "2024-01-15")
}

@Test("Handle missing values gracefully")
func testMissingValues() throws {
    let json = """
    {
        "values": {}
    }
    """
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    // Test accessing non-existent block
    let missingValue = stateValues["non_existent", "action"]
    #expect(missingValue == nil)
    
    // Test accessing non-existent action in existing block
    let missingBlock = stateValues["missing_block"]
    #expect(missingBlock == nil)
}

@Test("Decode complex form with multiple inputs")
func testDecodeComplexForm() throws {
    let json = """
    {
        "values": {
            "text": {
                "a": {
                    "type": "plain_text_input",
                    "value": "Sample text to translate"
                }
            },
            "lang": {
                "a": {
                    "type": "static_select",
                    "selected_option": {
                        "text": {
                            "type": "plain_text",
                            "text": "🇪🇸 Spanish"
                        },
                        "value": "es"
                    }
                }
            }
        }
    }
    """
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    // Test text input
    let textValue = stateValues["text", "a"]
    #expect(textValue?.type == "plain_text_input")
    #expect(textValue?.value == "Sample text to translate")
    
    // Test language select
    let langValue = stateValues["lang", "a"]
    #expect(langValue?.type == "static_select")
    #expect(langValue?.selectedOption?.value == "es")
    #expect(langValue?.selectedOption?.text.text == "🇪🇸 Spanish")
}

@Test("Decode completely empty JSON")
func testDecodeEmptyJSON() throws {
    let json = "{}"
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    
    let stateValues = try decoder.decode(StateValuesObject.self, from: data)
    
    // Should decode successfully with nil values
    #expect(stateValues.values == nil)
    
    // Accessing any values should return nil
    let anyValue = stateValues["any_block", "any_action"]
    #expect(anyValue == nil)
    
    let anyBlock = stateValues["any_block"]
    #expect(anyBlock == nil)
}