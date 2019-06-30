// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Extension",
    products: [
        .library(name: "Extension", targets: ["Extension"]),
        .library(name: "Extension_tvOS", targets: ["Extension_tvOS"]),
        .library(name: "Extension_watchOS", targets: ["Extension_watchOS"])
    ],
    targets: [
        .target(name: "Extension", dependencies: [], path: "Extension"),
        .target(name: "Extension_tvOS", dependencies: [], path: "Extension"),
        .target(name: "Extension_watchOS", dependencies: [], path: "Extension")
    ]
)