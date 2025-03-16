// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWJavaScriptContext_Pinyin",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "WWJavaScriptContext_Pinyin", targets: ["WWJavaScriptContext_Pinyin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWJavaScriptContext", from: "1.1.0"),
    ],
    targets: [
        .target(name: "WWJavaScriptContext_Pinyin", dependencies: ["WWJavaScriptContext"], resources: [.process("Script"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
