#if WebAPI_DND
// Generated by swift-openapi-generator, do not modify.
@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif
import HTTPTypes

extension Client {
    /// Ends the current user's Do Not Disturb session immediately.
    ///
    /// - Remark: HTTP `POST /dnd.endDnd`.
    /// - Remark: Generated from `#/paths//dnd.endDnd/post(dndEndDnd)`.
    func dndEndDnd(_ input: Operations.DndEndDnd.Input) async throws -> Operations.DndEndDnd.Output {
        try await client.send(
            input: input,
            forOperation: Operations.DndEndDnd.id,
            serializer: { input in
                let path = try converter.renderedPath(
                    template: "/dnd.endDnd",
                    parameters: [],
                )
                var request: HTTPTypes.HTTPRequest = .init(
                    soar_path: path,
                    method: .post,
                )
                suppressMutabilityWarning(&request)
                converter.setAcceptHeader(
                    in: &request.headerFields,
                    contentTypes: input.headers.accept,
                )
                let body: OpenAPIRuntime.HTTPBody? = switch input.body {
                case .none:
                    nil
                case let .json(value):
                    try converter.setOptionalRequestBodyAsJSON(
                        value,
                        headerFields: &request.headerFields,
                        contentType: "application/json; charset=utf-8",
                    )
                }
                return (request, body)
            },
            deserializer: { response, responseBody in
                switch response.status.code {
                case 200:
                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
                    let body: Operations.DndEndDnd.Output.Ok.Body
                    let chosenContentType = try converter.bestContentType(
                        received: contentType,
                        options: [
                            "application/json",
                        ],
                    )
                    switch chosenContentType {
                    case "application/json":
                        body = try await converter.getResponseBodyAsJSON(
                            Components.Schemas.DndEndDndResponse.self,
                            from: responseBody,
                            transforming: { value in
                                .json(value)
                            },
                        )
                    default:
                        preconditionFailure("bestContentType chose an invalid content type.")
                    }
                    return .ok(.init(body: body))
                default:
                    return .undocumented(
                        statusCode: response.status.code,
                        .init(
                            headerFields: response.headerFields,
                            body: responseBody,
                        ),
                    )
                }
            },
        )
    }

    /// Ends the current user's snooze mode immediately.
    ///
    /// - Remark: HTTP `POST /dnd.endSnooze`.
    /// - Remark: Generated from `#/paths//dnd.endSnooze/post(dndEndSnooze)`.
    func dndEndSnooze(_ input: Operations.DndEndSnooze.Input) async throws -> Operations.DndEndSnooze.Output {
        try await client.send(
            input: input,
            forOperation: Operations.DndEndSnooze.id,
            serializer: { input in
                let path = try converter.renderedPath(
                    template: "/dnd.endSnooze",
                    parameters: [],
                )
                var request: HTTPTypes.HTTPRequest = .init(
                    soar_path: path,
                    method: .post,
                )
                suppressMutabilityWarning(&request)
                converter.setAcceptHeader(
                    in: &request.headerFields,
                    contentTypes: input.headers.accept,
                )
                let body: OpenAPIRuntime.HTTPBody? = switch input.body {
                case .none:
                    nil
                case let .json(value):
                    try converter.setOptionalRequestBodyAsJSON(
                        value,
                        headerFields: &request.headerFields,
                        contentType: "application/json; charset=utf-8",
                    )
                }
                return (request, body)
            },
            deserializer: { response, responseBody in
                switch response.status.code {
                case 200:
                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
                    let body: Operations.DndEndSnooze.Output.Ok.Body
                    let chosenContentType = try converter.bestContentType(
                        received: contentType,
                        options: [
                            "application/json",
                        ],
                    )
                    switch chosenContentType {
                    case "application/json":
                        body = try await converter.getResponseBodyAsJSON(
                            Components.Schemas.DndEndSnoozeResponse.self,
                            from: responseBody,
                            transforming: { value in
                                .json(value)
                            },
                        )
                    default:
                        preconditionFailure("bestContentType chose an invalid content type.")
                    }
                    return .ok(.init(body: body))
                default:
                    return .undocumented(
                        statusCode: response.status.code,
                        .init(
                            headerFields: response.headerFields,
                            body: responseBody,
                        ),
                    )
                }
            },
        )
    }

    /// Retrieves a user's current Do Not Disturb status.
    ///
    /// - Remark: HTTP `POST /dnd.info`.
    /// - Remark: Generated from `#/paths//dnd.info/post(dndInfo)`.
    func dndInfo(_ input: Operations.DndInfo.Input) async throws -> Operations.DndInfo.Output {
        try await client.send(
            input: input,
            forOperation: Operations.DndInfo.id,
            serializer: { input in
                let path = try converter.renderedPath(
                    template: "/dnd.info",
                    parameters: [],
                )
                var request: HTTPTypes.HTTPRequest = .init(
                    soar_path: path,
                    method: .post,
                )
                suppressMutabilityWarning(&request)
                converter.setAcceptHeader(
                    in: &request.headerFields,
                    contentTypes: input.headers.accept,
                )
                let body: OpenAPIRuntime.HTTPBody? = switch input.body {
                case let .json(value):
                    try converter.setRequiredRequestBodyAsJSON(
                        value,
                        headerFields: &request.headerFields,
                        contentType: "application/json; charset=utf-8",
                    )
                }
                return (request, body)
            },
            deserializer: { response, responseBody in
                switch response.status.code {
                case 200:
                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
                    let body: Operations.DndInfo.Output.Ok.Body
                    let chosenContentType = try converter.bestContentType(
                        received: contentType,
                        options: [
                            "application/json",
                        ],
                    )
                    switch chosenContentType {
                    case "application/json":
                        body = try await converter.getResponseBodyAsJSON(
                            Components.Schemas.DndInfoResponse.self,
                            from: responseBody,
                            transforming: { value in
                                .json(value)
                            },
                        )
                    default:
                        preconditionFailure("bestContentType chose an invalid content type.")
                    }
                    return .ok(.init(body: body))
                default:
                    return .undocumented(
                        statusCode: response.status.code,
                        .init(
                            headerFields: response.headerFields,
                            body: responseBody,
                        ),
                    )
                }
            },
        )
    }

    /// Turns on Do Not Disturb mode for the current user, or changes its duration.
    ///
    /// - Remark: HTTP `POST /dnd.setSnooze`.
    /// - Remark: Generated from `#/paths//dnd.setSnooze/post(dndSetSnooze)`.
    func dndSetSnooze(_ input: Operations.DndSetSnooze.Input) async throws -> Operations.DndSetSnooze.Output {
        try await client.send(
            input: input,
            forOperation: Operations.DndSetSnooze.id,
            serializer: { input in
                let path = try converter.renderedPath(
                    template: "/dnd.setSnooze",
                    parameters: [],
                )
                var request: HTTPTypes.HTTPRequest = .init(
                    soar_path: path,
                    method: .post,
                )
                suppressMutabilityWarning(&request)
                converter.setAcceptHeader(
                    in: &request.headerFields,
                    contentTypes: input.headers.accept,
                )
                let body: OpenAPIRuntime.HTTPBody? = switch input.body {
                case let .json(value):
                    try converter.setRequiredRequestBodyAsJSON(
                        value,
                        headerFields: &request.headerFields,
                        contentType: "application/json; charset=utf-8",
                    )
                }
                return (request, body)
            },
            deserializer: { response, responseBody in
                switch response.status.code {
                case 200:
                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
                    let body: Operations.DndSetSnooze.Output.Ok.Body
                    let chosenContentType = try converter.bestContentType(
                        received: contentType,
                        options: [
                            "application/json",
                        ],
                    )
                    switch chosenContentType {
                    case "application/json":
                        body = try await converter.getResponseBodyAsJSON(
                            Components.Schemas.DndSetSnoozeResponse.self,
                            from: responseBody,
                            transforming: { value in
                                .json(value)
                            },
                        )
                    default:
                        preconditionFailure("bestContentType chose an invalid content type.")
                    }
                    return .ok(.init(body: body))
                default:
                    return .undocumented(
                        statusCode: response.status.code,
                        .init(
                            headerFields: response.headerFields,
                            body: responseBody,
                        ),
                    )
                }
            },
        )
    }

    /// Retrieves the Do Not Disturb status for up to 50 users on a team.
    ///
    /// - Remark: HTTP `POST /dnd.teamInfo`.
    /// - Remark: Generated from `#/paths//dnd.teamInfo/post(dndTeamInfo)`.
    func dndTeamInfo(_ input: Operations.DndTeamInfo.Input) async throws -> Operations.DndTeamInfo.Output {
        try await client.send(
            input: input,
            forOperation: Operations.DndTeamInfo.id,
            serializer: { input in
                let path = try converter.renderedPath(
                    template: "/dnd.teamInfo",
                    parameters: [],
                )
                var request: HTTPTypes.HTTPRequest = .init(
                    soar_path: path,
                    method: .post,
                )
                suppressMutabilityWarning(&request)
                converter.setAcceptHeader(
                    in: &request.headerFields,
                    contentTypes: input.headers.accept,
                )
                let body: OpenAPIRuntime.HTTPBody? = switch input.body {
                case let .json(value):
                    try converter.setRequiredRequestBodyAsJSON(
                        value,
                        headerFields: &request.headerFields,
                        contentType: "application/json; charset=utf-8",
                    )
                }
                return (request, body)
            },
            deserializer: { response, responseBody in
                switch response.status.code {
                case 200:
                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
                    let body: Operations.DndTeamInfo.Output.Ok.Body
                    let chosenContentType = try converter.bestContentType(
                        received: contentType,
                        options: [
                            "application/json",
                        ],
                    )
                    switch chosenContentType {
                    case "application/json":
                        body = try await converter.getResponseBodyAsJSON(
                            Components.Schemas.DndTeamInfoResponse.self,
                            from: responseBody,
                            transforming: { value in
                                .json(value)
                            },
                        )
                    default:
                        preconditionFailure("bestContentType chose an invalid content type.")
                    }
                    return .ok(.init(body: body))
                default:
                    return .undocumented(
                        statusCode: response.status.code,
                        .init(
                            headerFields: response.headerFields,
                            body: responseBody,
                        ),
                    )
                }
            },
        )
    }
}
#endif
