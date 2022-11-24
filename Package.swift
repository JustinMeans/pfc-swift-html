// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "pfc-swift-html",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13)
  ],
  products: [
    .library(
      name: "PFCHtml",
      targets: ["PFCHtml"]),
    .library(
      name: "PFCHtmlSnapshotTesting",
      targets: ["PFCHtmlSnapshotTesting"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0"),
  ],
  targets: [
    .target(
      name: "PFCHtml"
    ),
    .testTarget(
      name: "PFCHtmlTests",
      dependencies: ["PFCHtml"]
    ),
    .target(
      name: "PFCHtmlSnapshotTesting",
      dependencies: [
        "Html",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ]
    ),
    .testTarget(
      name: "PFCHtmlSnapshotTestingTests",
      dependencies: ["PFCHtmlSnapshotTesting"],
      exclude: [
        "__Snapshots__",
      ]
    ),
  ]
)
