// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xc-gh",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(
            name: "xc-gh",
            targets: ["xc-gh"]),
        .library(
            name: "XCGH",
            targets: ["XCGH"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "xc-gh",
            dependencies: ["XCGH"]),
        .target(
            name: "XCGH",
            dependencies: []),
        .testTarget(
            name: "XCGHTests",
            dependencies: ["XCGH"]),
    ]
)
