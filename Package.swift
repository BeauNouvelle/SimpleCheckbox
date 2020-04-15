// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleCheckbox",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SimpleCheckbox",
            targets: ["SimpleCheckbox"]),
    ],
    targets: [
        .target(
            name: "SimpleCheckbox",
            dependencies: [],
            path: "checkbox")
    ],
    swiftLanguageVersions: [.v5]
)
