// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let TCA: Target.Dependency = .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
let services: Target.Dependency = "Services"
let rmGql: Target.Dependency = .product(name: "RMGraphQL", package: "RMGraphQL")

let package = Package(
    name: "RMApp",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v15),
    ],
    products: [
        .library(
            name: "AppCore",
            targets: ["AppCore"]),
        .library(
            name: "Services",
            targets: ["Services"]),
        .library(
            name: "HomePage",
            targets: ["HomePage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.43.0")),
        .package(name: "RMGraphQL", path: "./RMGraphQL"),
    ],
    targets: [
        .target(
            name: "AppCore",
            dependencies: [
                TCA,
            ]),
        .testTarget(
            name: "AppCoreTests",
            dependencies: ["AppCore"]),

        .target(
            name: "Services",
            dependencies: [
                rmGql,
            ]),
        .testTarget(
            name: "ServicesTests",
            dependencies: ["Services"]),

        .target(
            name: "HomePage",
            dependencies: [
                TCA,
                services,
            ]),
        .testTarget(
            name: "HomePageTests",
            dependencies: ["HomePage"]),
    ]
)
