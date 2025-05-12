// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-slack-client",
    platforms: [ .macOS(.v14) ],
    products: [
        .executable(name: "SchemaGenerator", targets: ["SchemaGenerator"]),
        .library(name: "SlackClient", targets: ["SlackClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.12.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "SchemaGenerator",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
        ),
        .target(
            name: "SlackClient",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client")
            ],
        ),
        .testTarget(
            name: "SlackClientTests",
            dependencies: ["SlackClient"],
        )
    ]
)
