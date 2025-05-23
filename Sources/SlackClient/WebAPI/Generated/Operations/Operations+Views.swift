// Generated by swift-openapi-generator, do not modify.
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

#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
/// API operations, with input and output types, generated from `#/paths` in the OpenAPI document.

#if WebAPI_Views
extension Operations {
public enum ViewsOpen {
    public static let id: Swift.String = "viewsOpen"
    public struct Input: Sendable, Hashable {
        /// - Remark: Generated from `#/paths/views.open/POST/header`.
        public struct Headers: Sendable, Hashable {
            public var accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsOpen.AcceptableContentType>]
            /// Creates a new `Headers`.
            ///
            /// - Parameters:
            ///   - accept:
            public init(accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsOpen.AcceptableContentType>] = .defaultValues()) {
                self.accept = accept
            }
        }
        public var headers: Operations.ViewsOpen.Input.Headers
        /// - Remark: Generated from `#/paths/views.open/POST/requestBody`.
        @frozen public enum Body: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.open/POST/requestBody/json`.
            public struct JsonPayload: Codable, Hashable, Sendable {
                /// - Remark: Generated from `#/paths/views.open/POST/requestBody/json/view`.
                public var view: SlackBlockKit.ViewType
                /// Exchange a trigger to post to the user.
                ///
                /// - Remark: Generated from `#/paths/views.open/POST/requestBody/json/triggerId`.
                public var triggerId: Swift.String?
                /// Exchange an interactivity pointer to post to the user.
                ///
                /// - Remark: Generated from `#/paths/views.open/POST/requestBody/json/interactivityPointer`.
                public var interactivityPointer: Swift.String?
                /// Creates a new `JsonPayload`.
                ///
                /// - Parameters:
                ///   - view:
                ///   - triggerId: Exchange a trigger to post to the user.
                ///   - interactivityPointer: Exchange an interactivity pointer to post to the user.
                public init(
                    view: SlackBlockKit.ViewType,
                    triggerId: Swift.String? = nil,
                    interactivityPointer: Swift.String? = nil
                ) {
                    self.view = view
                    self.triggerId = triggerId
                    self.interactivityPointer = interactivityPointer
                }
                public enum CodingKeys: String, CodingKey {
                    case view
                    case triggerId
                    case interactivityPointer
                }
            }
            /// - Remark: Generated from `#/paths/views.open/POST/requestBody/content/application\/json`.
            case json(Operations.ViewsOpen.Input.Body.JsonPayload)
        }
        public var body: Operations.ViewsOpen.Input.Body
        /// Creates a new `Input`.
        ///
        /// - Parameters:
        ///   - headers:
        ///   - body:
        public init(
            headers: Operations.ViewsOpen.Input.Headers = .init(),
            body: Operations.ViewsOpen.Input.Body
        ) {
            self.headers = headers
            self.body = body
        }
    }
    @frozen public enum Output: Sendable, Hashable {
        public struct Ok: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.open/POST/responses/200/content`.
            @frozen public enum Body: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/views.open/POST/responses/200/content/application\/json`.
                case json(Components.Schemas.ViewsOpenResponse)
                /// The associated value of the enum case if `self` is `.json`.
                ///
                /// - Throws: An error if `self` is not `.json`.
                /// - SeeAlso: `.json`.
                public var json: Components.Schemas.ViewsOpenResponse {
                    get throws {
                        switch self {
                        case let .json(body):
                            return body
                        }
                    }
                }
            }
            /// Received HTTP response body
            public var body: Operations.ViewsOpen.Output.Ok.Body
            /// Creates a new `Ok`.
            ///
            /// - Parameters:
            ///   - body: Received HTTP response body
            public init(body: Operations.ViewsOpen.Output.Ok.Body) {
                self.body = body
            }
        }
        /// OK
        ///
        /// - Remark: Generated from `#/paths//views.open/post(viewsOpen)/responses/200`.
        ///
        /// HTTP response code: `200 ok`.
        case ok(Operations.ViewsOpen.Output.Ok)
        /// The associated value of the enum case if `self` is `.ok`.
        ///
        /// - Throws: An error if `self` is not `.ok`.
        /// - SeeAlso: `.ok`.
        public var ok: Operations.ViewsOpen.Output.Ok {
            get throws {
                switch self {
                case let .ok(response):
                    return response
                default:
                    try throwUnexpectedResponseStatus(
                        expectedStatus: "ok",
                        response: self
                    )
                }
            }
        }
        /// Undocumented response.
        ///
        /// A response with a code that is not documented in the OpenAPI document.
        case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
    }
    @frozen public enum AcceptableContentType: AcceptableProtocol {
        case json
        case other(Swift.String)
        public init?(rawValue: Swift.String) {
            switch rawValue.lowercased() {
            case "application/json":
                self = .json
            default:
                self = .other(rawValue)
            }
        }
        public var rawValue: Swift.String {
            switch self {
            case let .other(string):
                return string
            case .json:
                return "application/json"
            }
        }
        public static var allCases: [Self] {
            [
                .json
            ]
        }
    }
}
public enum ViewsPublish {
    public static let id: Swift.String = "viewsPublish"
    public struct Input: Sendable, Hashable {
        /// - Remark: Generated from `#/paths/views.publish/POST/header`.
        public struct Headers: Sendable, Hashable {
            public var accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsPublish.AcceptableContentType>]
            /// Creates a new `Headers`.
            ///
            /// - Parameters:
            ///   - accept:
            public init(accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsPublish.AcceptableContentType>] = .defaultValues()) {
                self.accept = accept
            }
        }
        public var headers: Operations.ViewsPublish.Input.Headers
        /// - Remark: Generated from `#/paths/views.publish/POST/requestBody`.
        @frozen public enum Body: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.publish/POST/requestBody/json`.
            public struct JsonPayload: Codable, Hashable, Sendable {
                /// id of the user you want publish a view to.
                ///
                /// - Remark: Generated from `#/paths/views.publish/POST/requestBody/json/userId`.
                public var userId: Swift.String
                /// - Remark: Generated from `#/paths/views.publish/POST/requestBody/json/view`.
                public var view: SlackBlockKit.ViewType
                /// A string that represents view state to protect against possible race conditions.
                ///
                /// - Remark: Generated from `#/paths/views.publish/POST/requestBody/json/hash`.
                public var hash: Swift.String?
                /// Creates a new `JsonPayload`.
                ///
                /// - Parameters:
                ///   - userId: id of the user you want publish a view to.
                ///   - view:
                ///   - hash: A string that represents view state to protect against possible race conditions.
                public init(
                    userId: Swift.String,
                    view: SlackBlockKit.ViewType,
                    hash: Swift.String? = nil
                ) {
                    self.userId = userId
                    self.view = view
                    self.hash = hash
                }
                public enum CodingKeys: String, CodingKey {
                    case userId
                    case view
                    case hash
                }
            }
            /// - Remark: Generated from `#/paths/views.publish/POST/requestBody/content/application\/json`.
            case json(Operations.ViewsPublish.Input.Body.JsonPayload)
        }
        public var body: Operations.ViewsPublish.Input.Body
        /// Creates a new `Input`.
        ///
        /// - Parameters:
        ///   - headers:
        ///   - body:
        public init(
            headers: Operations.ViewsPublish.Input.Headers = .init(),
            body: Operations.ViewsPublish.Input.Body
        ) {
            self.headers = headers
            self.body = body
        }
    }
    @frozen public enum Output: Sendable, Hashable {
        public struct Ok: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.publish/POST/responses/200/content`.
            @frozen public enum Body: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/views.publish/POST/responses/200/content/application\/json`.
                case json(Components.Schemas.ViewsPublishResponse)
                /// The associated value of the enum case if `self` is `.json`.
                ///
                /// - Throws: An error if `self` is not `.json`.
                /// - SeeAlso: `.json`.
                public var json: Components.Schemas.ViewsPublishResponse {
                    get throws {
                        switch self {
                        case let .json(body):
                            return body
                        }
                    }
                }
            }
            /// Received HTTP response body
            public var body: Operations.ViewsPublish.Output.Ok.Body
            /// Creates a new `Ok`.
            ///
            /// - Parameters:
            ///   - body: Received HTTP response body
            public init(body: Operations.ViewsPublish.Output.Ok.Body) {
                self.body = body
            }
        }
        /// OK
        ///
        /// - Remark: Generated from `#/paths//views.publish/post(viewsPublish)/responses/200`.
        ///
        /// HTTP response code: `200 ok`.
        case ok(Operations.ViewsPublish.Output.Ok)
        /// The associated value of the enum case if `self` is `.ok`.
        ///
        /// - Throws: An error if `self` is not `.ok`.
        /// - SeeAlso: `.ok`.
        public var ok: Operations.ViewsPublish.Output.Ok {
            get throws {
                switch self {
                case let .ok(response):
                    return response
                default:
                    try throwUnexpectedResponseStatus(
                        expectedStatus: "ok",
                        response: self
                    )
                }
            }
        }
        /// Undocumented response.
        ///
        /// A response with a code that is not documented in the OpenAPI document.
        case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
    }
    @frozen public enum AcceptableContentType: AcceptableProtocol {
        case json
        case other(Swift.String)
        public init?(rawValue: Swift.String) {
            switch rawValue.lowercased() {
            case "application/json":
                self = .json
            default:
                self = .other(rawValue)
            }
        }
        public var rawValue: Swift.String {
            switch self {
            case let .other(string):
                return string
            case .json:
                return "application/json"
            }
        }
        public static var allCases: [Self] {
            [
                .json
            ]
        }
    }
}
public enum ViewsPush {
    public static let id: Swift.String = "viewsPush"
    public struct Input: Sendable, Hashable {
        /// - Remark: Generated from `#/paths/views.push/POST/header`.
        public struct Headers: Sendable, Hashable {
            public var accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsPush.AcceptableContentType>]
            /// Creates a new `Headers`.
            ///
            /// - Parameters:
            ///   - accept:
            public init(accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsPush.AcceptableContentType>] = .defaultValues()) {
                self.accept = accept
            }
        }
        public var headers: Operations.ViewsPush.Input.Headers
        /// - Remark: Generated from `#/paths/views.push/POST/requestBody`.
        @frozen public enum Body: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.push/POST/requestBody/json`.
            public struct JsonPayload: Codable, Hashable, Sendable {
                /// - Remark: Generated from `#/paths/views.push/POST/requestBody/json/view`.
                public var view: SlackBlockKit.ViewType
                /// Exchange a trigger to post to the user.
                ///
                /// - Remark: Generated from `#/paths/views.push/POST/requestBody/json/triggerId`.
                public var triggerId: Swift.String?
                /// Exchange an interactivity pointer to post to the user.
                ///
                /// - Remark: Generated from `#/paths/views.push/POST/requestBody/json/interactivityPointer`.
                public var interactivityPointer: Swift.String?
                /// Creates a new `JsonPayload`.
                ///
                /// - Parameters:
                ///   - view:
                ///   - triggerId: Exchange a trigger to post to the user.
                ///   - interactivityPointer: Exchange an interactivity pointer to post to the user.
                public init(
                    view: SlackBlockKit.ViewType,
                    triggerId: Swift.String? = nil,
                    interactivityPointer: Swift.String? = nil
                ) {
                    self.view = view
                    self.triggerId = triggerId
                    self.interactivityPointer = interactivityPointer
                }
                public enum CodingKeys: String, CodingKey {
                    case view
                    case triggerId
                    case interactivityPointer
                }
            }
            /// - Remark: Generated from `#/paths/views.push/POST/requestBody/content/application\/json`.
            case json(Operations.ViewsPush.Input.Body.JsonPayload)
        }
        public var body: Operations.ViewsPush.Input.Body
        /// Creates a new `Input`.
        ///
        /// - Parameters:
        ///   - headers:
        ///   - body:
        public init(
            headers: Operations.ViewsPush.Input.Headers = .init(),
            body: Operations.ViewsPush.Input.Body
        ) {
            self.headers = headers
            self.body = body
        }
    }
    @frozen public enum Output: Sendable, Hashable {
        public struct Ok: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.push/POST/responses/200/content`.
            @frozen public enum Body: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/views.push/POST/responses/200/content/application\/json`.
                case json(Components.Schemas.ViewsPushResponse)
                /// The associated value of the enum case if `self` is `.json`.
                ///
                /// - Throws: An error if `self` is not `.json`.
                /// - SeeAlso: `.json`.
                public var json: Components.Schemas.ViewsPushResponse {
                    get throws {
                        switch self {
                        case let .json(body):
                            return body
                        }
                    }
                }
            }
            /// Received HTTP response body
            public var body: Operations.ViewsPush.Output.Ok.Body
            /// Creates a new `Ok`.
            ///
            /// - Parameters:
            ///   - body: Received HTTP response body
            public init(body: Operations.ViewsPush.Output.Ok.Body) {
                self.body = body
            }
        }
        /// OK
        ///
        /// - Remark: Generated from `#/paths//views.push/post(viewsPush)/responses/200`.
        ///
        /// HTTP response code: `200 ok`.
        case ok(Operations.ViewsPush.Output.Ok)
        /// The associated value of the enum case if `self` is `.ok`.
        ///
        /// - Throws: An error if `self` is not `.ok`.
        /// - SeeAlso: `.ok`.
        public var ok: Operations.ViewsPush.Output.Ok {
            get throws {
                switch self {
                case let .ok(response):
                    return response
                default:
                    try throwUnexpectedResponseStatus(
                        expectedStatus: "ok",
                        response: self
                    )
                }
            }
        }
        /// Undocumented response.
        ///
        /// A response with a code that is not documented in the OpenAPI document.
        case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
    }
    @frozen public enum AcceptableContentType: AcceptableProtocol {
        case json
        case other(Swift.String)
        public init?(rawValue: Swift.String) {
            switch rawValue.lowercased() {
            case "application/json":
                self = .json
            default:
                self = .other(rawValue)
            }
        }
        public var rawValue: Swift.String {
            switch self {
            case let .other(string):
                return string
            case .json:
                return "application/json"
            }
        }
        public static var allCases: [Self] {
            [
                .json
            ]
        }
    }
}
public enum ViewsUpdate {
    public static let id: Swift.String = "viewsUpdate"
    public struct Input: Sendable, Hashable {
        /// - Remark: Generated from `#/paths/views.update/POST/header`.
        public struct Headers: Sendable, Hashable {
            public var accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsUpdate.AcceptableContentType>]
            /// Creates a new `Headers`.
            ///
            /// - Parameters:
            ///   - accept:
            public init(accept: [OpenAPIRuntime.AcceptHeaderContentType<Operations.ViewsUpdate.AcceptableContentType>] = .defaultValues()) {
                self.accept = accept
            }
        }
        public var headers: Operations.ViewsUpdate.Input.Headers
        /// - Remark: Generated from `#/paths/views.update/POST/requestBody`.
        @frozen public enum Body: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.update/POST/requestBody/json`.
            public struct JsonPayload: Codable, Hashable, Sendable {
                /// - Remark: Generated from `#/paths/views.update/POST/requestBody/json/view`.
                public var view: SlackBlockKit.ViewType
                /// A unique identifier of the view set by the developer. Must be unique for all views on a team. Max length of 255 characters. Either view_id or external_id is required.
                ///
                /// - Remark: Generated from `#/paths/views.update/POST/requestBody/json/externalId`.
                public var externalId: Swift.String?
                /// A unique identifier of the view to be updated. Either view_id or external_id is required.
                ///
                /// - Remark: Generated from `#/paths/views.update/POST/requestBody/json/viewId`.
                public var viewId: Swift.String?
                /// A string that represents view state to protect against possible race conditions.
                ///
                /// - Remark: Generated from `#/paths/views.update/POST/requestBody/json/hash`.
                public var hash: Swift.String?
                /// Creates a new `JsonPayload`.
                ///
                /// - Parameters:
                ///   - view:
                ///   - externalId: A unique identifier of the view set by the developer. Must be unique for all views on a team. Max length of 255 characters. Either view_id or external_id is required.
                ///   - viewId: A unique identifier of the view to be updated. Either view_id or external_id is required.
                ///   - hash: A string that represents view state to protect against possible race conditions.
                public init(
                    view: SlackBlockKit.ViewType,
                    externalId: Swift.String? = nil,
                    viewId: Swift.String? = nil,
                    hash: Swift.String? = nil
                ) {
                    self.view = view
                    self.externalId = externalId
                    self.viewId = viewId
                    self.hash = hash
                }
                public enum CodingKeys: String, CodingKey {
                    case view
                    case externalId
                    case viewId
                    case hash
                }
            }
            /// - Remark: Generated from `#/paths/views.update/POST/requestBody/content/application\/json`.
            case json(Operations.ViewsUpdate.Input.Body.JsonPayload)
        }
        public var body: Operations.ViewsUpdate.Input.Body
        /// Creates a new `Input`.
        ///
        /// - Parameters:
        ///   - headers:
        ///   - body:
        public init(
            headers: Operations.ViewsUpdate.Input.Headers = .init(),
            body: Operations.ViewsUpdate.Input.Body
        ) {
            self.headers = headers
            self.body = body
        }
    }
    @frozen public enum Output: Sendable, Hashable {
        public struct Ok: Sendable, Hashable {
            /// - Remark: Generated from `#/paths/views.update/POST/responses/200/content`.
            @frozen public enum Body: Sendable, Hashable {
                /// - Remark: Generated from `#/paths/views.update/POST/responses/200/content/application\/json`.
                case json(Components.Schemas.ViewsUpdateResponse)
                /// The associated value of the enum case if `self` is `.json`.
                ///
                /// - Throws: An error if `self` is not `.json`.
                /// - SeeAlso: `.json`.
                public var json: Components.Schemas.ViewsUpdateResponse {
                    get throws {
                        switch self {
                        case let .json(body):
                            return body
                        }
                    }
                }
            }
            /// Received HTTP response body
            public var body: Operations.ViewsUpdate.Output.Ok.Body
            /// Creates a new `Ok`.
            ///
            /// - Parameters:
            ///   - body: Received HTTP response body
            public init(body: Operations.ViewsUpdate.Output.Ok.Body) {
                self.body = body
            }
        }
        /// OK
        ///
        /// - Remark: Generated from `#/paths//views.update/post(viewsUpdate)/responses/200`.
        ///
        /// HTTP response code: `200 ok`.
        case ok(Operations.ViewsUpdate.Output.Ok)
        /// The associated value of the enum case if `self` is `.ok`.
        ///
        /// - Throws: An error if `self` is not `.ok`.
        /// - SeeAlso: `.ok`.
        public var ok: Operations.ViewsUpdate.Output.Ok {
            get throws {
                switch self {
                case let .ok(response):
                    return response
                default:
                    try throwUnexpectedResponseStatus(
                        expectedStatus: "ok",
                        response: self
                    )
                }
            }
        }
        /// Undocumented response.
        ///
        /// A response with a code that is not documented in the OpenAPI document.
        case undocumented(statusCode: Swift.Int, OpenAPIRuntime.UndocumentedPayload)
    }
    @frozen public enum AcceptableContentType: AcceptableProtocol {
        case json
        case other(Swift.String)
        public init?(rawValue: Swift.String) {
            switch rawValue.lowercased() {
            case "application/json":
                self = .json
            default:
                self = .other(rawValue)
            }
        }
        public var rawValue: Swift.String {
            switch self {
            case let .other(string):
                return string
            case .json:
                return "application/json"
            }
        }
        public static var allCases: [Self] {
            [
                .json
            ]
        }
    }
}
}
#endif
