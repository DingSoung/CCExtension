// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Extension",
    products: [
        .library(name: "Extension", targets: ["Extension"])
    ],
    targets: [
        .target(name: "Extension", dependencies: [], path: "Extension")
    ]
)
