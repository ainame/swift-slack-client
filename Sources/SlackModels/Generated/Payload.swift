#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/Payload`.
public struct Payload: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Payload/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/error`.
    public var error: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/log`.
    public var log: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/trigger`.
    public var trigger: SlackModels.Trigger?
    /// - Remark: Generated from `#/components/schemas/Payload/inputs`.
    public var inputs: SlackModels.Inputs?
    /// - Remark: Generated from `#/components/schemas/Payload/details`.
    public var details: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/action`.
    public var action: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/execOutcome`.
    public var execOutcome: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/workflowName`.
    public var workflowName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/functionName`.
    public var functionName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/functionType`.
    public var functionType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/functionId`.
    public var functionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/functionExecutionId`.
    public var functionExecutionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/totalSteps`.
    public var totalSteps: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Payload/currentStep`.
    public var currentStep: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Payload/billingReason`.
    public var billingReason: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Payload/isBillingExcluded`.
    public var isBillingExcluded: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Payload/channelId`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/botUserId`.
    public var botUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/requestType`.
    public var requestType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/datastoreName`.
    public var datastoreName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/bundleSizeKb`.
    public var bundleSizeKb: Swift.Int?
    /// Creates a new `Payload`.
    ///
    /// - Parameters:
    ///   - actor:
    ///   - error:
    ///   - log:
    ///   - type:
    ///   - trigger:
    ///   - inputs:
    ///   - details:
    ///   - action:
    ///   - execOutcome:
    ///   - workflowName:
    ///   - functionName:
    ///   - functionType:
    ///   - functionId:
    ///   - functionExecutionId:
    ///   - totalSteps:
    ///   - currentStep:
    ///   - billingReason:
    ///   - isBillingExcluded:
    ///   - channelId:
    ///   - botUserId:
    ///   - requestType:
    ///   - datastoreName:
    ///   - teamId:
    ///   - userId:
    ///   - bundleSizeKb:
    public init(
        actor: Swift.String? = nil,
        error: Swift.String? = nil,
        log: Swift.String? = nil,
        type: Swift.String? = nil,
        trigger: SlackModels.Trigger? = nil,
        inputs: SlackModels.Inputs? = nil,
        details: Swift.String? = nil,
        action: Swift.String? = nil,
        execOutcome: Swift.String? = nil,
        workflowName: Swift.String? = nil,
        functionName: Swift.String? = nil,
        functionType: Swift.String? = nil,
        functionId: Swift.String? = nil,
        functionExecutionId: Swift.String? = nil,
        totalSteps: Swift.Int? = nil,
        currentStep: Swift.Int? = nil,
        billingReason: [Swift.String]? = nil,
        isBillingExcluded: Swift.Bool? = nil,
        channelId: Swift.String? = nil,
        botUserId: Swift.String? = nil,
        requestType: Swift.String? = nil,
        datastoreName: Swift.String? = nil,
        teamId: Swift.String? = nil,
        userId: Swift.String? = nil,
        bundleSizeKb: Swift.Int? = nil
    ) {
        self.actor = actor
        self.error = error
        self.log = log
        self.type = type
        self.trigger = trigger
        self.inputs = inputs
        self.details = details
        self.action = action
        self.execOutcome = execOutcome
        self.workflowName = workflowName
        self.functionName = functionName
        self.functionType = functionType
        self.functionId = functionId
        self.functionExecutionId = functionExecutionId
        self.totalSteps = totalSteps
        self.currentStep = currentStep
        self.billingReason = billingReason
        self.isBillingExcluded = isBillingExcluded
        self.channelId = channelId
        self.botUserId = botUserId
        self.requestType = requestType
        self.datastoreName = datastoreName
        self.teamId = teamId
        self.userId = userId
        self.bundleSizeKb = bundleSizeKb
    }
}
