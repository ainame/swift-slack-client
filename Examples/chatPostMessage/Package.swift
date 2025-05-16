// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "chatPostMessage",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "chatPostMessage", targets: ["chatPostMessage"])
    ],
    dependencies: [
        .package(path: "../../"),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client.git", from: "1.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "chatPostMessage",
            dependencies: [
                .product(name: "SlackClient", package: "swift-slack-client"),
                .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
            ]
        ),
    ]
)
