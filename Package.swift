// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "iOSApp",
  platforms: [.macOS(.v11)],
  dependencies: [
    .package(url: "https://github.com/TokamakUI/Tokamak", from: "0.11.0"),
    .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.19.0")
  ],
  targets: [
    .executableTarget(
      name: "iOSApp",
      dependencies: [
        .product(name: "TokamakShim", package: "Tokamak"),
        .product(name: "TokamakDOM", package: "Tokamak"),
        .product(name: "JavaScriptKit", package: "JavaScriptKit")
      ]
    )
  ]
)
