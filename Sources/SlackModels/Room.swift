public struct Room: Codable, Hashable, Sendable {
    public var id: Swift.String?
    public var name: Swift.String?
    public var recording: Recording?
    public var mediaServer: Swift.String?
    public var createdBy: Swift.String?
    public var dateStart: Swift.Int?
    public var dateEnd: Swift.Int?
    public var canvasThreadTs: Swift.String?
    public var threadRootTs: Swift.String?
    public var isDmCall: Swift.Bool?
    public var wasRejected: Swift.Bool?
    public var wasMissed: Swift.Bool?
    public var wasAccepted: Swift.Bool?
    public var hasEnded: Swift.Bool?
    public var backgroundId: Swift.String?
    public var canvasBackground: Swift.String?
    public var isPrewarmed: Swift.Bool?
    public var isScheduled: Swift.Bool?
    public var mediaBackendType: Swift.String?
    public var displayId: Swift.String?
    public var externalUniqueId: Swift.String?
    public var appId: Swift.String?
    public var callFamily: Swift.String?
    public var huddleLink: Swift.String?

    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        recording: Recording? = nil,
        mediaServer: Swift.String? = nil,
        createdBy: Swift.String? = nil,
        dateStart: Swift.Int? = nil,
        dateEnd: Swift.Int? = nil,
        canvasThreadTs: Swift.String? = nil,
        threadRootTs: Swift.String? = nil,
        isDmCall: Swift.Bool? = nil,
        wasRejected: Swift.Bool? = nil,
        wasMissed: Swift.Bool? = nil,
        wasAccepted: Swift.Bool? = nil,
        hasEnded: Swift.Bool? = nil,
        backgroundId: Swift.String? = nil,
        canvasBackground: Swift.String? = nil,
        isPrewarmed: Swift.Bool? = nil,
        isScheduled: Swift.Bool? = nil,
        mediaBackendType: Swift.String? = nil,
        displayId: Swift.String? = nil,
        externalUniqueId: Swift.String? = nil,
        appId: Swift.String? = nil,
        callFamily: Swift.String? = nil,
        huddleLink: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.recording = recording
        self.mediaServer = mediaServer
        self.createdBy = createdBy
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.canvasThreadTs = canvasThreadTs
        self.threadRootTs = threadRootTs
        self.isDmCall = isDmCall
        self.wasRejected = wasRejected
        self.wasMissed = wasMissed
        self.wasAccepted = wasAccepted
        self.hasEnded = hasEnded
        self.backgroundId = backgroundId
        self.canvasBackground = canvasBackground
        self.isPrewarmed = isPrewarmed
        self.isScheduled = isScheduled
        self.mediaBackendType = mediaBackendType
        self.displayId = displayId
        self.externalUniqueId = externalUniqueId
        self.appId = appId
        self.callFamily = callFamily
        self.huddleLink = huddleLink
    }
}
