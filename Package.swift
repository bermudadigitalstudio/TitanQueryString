import PackageDescription

let package = Package(
    name: "TitanQueryString",
    dependencies: [
      .Package(url: "https://github.com/bermudadigitalstudio/TitanCore.git", majorVersion: 0, minor: 2)
    ]
)
