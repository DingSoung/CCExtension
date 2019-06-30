// swift-tools-version:5.0.0

import PackageDescription

let package = Package(
    name: "Extension",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(name: "Extension", targets: ["Extension"])
    ],
    targets: [
        .target(name: "Extension", path: "Sources")
    ],
    swiftLanguageVersions: [
        .version("5.0.0")
    ]
)
