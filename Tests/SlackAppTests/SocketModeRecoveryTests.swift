import Darwin
import Foundation
import NIOCore
@testable import SlackApp
import Testing

struct SocketModeRecoveryTests {
    @Test func socketModeReconnectsForTimedOutReadError() {
        let error = IOError(errnoCode: ETIMEDOUT, reason: "read(descriptor:pointer:size:)")

        #expect(SlackApp.shouldReconnectSocketMode(after: error))
    }

    @Test func socketModeDoesNotReconnectForOtherSocketErrors() {
        let error = IOError(errnoCode: ECONNRESET, reason: "read(descriptor:pointer:size:)")

        #expect(!SlackApp.shouldReconnectSocketMode(after: error))
    }

    @Test func socketModeDoesNotReconnectForNonIOErrors() {
        struct TestError: Error {}

        #expect(!SlackApp.shouldReconnectSocketMode(after: TestError()))
    }
}
