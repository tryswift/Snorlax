# Github Checklist

Github specially treats specific files in the root of your git repository. Many
optionally allow an extension to tell Github how to interpret the text's
format. For example, `README.md` indiates [github markdown][markdown] README
while `README.rst` indicates a README written in [restructured
text][restructured]. There are other supported extensions [listed in
Github][gh-markup]. If you don't know which one to
choose, just pick markdown.

- Make sure you have a `README` which gets displayed as the first thing after
  the source code view on Github. I strongly recommended having one:
    - Explain what this project is about?
    - How do you install it? What's the latest versions?
    - What version of Swift does it require?
    - Example usages
    - API Documentation / Library concepts (or move this to separate files)
- Make sure you have a `LICENSE` file which tells users how they are allowed
  you use your library. I strongly recommended having an explicit license
  because certain countries (eg - US), assumes copyright by default.
    - Copyleft licenses (eg - GPL) are disallowed on App Stores
    - If you're not sure, use [MIT][mit] or [Apache][apache]
        - MIT is smaller, which many developers and companies prefer
        - Apache is written by lawyers, but is similar to MIT except for the following:
            - Attribution is required with Apache License included
                - In the final product
                - In source that was modified from what was licensed as Apache
            - Includes a patent grant clause. This means companies cannot be sued by a contributor that submitted patented code
- Add a `CONTRIBUTING` to set guidelines to how others can contribute to your project:
    - What is the code of conduct for this project?
    - What is the recommended code style?
    - What should issues have when being filing?
        - Steps to reproduce the issue occuring
        - Versions of software used (your library + dependencies)
        - Small example project that demonstrates the problem
        - Why a particular feature request is useful? Does it need examples?
    - What should a pull request look like?
        - How is the pull request's commits are organized?
            - Do you care about concise history?
            - Pull requests require new tests for new features added? (Recommended)
        - What's your preferred structure of pull requests to process?
        - Are there specific files that most pull requests must modify (eg - Changelog)?
    - Do you prefer discussions as a GitHub issue before creating pull
      requests? Or do you prefer the other way around?
    - Team members
        - How can contributors that have write access should act?
        - Should all be required to submit pull requests for review?
        - How can team members publish / trigger new releases?
            - Where do versions need to be modified when bumping versions?
            - Are you using [semver][semver]? (Recommended)

[gh-markup]: https://github.com/github/markup
[markdown]: https://help.github.com/articles/basic-writing-and-formatting-syntax/
[restructured]: http://docutils.sourceforge.net/rst.html
[semver]: http://semver.org/
[mit]: https://opensource.org/licenses/MIT
[apache]: https://opensource.org/licenses/Apache-2.0
[travis-ci]: https://docs.travis-ci.com/user/languages/objective-c
