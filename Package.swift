// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Statham",
  dependencies: [],
  targets: [
    .target(name: "Statham"),
    .testTarget(name: "StathamTests", dependencies: ["Statham"]),
  ]
)

