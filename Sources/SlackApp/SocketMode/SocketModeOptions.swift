public struct SocketModeOptions: OptionSet, RawRepresentable, Sendable {
    /// If enabled, ``SlackApp`` will automatically re-connect when the current connection ends.
    public static let autoReconnectWhenDisconnected = SocketModeOptions(rawValue: 1 << 0)

    /// If enabled, ``SlackApp`` will not propagate app-level errors to the caller and will continue
    /// waiting for the next message automatically.
    ///
    /// Any errors occured at lower-layer like following categories are not impacted with this and un-handled.
    ///
    /// * WebSocket library (WSClient)
    /// * Networking failure for WebSocket
    /// * JSON decoding errors (Please report this to get it fixed)
    public static let recoverFromAppError = SocketModeOptions(rawValue: 1 << 1)

    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
