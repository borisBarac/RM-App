// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let TCA: Target.Dependency = .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
let services: Target.Dependency = "Services"
let helpers: Target.Dependency = "Helpers"
let analytics: Target.Dependency = "Analytics"
let rmGql: Target.Dependency = .product(name: "RMGraphQL", package: "RMGraphQL")
let snapShotTesting: Target.Dependency = .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
let sdWebImage: Target.Dependency = .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")

let pageDependecies: [Target.Dependency] = [TCA, services, helpers, analytics,]

let package = Package(
    name: "RMApp",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),

        // this target is here becase XCODE can not attach to simulator without a host app
        // so this makes XC testing easier and faster, and they can be run in parallel
        // other workaround is to add XCODE to BASH PATH, and run tests with swift test
        .macOS(.v12),
    ],
    products: [
        .library(name: "AppCore", targets: ["AppCore"]),
        .library(name: "Services", targets: ["Services"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "Analytics", targets: ["Analytics"]),
        .library(name: "HomePage", targets: ["HomePage"]),
        .library(name: "DetailsPage", targets: ["DetailsPage"]),
    ],
    dependencies: [
        .package(name: "RMGraphQL", path: "./RMGraphQL"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .upToNextMajor(from: "1.10.0")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.43.0")),
    ],
    targets: [
        .target(
            name: "AppCore",
            dependencies: [
                "HomePage",
            ]),
        .testTarget(
            name: "AppCoreTests",
            dependencies: ["AppCore"]),

        .target(
            name: "Services",
            dependencies: [
                rmGql,
                TCA,
                helpers,
            ]),
        .testTarget(
            name: "ServicesTests",
            dependencies: ["Services"]),

        .target(
            name: "Helpers",
            dependencies: [
                rmGql,
                sdWebImage
            ]),
        .testTarget(
            name: "HelpersTests",
            dependencies: ["Helpers",
                           snapShotTesting]),

        .target(
                name: "Analytics",
                dependencies: [
                    TCA,
                ]),
        .testTarget(
            name: "AnalyticsTests",
            dependencies: ["Analytics"]),

        .target(
            name: "HomePage",
            dependencies:
                pageDependecies + [
                    "DetailsPage",
                ]),
        .testTarget(
            name: "HomePageTests",
            dependencies: ["HomePage",
                           snapShotTesting]),

        .target(
            name: "DetailsPage",
            dependencies:
                pageDependecies),
        .testTarget(
            name: "DetailsPageTests",
            dependencies: ["DetailsPage",
                           snapShotTesting]),

        
    ]
)
