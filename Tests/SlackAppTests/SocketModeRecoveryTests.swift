import Foundation
@testable import SlackApp
import Testing

struct SocketModeRecoveryTests {
    @Test func socketModeReconnectsForTimedOutReadError() {
        let error = NSError(
            domain: "NIO",
            code: 60,
            userInfo: [
                NSLocalizedDescriptionKey: "read(descriptor:pointer:size:): Operation timed out) (errno: 60)",
            ]
        )

        #expect(SlackApp.shouldReconnectSocketMode(after: error))
    }

    @Test func socketModeDoesNotReconnectForOtherSocketErrors() {
        let error = NSError(
            domain: "NIO",
            code: 54,
            userInfo: [
                NSLocalizedDescriptionKey: "read(descriptor:pointer:size:): Connection reset by peer) (errno: 54)",
            ]
        )

        #expect(!SlackApp.shouldReconnectSocketMode(after: error))
    }

    @Test func socketModeReconnectsForTimedOutNSErrorFallback() {
        let error = NSError(
            domain: "NIO",
            code: 60,
            userInfo: [
                NSLocalizedDescriptionKey: "read(descriptor:pointer:size:): Operation timed out) (errno: 60)",
            ]
        )

        #expect(SlackApp.shouldReconnectSocketMode(after: error))
    }
}
