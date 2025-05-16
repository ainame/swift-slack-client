// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "postChatMessage",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "postChatMessage", targets: ["postChatMessage"])
    ],
    dependencies: [
        .package(path: "../../"),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client.git", from: "1.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "postChatMessage",
            dependencies: [
                .product(name: "SlackClient", package: "swift-slack-client"),
                .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
            ]
        ),
    ]
)
