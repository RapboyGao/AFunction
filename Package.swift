// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AFunction",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AFunction",
            targets: ["AFunction"]),
    ],
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AValue.git", branch: "main"),
        .package(url: "https://github.com/RapboyGao/AUnit.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AFunction",
            dependencies: [
                .product(name: "AValue", package: "AValue"),
                .product(name: "AUnit", package: "AUnit"),
            ]),
        .testTarget(
            name: "AFunctionTests",
            dependencies: ["AFunction"]),
    ])
