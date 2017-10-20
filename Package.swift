// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "TitanQueryString",
    products: [
        .library(name: "TitanQueryString", targets: ["TitanQueryString"])
    ],
    dependencies: [
        .package(url: "https://github.com/bermudadigitalstudio/TitanCore.git", .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .target(name: "TitanQueryString", dependencies: ["TitanCore"], path: "./Sources"),
        .testTarget(name: "TitanQueryStringTests", dependencies: ["TitanQueryString"])
    ]
)
