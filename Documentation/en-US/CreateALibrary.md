# Library Checklist

Here's a handy checklist to go through when creating a library. This assumes
that your library is applicable to the most platforms. Feel free to skip parts
that do not apply to your library because of dependencies it needs.

- Code Changes
      - Make sure you mark your API code as `public`.
- Create Frameworks in Xcode
    - Make sure its scheme is "shared"
    - Make sure all frameworks have the same PRODUCT_MODULE_NAME build setting
    - Make sure all source files are in the "Target Membership" of each Framework
        - And each test file is in the Framework's Test Bundle
    - Note: that watchOS frameworks cannot have tests
- Package Managers
    - Cocoapods
        - `pod spec create <Project Name>`
        - Modify `<Project>.podspec` file
            - Set version
            - Include description
            - Add dependencies for library consumers
            - Specify source files for library consumers
    - Carthage
        - Run `carthage build --no-skip-current` to test if carthage can build
          your library
        - Restricted to what's allowed in fat binary frameworks
        - Dependencies for library consumers reside in `Cartfile`
        - Dependencies for development of your library reside in `Cartfile.private` (Optional)
    - Swift Package Manager
        - All source should be in the `Sources/<target name>`
        - All test should be in the `Tests/<target name>`
        - The target name in defined in your `Package.swift` file
        - Add a `Tests/LinuxMain.swift` file to bootstrap swift tests in Linux
        - All your XCTests must inherit from `XCTestCaseProvider`
            - And provide the `allTest` getter which specifies all the tests to run
        - `#if _runtime(_ObjC)` can be used to exclude code from Linux
        - Use [swiftenv][swiftenv] to test against multiple swift versions and
          allow easy synchronizing your supported swift version with CI.
- Dependencies
    - For developers that like to integrate your library manually, use git
      submodules. This can be done manually or through Carthage's
      `--use-submodules` flag.
    - Use a workspace to separate dependencies from your xcode project when
      adding your dependencies as a subproject.
- Continuous Integration / Tests
    - Use `xcodebuild test ...` to run tests in Xcode via the command line.
    - Use `swift build && swift test` to run tests in Swift Package Manager
    - Travis CI - See [documentation][travis-ci]
        - Add a `.travis.yml` file in the root of your repository.
        - You can also support Linux, see sample file below.
        - Tell travis to build your repository

All done? Continue to the [Github Checklist](Github.md).

# Sample Files


A Minimal `Package.swift`:

```swift
import PackageDescription

// Source is in Sources/MyPackage
// Tests are in Tests/MyPackage
let package = Package(
    name: "MyPackage"
)
```

A `.travis.yml` file with Swift Linux + OS X Swift:

```yaml
osx_image: xcode7.2
language: generic
matrix:
  include:
    - os: osx
      env: TYPE=xcode
    - os: linux
      dist: trusty
      sudo: required
      env: TYPE=spm
install:
  - if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then curl -sL https://gist.github.com/kylef/5c0475ff02b7c7671d2a/raw/621ef9b29bbb852fdfd2e10ed147b321d792c1e4/swiftenv-install.sh | bash; fi
script:
  - if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then . ~/.swiftenv/init; fi
  - ./run-tests $TYPE # test script can dispatch to correct test commands to run
```

# TODO

It would be nice to add the following:

- How to setup with other CI platforms (eg - CircleCI)
- Have this list in other languages

