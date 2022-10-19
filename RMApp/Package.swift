// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let TCA: Target.Dependency = .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
let services: Target.Dependency = "Services"
let helpers: Target.Dependency = "Helpers"
let rmGql: Target.Dependency = .product(name: "RMGraphQL", package: "RMGraphQL")

let pageDependecies: [Target.Dependency] = [TCA, services, helpers,]

let package = Package(
    name: "RMApp",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v15),
    ],
    products: [
        .library(name: "AppCore", targets: ["AppCore"]),
        .library(name: "Services", targets: ["Services"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "HomePage", targets: ["HomePage"]),
        .library(name: "DetailsPage", targets: ["DetailsPage"]),
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
                helpers,
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
            name: "Helpers",
            dependencies: [
            ]),
        .testTarget(
            name: "HelpersTests",
            dependencies: ["Helpers"]),

        .target(
            name: "HomePage",
            dependencies:
                pageDependecies),
        .testTarget(
            name: "HomePageTests",
            dependencies: ["HomePage"]),

        .target(
            name: "DetailsPage",
            dependencies:
                pageDependecies),
        .testTarget(
            name: "DetailsPageTests",
            dependencies: ["DetailsPage"]),

        
    ]
)
