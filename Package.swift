import PackageDescription

let package = Package(
    name: "Snorlax",
    targets: [
        Target(name: "SnorlaxTests", dependencies: [.Target(name: "Snorlax")])
    ]
    // Normally, we can do this, but swiftpm snapshot (DEVELOPMENT-SNAPSHOT-2016-02-08-a) doesn't support
    // linking test dependencies yet.
    //
    // testDependencies: [
    //     .Package(url: "ssh://git@github.com/jeffh/Nimble.git", majorVersion: 3),
    // ]
)
