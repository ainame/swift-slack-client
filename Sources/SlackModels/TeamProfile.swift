import Foundation

public struct TeamProfile: Codable, Hashable, Sendable {
    public struct Field: Codable, Hashable, Sendable {
        public struct Options: Codable, Hashable, Sendable {
            public var isProtected: Swift.Bool?
            public var isScim: Swift.Bool?

            public init(
                isProtected: Swift.Bool? = nil,
                isScim: Swift.Bool? = nil,
            ) {
                self.isProtected = isProtected
                self.isScim = isScim
            }

            private enum CodingKeys: String, CodingKey {
                case isProtected = "is_protected"
                case isScim = "is_scim"
            }
        }

        public struct Permissions: Codable, Hashable, Sendable {
            public var api: [Swift.String]?
            public var ui: Swift.Bool?
            public var scim: Swift.Bool?

            public init(
                api: [Swift.String]? = nil,
                ui: Swift.Bool? = nil,
                scim: Swift.Bool? = nil,
            ) {
                self.api = api
                self.ui = ui
                self.scim = scim
            }
        }

        public var id: Swift.String?
        public var sectionId: Swift.String?
        public var fieldName: Swift.String?
        public var ordering: Swift.Int?
        public var label: Swift.String?
        public var hint: Swift.String?
        public var type: Swift.String?
        public var possibleValues: [Swift.String]?
        public var options: Options?
        public var isHidden: Swift.Bool?
        public var isInverse: Swift.Bool?
        public var permissions: Permissions?

        public init(
            id: Swift.String? = nil,
            sectionId: Swift.String? = nil,
            fieldName: Swift.String? = nil,
            ordering: Swift.Int? = nil,
            label: Swift.String? = nil,
            hint: Swift.String? = nil,
            type: Swift.String? = nil,
            possibleValues: [Swift.String]? = nil,
            options: Options? = nil,
            isHidden: Swift.Bool? = nil,
            isInverse: Swift.Bool? = nil,
            permissions: Permissions? = nil,
        ) {
            self.id = id
            self.sectionId = sectionId
            self.fieldName = fieldName
            self.ordering = ordering
            self.label = label
            self.hint = hint
            self.type = type
            self.possibleValues = possibleValues
            self.options = options
            self.isHidden = isHidden
            self.isInverse = isInverse
            self.permissions = permissions
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case sectionId = "section_id"
            case fieldName = "field_name"
            case ordering
            case label
            case hint
            case type
            case possibleValues = "possible_values"
            case options
            case isHidden = "is_hidden"
            case isInverse = "is_inverse"
            case permissions
        }
    }

    public struct Section: Codable, Hashable, Sendable {
        public var id: Swift.String?
        public var teamId: Swift.String?
        public var sectionType: Swift.String?
        public var label: Swift.String?
        public var order: Swift.Int?
        public var isHidden: Swift.Bool?

        public init(
            id: Swift.String? = nil,
            teamId: Swift.String? = nil,
            sectionType: Swift.String? = nil,
            label: Swift.String? = nil,
            order: Swift.Int? = nil,
            isHidden: Swift.Bool? = nil,
        ) {
            self.id = id
            self.teamId = teamId
            self.sectionType = sectionType
            self.label = label
            self.order = order
            self.isHidden = isHidden
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case teamId = "team_id"
            case sectionType = "section_type"
            case label
            case order
            case isHidden = "is_hidden"
        }
    }

    public var fields: [Field]?
    public var sections: [Section]?

    public init(
        fields: [Field]? = nil,
        sections: [Section]? = nil,
    ) {
        self.fields = fields
        self.sections = sections
    }
}
