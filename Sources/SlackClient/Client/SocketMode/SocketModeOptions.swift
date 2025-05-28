public struct SocketModeOptions: OptionSet, RawRepresentable, Sendable {
    /// If enabled, ``Slack`` instance will automatically re-connect when the current connection ends
    public static let autoReconnectWhenDisconnected = SocketModeOptions(rawValue: 1 << 0)

    /// If enabled, `Slack.runInSocketMode` will not propagte app-level error to call-site
    /// and continue waiting for next message automatically. You can still handle the error
    /// with ``SocketModeMessageRouter.onError`` but the error will be thrown unless opt-out this.
    ///
    /// Any errors occured at lower-layer like following categories are not impacted with this and un-handled.
    ///
    /// * WebSocket library (WSClietn)
    /// * Networking failure for WebSocket
    /// * JSON decoding errors (Please report this to get it fixed)
    public static let recoverFromAppError = SocketModeOptions(rawValue: 1 << 1)

    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
