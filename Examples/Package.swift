// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var targets: [Target] = []
// Only include actual executables, not snippet files
targets.append(executable("chatPostMessage"))
targets.append(executable("router"))
targets.append(executable("dsl"))
targets.append(executable("echoSlashCommand"))
targets.append(executable("threadExpander"))

let package = Package(
    name: "Examples",
    platforms: [.macOS(.v14)],
    products: products(from: targets),
    dependencies: [
        .package(
            path: "../",
            traits: [
                "SocketMode",
                "Events",
                "WebAPI_Auth",
                "WebAPI_Apps",
                "WebAPI_Chat",
                "WebAPI_Views",
            ],
        ),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client.git", from: "1.1.0"),
    ],
    targets: targets + [
        .target(
            name: "Snippets",
            dependencies: [
                .product(name: "SlackBlockKit", package: "swift-slack-client"),
                .product(name: "SlackBlockKitDSL", package: "swift-slack-client"),
            ],
        ),
    ],
)

func products(from targets: [Target]) -> [Product] {
    targets.map { .executable(name: $0.name, targets: [$0.name]) }
}

func executable(_ name: String) -> Target {
    .executableTarget(
        name: name,
        dependencies: [
            .product(name: "SlackClient", package: "swift-slack-client"),
            .product(name: "SlackBlockKit", package: "swift-slack-client"),
            .product(name: "SlackBlockKitDSL", package: "swift-slack-client"),
            .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
        ],
    )
}
