import PackageDescription

let package = Package(
    name: "Snorlax",
    testDependencies: [
       .Package(url: "ssh://git@github.com/jeffh/Nimble.git", majorVersion: 3),
    ]
)
