import Foundation
import Testing
@testable import SlackBlockKitDSL
import SlackBlockKit

struct SlackViewTests {

    // Test native for-in loop
    @Test func nativeForInLoop() {
        struct TestView: SlackView {
            let items = ["Apple", "Banana", "Orange"]

            var blocks: [BlockType] {
                Header { Text("Fruit List") }

                // Using native for-in loop
                for item in items {
                    Section {
                        Text(item)
                    }
                }
            }
        }

        let view = TestView()
        let blocks = view.blocks

        #expect(blocks.count == 4) // 1 header + 3 sections

        // Check header
        if case .header(let header) = blocks[0] {
            #expect(header.text.text == "Fruit List")
        } else {
            Issue.record("First block should be header")
        }

        // Check sections
        let expectedFruits = ["Apple", "Banana", "Orange"]
        for (index, fruit) in expectedFruits.enumerated() {
            if case .section(let section) = blocks[index + 1] {
                #expect(section.text?.text == fruit)
            } else {
                Issue.record("Block at index \(index + 1) should be section")
            }
        }
    }

    // Test enumerated for-in loop
    @Test func enumeratedForInLoop() {
        struct TestView: SlackView {
            let items = ["First", "Second", "Third"]

            var blocks: [BlockType] {
                Header { Text("Numbered List") }

                // Using enumerated
                for (index, item) in items.enumerated() {
                    Section {
                        Text("\(index + 1). \(item)")
                    }
                }
            }
        }

        let view = TestView()
        let blocks = view.blocks

        #expect(blocks.count == 4)

        // Check sections have correct numbering
        let expectedTexts = ["1. First", "2. Second", "3. Third"]
        for (index, expectedText) in expectedTexts.enumerated() {
            if case .section(let section) = blocks[index + 1] {
                #expect(section.text?.text == expectedText)
            } else {
                Issue.record("Block at index \(index + 1) should be section")
            }
        }
    }

    // Test complex scenario with conditionals inside loops
    @Test func forInWithConditionals() {
        struct TestView: SlackView {
            let numbers = [1, 2, 3, 4, 5]

            var blocks: [BlockType] {
                Header { Text("Even Numbers") }

                for number in numbers {
                    if number % 2 == 0 {
                        Section {
                            Text("Even: \(number)")
                        }
                    }
                }
            }
        }

        let view = TestView()
        let blocks = view.blocks

        #expect(blocks.count == 3) // 1 header + 2 even number sections

        // Check we only have even numbers
        if case .section(let section1) = blocks[1] {
            #expect(section1.text?.text == "Even: 2")
        } else {
            Issue.record("Second block should be section for 2")
        }

        if case .section(let section2) = blocks[2] {
            #expect(section2.text?.text == "Even: 4")
        } else {
            Issue.record("Third block should be section for 4")
        }
    }

    // Test nested loops
    @Test func nestedForInLoops() {
        struct TestView: SlackView {
            let categories = [
                ("Fruits", ["Apple", "Banana"]),
                ("Vegetables", ["Carrot", "Broccoli"])
            ]

            var blocks: [BlockType] {
                for (category, items) in categories {
                    Header { Text(category) }

                    for item in items {
                        Section {
                            Text("• \(item)")
                        }
                    }

                    Divider()
                }
            }
        }

        let view = TestView()
        let blocks = view.blocks

        // Should have: Header, 2 Sections, Divider, Header, 2 Sections, Divider = 8 blocks
        #expect(blocks.count == 8)

        // Verify structure
        #expect(blocks[0].isHeader)
        #expect(blocks[1].isSection)
        #expect(blocks[2].isSection)
        #expect(blocks[3].isDivider)
        #expect(blocks[4].isHeader)
        #expect(blocks[5].isSection)
        #expect(blocks[6].isSection)
        #expect(blocks[7].isDivider)
    }

    // Test empty views and conditional rendering
    @Test func emptyAndConditionalRendering() {
        struct TestView: SlackView {
            let showContent: Bool
            let items: [String]

            var blocks: [BlockType] {
                if showContent {
                    Header { Text("Items") }

                    if items.isEmpty {
                        Section {
                            Text("No items available")
                        }
                    } else {
                        for item in items {
                            Section {
                                Text(item)
                            }
                        }
                    }
                }
            }
        }

        // Test with no content
        let emptyView = TestView(showContent: false, items: [])
        #expect(emptyView.blocks.isEmpty)

        // Test with content but no items
        let noItemsView = TestView(showContent: true, items: [])
        #expect(noItemsView.blocks.count == 2) // Header + "No items" section

        // Test with content and items
        let fullView = TestView(showContent: true, items: ["Item 1", "Item 2"])
        #expect(fullView.blocks.count == 3) // Header + 2 item sections
    }

    // Test with filter and map operations
    @Test func filterAndMapOperations() {
        struct TestView: SlackView {
            let numbers = [1, 2, 3, 4, 5, 6]

            var blocks: [BlockType] {
                Header { Text("Even Numbers") }

                // Use filter and map instead of break/continue
                for number in numbers.filter({ $0 <= 4 && $0 % 2 == 0 }) {
                    Section {
                        Text("Number: \(number)")
                    }
                }
            }
        }

        let view = TestView()
        let blocks = view.blocks

        #expect(blocks.count == 3) // Header + sections for 2 and 4

        if case .section(let section1) = blocks[1] {
            #expect(section1.text?.text == "Number: 2")
        }

        if case .section(let section2) = blocks[2] {
            #expect(section2.text?.text == "Number: 4")
        }
    }
    // Test SlackModalView protocol
    @Test func modalViewProtocol() {
        struct TestModal: SlackModalView {
            let userName: String

            var title: TextObject {
                TextObject(type: .plainText, text: "Hello \(userName)")
            }

            var submit: TextObject? {
                TextObject(type: .plainText, text: "Submit")
            }

            var callbackId: String? {
                "test_modal"
            }

            var blocks: [BlockType] {
                Section {
                    Text("Welcome message for \(userName)")
                }

                Actions {
                    Button("Action 1").actionId("action1")
                    Button("Action 2").actionId("action2")
                }
            }
        }

        let modal = TestModal(userName: "Alice")
        let modalView = modal.build()

        #expect(modalView.title.text == "Hello Alice")
        #expect(modalView.submit?.text == "Submit")
        #expect(modalView.callbackId == "test_modal")
        #expect(modalView.blocks.count == 2)

        // Verify blocks
        if case .section(let section) = modalView.blocks[0] {
            #expect(section.text?.text == "Welcome message for Alice")
        } else {
            Issue.record("First block should be section")
        }

        if case .actions(let actions) = modalView.blocks[1] {
            #expect(actions.elements.count == 2)
        } else {
            Issue.record("Second block should be actions")
        }
    }

    // Test SlackHomeTabView protocol
    @Test func homeTabViewProtocol() {
        struct TestHomeTab: SlackHomeTabView {
            let items: [String]

            var externalId: String? {
                "test_home_tab"
            }

            var blocks: [BlockType] {
                Header {
                    Text("Home Tab")
                }

                for item in items {
                    Section {
                        Text(item)
                    }
                }
            }
        }

        let homeTab = TestHomeTab(items: ["Item 1", "Item 2"])
        let homeTabView = homeTab.build()

        #expect(homeTabView.externalId == "test_home_tab")
        #expect(homeTabView.blocks.count == 3) // 1 header + 2 sections

        if case .header(let header) = homeTabView.blocks[0] {
            #expect(header.text.text == "Home Tab")
        } else {
            Issue.record("First block should be header")
        }
    }

    // Test minimal modal with defaults
    @Test func minimalModalView() {
        struct MinimalModal: SlackModalView {
            var title: TextObject {
                TextObject(type: .plainText, text: "Minimal Modal")
            }

            var blocks: [BlockType] {
                Section {
                    Text("Just a title and content")
                }
            }
        }

        let modal = MinimalModal()
        let modalView = modal.build()

        #expect(modalView.title.text == "Minimal Modal")
        #expect(modalView.submit == nil)
        #expect(modalView.close == nil)
        #expect(modalView.callbackId == nil)
        #expect(modalView.blocks.count == 1)
    }
}

// Helper extensions for cleaner assertions
extension BlockType {
    var isHeader: Bool {
        if case .header = self { return true }
        return false
    }

    var isSection: Bool {
        if case .section = self { return true }
        return false
    }

    var isDivider: Bool {
        if case .divider = self { return true }
        return false
    }
}
