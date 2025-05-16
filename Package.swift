// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-slack-client",
    platforms: [ .macOS(.v14) ],
    products: [
        .executable(name: "postMessageTest", targets: ["postMessageTest"]),
        .library(name: "SlackClient", targets: ["SlackClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.7.2"),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.8.2"),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client.git", from: "1.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "postMessageTest",
            dependencies: [
                "SlackClient",
                .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
            ]
        ),
        .target(
            name: "SlackClient",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            ]
        ),
        .testTarget(
            name: "SlackClientTests",
            dependencies: ["SlackClient"],
        )
    ]
)
