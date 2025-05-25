public struct Recording: Codable, Hashable, Sendable {
    public var transcript: Swift.Bool?
    public var summary: Swift.Bool?
    public var notetaking: Swift.Bool?
    public var summaryStatus: Swift.String?
    public var canRecordSummary: Swift.String?

    public init(
        transcript: Swift.Bool? = nil,
        summary: Swift.Bool? = nil,
        notetaking: Swift.Bool? = nil,
        summaryStatus: Swift.String? = nil,
        canRecordSummary: Swift.String? = nil
    ) {
        self.transcript = transcript
        self.summary = summary
        self.notetaking = notetaking
        self.summaryStatus = summaryStatus
        self.canRecordSummary = canRecordSummary
    }
}
