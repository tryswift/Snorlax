# Cutting a Release

It's pretty simple to cut a release, but make sure you document it for all team
members that can cut a release.

Cutting a release isn't hard, it's mostly book-keeping with a focus toward
communicating to people who use your library. I strongly recommend following
[semantic versioning][semvar]. Developers using your library will find use if
they should expect breaking changes or new features.

In short, semantic versioning is in the following format:

```
<major>.<minor>.<patch>
```

An example is `1.4.1`. Increments to each number indicates specific types of
changes included in a new release:

 - **Patch** version change indicates only bug fixes are in this release. There
   are no new features or breaking changes included in a patch version increment.
 - **Minor** version change indicates new features have been added without
   breaking the current API the library provides. This means it's safe for
   library consumers to upgrade the library without any breakages and then use
   new features. Minor versions may include bug fixes like patch version
   increments.
 - **Major** version change indicates breaking changes has occurred. Developers
   who use your library can expect to update their usage of your library to
   resolve public API changes made to the library. Major versions may include
   new features and bug fixes like minor or patch version increments.

Carthage, CocoaPods, and Swift Package Manager follow these rules and allow
developers to update based on a particular version number.

For example in CocoaPods:

```ruby
pod 'Snorlax', '~> 1.2.0'
```

The `~>` operator tells CocoaPods to follow semantic versioning rules and allow
the last specified version number to be flexible when `pod update` is called.

Let's say the CocoaPods user installed version `1.2.0` of Snorlax, then version
`1.2.1` of Snorlax is released. CocoaPods will pull `1.2.1` the next time the
user runs `pod update`.

However, if a minor version of Snorlax is released (`1.3.0`), then `pod update`
**will keep the same version** of Snorlax. It will remain at `1.2.0`. The same
applies to if a major version of Snorlax was released.

## Preflight Check

Here's a useful set of things to check before cutting a release:

 - Does all the frameworks build across all platforms?
   - A simple way is to use `carthage build --no-skip-current`
 - Do all the tests pass?

## Creating a Release

Note: `Snorlax` should be replaced with your project's name.

 - Update the version number in your project based on semantic versioning:
   - Update your podspec file
   - Update your documentation that shows how to install the project.
 - Commit the version update and push to your repository
 - Create a tag of the version: `git tag v1.2.1 -a`
   - An easy way to see changes from last tagged version:
     `git diff v1.2.0...HEAD`
   - Annotate the tag with changes in this version
 - Push the tag to your repository: `git push origin v1.2.1`
 - Push the cocoapod spec: `pod trunk push Snorlax.podspec`
 - Go to github's released page and create a release out of the pushed tag.

Optionally, you can choose to automate most of it ([Quick][quick] and
[Nimble][nimble] does this).

## Extra Credit

- **Create signed tags instead of unsigned ones**. This allows paranoid developers
  to make sure they're running code that's been reviewed by you. You'll need a
  PGP key and then you can run `git tag -s v1.2.1`.

# TODO

Other useful things to talk about:

- Creating an alpha, beta, release candidate release (semantic versioning details).
- Elaborate on creating PGP key (setup) and configuring git to use the PGP key.
    - Places to publish your PGP key

[semvar]: http://semvar.org
[quick]: https://github.com/Quick/Quick
[nimble]: https://github.com/Quick/Nimble
