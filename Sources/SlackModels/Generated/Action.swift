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

/// - Remark: Generated from `#/components/schemas/Action`.
public struct Action: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Action/confirm`.
    public var confirm: ActionConfirm?
    /// - Remark: Generated from `#/components/schemas/Action/data_source`.
    public var dataSource: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/min_query_length`.
    public var minQueryLength: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Action/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/option_groups`.
    public var optionGroups: [ActionOptionGroup]?
    /// - Remark: Generated from `#/components/schemas/Action/options`.
    public var options: [SelectedOptionElement]?
    /// - Remark: Generated from `#/components/schemas/Action/selected_options`.
    public var selectedOptions: [SelectedOptionElement]?
    /// - Remark: Generated from `#/components/schemas/Action/style`.
    public var style: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Action/value`.
    public var value: Swift.String?
    /// Creates a new `Action`.
    ///
    /// - Parameters:
    ///   - confirm:
    ///   - dataSource:
    ///   - id:
    ///   - minQueryLength:
    ///   - name:
    ///   - optionGroups:
    ///   - options:
    ///   - selectedOptions:
    ///   - style:
    ///   - text:
    ///   - type:
    ///   - url:
    ///   - value:
    public init(
        confirm: ActionConfirm? = nil,
        dataSource: Swift.String? = nil,
        id: Swift.String? = nil,
        minQueryLength: Swift.Int? = nil,
        name: Swift.String? = nil,
        optionGroups: [ActionOptionGroup]? = nil,
        options: [SelectedOptionElement]? = nil,
        selectedOptions: [SelectedOptionElement]? = nil,
        style: Swift.String? = nil,
        text: Swift.String? = nil,
        type: Swift.String? = nil,
        url: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.confirm = confirm
        self.dataSource = dataSource
        self.id = id
        self.minQueryLength = minQueryLength
        self.name = name
        self.optionGroups = optionGroups
        self.options = options
        self.selectedOptions = selectedOptions
        self.style = style
        self.text = text
        self.type = type
        self.url = url
        self.value = value
    }
}
