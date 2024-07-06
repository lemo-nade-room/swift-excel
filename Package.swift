// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "swift-excel",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftExcel",
            targets: ["SwiftExcel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.55.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftExcel",
            swiftSettings: swiftSettings,
            plugins: swiftLintPlugins
        ),
        .testTarget(
            name: "SwiftExcelTests",
            dependencies: ["SwiftExcel"],
            swiftSettings: swiftSettings,
            plugins: swiftLintPlugins
        ),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableExperimentalFeature("StrictConcurrency"),
] }

var swiftLintPlugins: [Target.PluginUsage] {
    guard Environment.enableSwiftLint || !Environment.ci else {
        return []
    }
    return [
        .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint"),
    ]
}

enum Environment {
    static func find(_ key: String) -> String? {
        ProcessInfo.processInfo.environment[key]
    }
    static var enableSwiftLint: Bool {
        find("ENABLE_SWIFT_LINT") == "true"
    }
    static var ci: Bool {
        find("CI") != nil
    }
}



