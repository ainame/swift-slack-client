import Foundation
import HTTPTypes
import OpenAPIRuntime
@testable import SlackBlockKit
@testable import SlackClient
import Testing

struct FormEncodingMiddlewareTests {
    @Test
    func preservesTypedBlockKitPayloadsInFormEncoding() async throws {
        let blockValue = #"{"command":"git diff --stat main..HEAD && printf '\n---\n' && echo a&b=c","approved":true}"#
        let payload = Operations.ChatPostMessage.Input.Body.JsonPayload(
            blocks: [
                .section(SectionBlock(
                    text: .init(type: .mrkdwn, text: "*Approval required*\nReview diff", verbatim: true),
                )),
                .actions(ActionsBlock(
                    elements: [
                        .button(ButtonElement(
                            text: .init(type: .plainText, text: "Approve"),
                            actionId: "approval_approve",
                            value: blockValue,
                        )),
                    ],
                    blockId: "approval_actions",
                )),
            ],
            channel: "C123",
            replyBroadcast: true,
            text: "Approval required",
        )

        let jsonData = try JSONEncoder().encode(payload)
        var request = HTTPRequest(
            method: .post,
            scheme: "https",
            authority: "slack.com",
            path: "/api/chat.postMessage",
        )
        request.headerFields[HTTPField.Name.contentType] = "application/json; charset=utf-8"

        let middleware = FormEncodingMiddleware()
        let intercepted = try await middleware.intercept(
            request,
            body: HTTPBody(jsonData),
            baseURL: #require(URL(string: "https://slack.com/api")),
            operationID: "chatPostMessage",
            next: { request, body, _ in
                (HTTPResponse(status: .ok, headerFields: request.headerFields), body)
            },
        )

        #expect(intercepted.0.headerFields[HTTPField.Name.contentType] == "application/x-www-form-urlencoded")
        let body = try #require(intercepted.1)
        let formString = try await String(decoding: Data(collecting: body, upTo: .max), as: UTF8.self)
        let fields = try #require(parseFormBody(formString))

        #expect(fields["channel"] == "C123")
        #expect(fields["text"] == "Approval required")
        #expect(fields["reply_broadcast"] == "true")

        let blocksValue = try #require(fields["blocks"])
        let blocksData = try #require(blocksValue.data(using: String.Encoding.utf8))
        let blocks = try JSONDecoder().decode([Block].self, from: blocksData)

        guard case let .actions(actionsBlock)? = blocks.last,
              case let .button(buttonElement)? = actionsBlock.elements.first else {
            Issue.record("Expected final block to be an actions block with a button")
            return
        }

        #expect(buttonElement.value == blockValue)
    }

    private func parseFormBody(_ body: String) -> [String: String]? {
        var fields: [String: String] = [:]

        for pair in body.split(separator: "&") {
            guard let separatorIndex = pair.firstIndex(of: "=") else {
                return nil
            }
            let key = String(pair[..<separatorIndex]).removingPercentEncoding
            let value = String(pair[pair.index(after: separatorIndex)...]).removingPercentEncoding
            guard let key, let value else {
                return nil
            }
            fields[key] = value
        }

        return fields
    }
}
