// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "deepl-translator",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "deepl-translator", targets: ["DeepLTranslator"])
    ],
    dependencies: [
        .package(
            path: "../..",
            traits: [
                "SocketMode",
                "Events",
                "WebAPI_Chat",
                "WebAPI_Views",
                "WebAPI_Conversations"
            ]
        ),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client.git", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/thebarndog/swift-dotenv.git", from: "2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "DeepLTranslator",
            dependencies: [
                .product(name: "SlackClient", package: "swift-slack-client"),
                .product(name: "SlackModels", package: "swift-slack-client"),
                .product(name: "SlackBlockKit", package: "swift-slack-client"),
                .product(name: "SlackBlockKitDSL", package: "swift-slack-client"),
                .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "SwiftDotenv", package: "swift-dotenv")
            ]
        )
    ]
)
