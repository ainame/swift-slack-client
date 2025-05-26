@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Payload`.
public struct Payload: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Payload/action`.
    public var action: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/billing_reason`.
    public var billingReason: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Payload/bot_user_id`.
    public var botUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/bundle_size_kb`.
    public var bundleSizeKb: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Payload/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/current_step`.
    public var currentStep: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Payload/datastore_name`.
    public var datastoreName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/details`.
    public var details: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/error`.
    public var error: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/exec_outcome`.
    public var execOutcome: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/function_execution_id`.
    public var functionExecutionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/function_id`.
    public var functionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/function_name`.
    public var functionName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/function_type`.
    public var functionType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/inputs`.
    public var inputs: Inputs?
    /// - Remark: Generated from `#/components/schemas/Payload/is_billing_excluded`.
    public var isBillingExcluded: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Payload/log`.
    public var log: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/request_type`.
    public var requestType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/total_steps`.
    public var totalSteps: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Payload/trigger`.
    public var trigger: Trigger?
    /// - Remark: Generated from `#/components/schemas/Payload/type`.
    public var _type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/user_id`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Payload/workflow_name`.
    public var workflowName: Swift.String?
    /// Creates a new `Payload`.
    ///
    /// - Parameters:
    ///   - action:
    ///   - actor:
    ///   - billingReason:
    ///   - botUserId:
    ///   - bundleSizeKb:
    ///   - channelId:
    ///   - currentStep:
    ///   - datastoreName:
    ///   - details:
    ///   - error:
    ///   - execOutcome:
    ///   - functionExecutionId:
    ///   - functionId:
    ///   - functionName:
    ///   - functionType:
    ///   - inputs:
    ///   - isBillingExcluded:
    ///   - log:
    ///   - requestType:
    ///   - teamId:
    ///   - totalSteps:
    ///   - trigger:
    ///   - _type:
    ///   - userId:
    ///   - workflowName:
    public init(
        action: Swift.String? = nil,
        actor: Swift.String? = nil,
        billingReason: [Swift.String]? = nil,
        botUserId: Swift.String? = nil,
        bundleSizeKb: Swift.Int? = nil,
        channelId: Swift.String? = nil,
        currentStep: Swift.Int? = nil,
        datastoreName: Swift.String? = nil,
        details: Swift.String? = nil,
        error: Swift.String? = nil,
        execOutcome: Swift.String? = nil,
        functionExecutionId: Swift.String? = nil,
        functionId: Swift.String? = nil,
        functionName: Swift.String? = nil,
        functionType: Swift.String? = nil,
        inputs: Inputs? = nil,
        isBillingExcluded: Swift.Bool? = nil,
        log: Swift.String? = nil,
        requestType: Swift.String? = nil,
        teamId: Swift.String? = nil,
        totalSteps: Swift.Int? = nil,
        trigger: Trigger? = nil,
        _type: Swift.String? = nil,
        userId: Swift.String? = nil,
        workflowName: Swift.String? = nil
    ) {
        self.action = action
        self.actor = actor
        self.billingReason = billingReason
        self.botUserId = botUserId
        self.bundleSizeKb = bundleSizeKb
        self.channelId = channelId
        self.currentStep = currentStep
        self.datastoreName = datastoreName
        self.details = details
        self.error = error
        self.execOutcome = execOutcome
        self.functionExecutionId = functionExecutionId
        self.functionId = functionId
        self.functionName = functionName
        self.functionType = functionType
        self.inputs = inputs
        self.isBillingExcluded = isBillingExcluded
        self.log = log
        self.requestType = requestType
        self.teamId = teamId
        self.totalSteps = totalSteps
        self.trigger = trigger
        self._type = _type
        self.userId = userId
        self.workflowName = workflowName
    }
    public enum CodingKeys: String, CodingKey {
        case action
        case actor
        case billingReason = "billing_reason"
        case botUserId = "bot_user_id"
        case bundleSizeKb = "bundle_size_kb"
        case channelId = "channel_id"
        case currentStep = "current_step"
        case datastoreName = "datastore_name"
        case details
        case error
        case execOutcome = "exec_outcome"
        case functionExecutionId = "function_execution_id"
        case functionId = "function_id"
        case functionName = "function_name"
        case functionType = "function_type"
        case inputs
        case isBillingExcluded = "is_billing_excluded"
        case log
        case requestType = "request_type"
        case teamId = "team_id"
        case totalSteps = "total_steps"
        case trigger
        case _type = "type"
        case userId = "user_id"
        case workflowName = "workflow_name"
    }
}
