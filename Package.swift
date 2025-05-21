// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-slack-client",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "SlackClient", targets: ["SlackClient"])
    ],
    traits: [
        .trait(name: "SocketMode")
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.7.2"),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.8.2"),
        .package(url: "https://github.com/hummingbird-project/swift-websocket", from: "1.3.1"),
    ],
    targets: [
        .target(
            name: "SlackClient",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(
                    name: "WSClient", package: "swift-websocket",
                    condition: .when(traits: ["SocketMode"])
                ),
            ]
        ),
        .testTarget(
            name: "SlackClientTests",
            dependencies: ["SlackClient"],
        ),
    ]
)
