@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Action`.
public struct Action: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Action/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/style`.
    public var style: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/value`.
    public var value: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/confirm`.
    public var confirm: ActionConfirm?
    /// - Remark: Generated from `#/components/schemas/Action/options`.
    public var options: [SelectedOptionElement]?
    /// - Remark: Generated from `#/components/schemas/Action/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/selectedOptions`.
    public var selectedOptions: [SelectedOptionElement]?
    /// - Remark: Generated from `#/components/schemas/Action/dataSource`.
    public var dataSource: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/minQueryLength`.
    public var minQueryLength: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Action/optionGroups`.
    public var optionGroups: [ActionOptionGroup]?
    /// Creates a new `Action`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - text:
    ///   - style:
    ///   - type:
    ///   - value:
    ///   - confirm:
    ///   - options:
    ///   - url:
    ///   - selectedOptions:
    ///   - dataSource:
    ///   - minQueryLength:
    ///   - optionGroups:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        text: Swift.String? = nil,
        style: Swift.String? = nil,
        type: Swift.String? = nil,
        value: Swift.String? = nil,
        confirm: ActionConfirm? = nil,
        options: [SelectedOptionElement]? = nil,
        url: Swift.String? = nil,
        selectedOptions: [SelectedOptionElement]? = nil,
        dataSource: Swift.String? = nil,
        minQueryLength: Swift.Int? = nil,
        optionGroups: [ActionOptionGroup]? = nil
    ) {
        self.id = id
        self.name = name
        self.text = text
        self.style = style
        self.type = type
        self.value = value
        self.confirm = confirm
        self.options = options
        self.url = url
        self.selectedOptions = selectedOptions
        self.dataSource = dataSource
        self.minQueryLength = minQueryLength
        self.optionGroups = optionGroups
    }
}
