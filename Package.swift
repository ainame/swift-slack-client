// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// BEGIN: Generated WebAPI traits - Do not edit manually
let webAPITraits: [String] = [
    "WebAPI_Admin",
    "WebAPI_Apps",
    "WebAPI_Assistant",
    "WebAPI_Auth",
    "WebAPI_Bookmarks",
    "WebAPI_Bots",
    "WebAPI_Canvases",
    "WebAPI_Chat",
    "WebAPI_Conversations",
    "WebAPI_DND",
    "WebAPI_Emoji",
    "WebAPI_Files",
    "WebAPI_Functions",
    "WebAPI_Migration",
    "WebAPI_OAuth",
    "WebAPI_OpenID",
    "WebAPI_Pins",
    "WebAPI_Reactions",
    "WebAPI_Reminders",
    "WebAPI_RTM",
    "WebAPI_Search",
    "WebAPI_Stars",
    "WebAPI_Team",
    "WebAPI_Tooling",
    "WebAPI_Users",
    "WebAPI_Views"
]

var traits: [Trait] = webAPITraits.map { .trait(name: $0) }
// END: Generated WebAPI traits

traits.append(.trait(name: "SocketMode"))
traits.append(.trait(name: "BlockKit"))

// By default, all the traits is enabled for development.
traits.append(.default(enabledTraits: Set(traits.map(\.name))))

let package = Package(
    name: "swift-slack-client",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "SlackClient", targets: ["SlackClient"]),
        .library(name: "SlackBlockKit", targets: ["SlackBlockKit"]),
    ],
    traits: Set(traits),
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
                .target(name: "SlackBlockKit", condition: .when(traits: ["BlockKit"])),
            ]
        ),
        .target(name: "SlackBlockKit"),
        .testTarget(
            name: "SlackClientTests",
            dependencies: ["SlackClient"],
        ),
    ]
)
