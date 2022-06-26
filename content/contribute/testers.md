---
title: "How to Contribute: Testers"
menu_weight: 2
---
<div class="info" markdown="1">

## Testers

EasyRPG uses a RPG Maker 2000 test game project to see which RPG Maker 2000
features are working fine in EasyRPG Player. This game consists on a collection
of maps with some tests inside, e.g.: a map with a lot of characters with
"Show Message" command tests with all features (character limits, colors,
speed...) of the show message event commands.

### Reporting EasyRPG Player defects

This game can be played and compared by any person without specific programming
knowledge, only needing a copy of RPG Maker 2000 game interpreter (RPG_RT.exe)
to play with it, then compare with EasyRPG player and report any emulation
difference between them.

#### How to report EasyRPG Player defects

1. [Create a GitHub account] if you do not have already
2. Look through [Player issue list] to ensure it is not reported already
3. Ensure the issue is not a defect in the reader library (see below)
4. Open a new issue

#### Reporting liblcf (EasyRPG reader library) defects

The easiest method to detect RPG Maker 2000/2003 file format issues is by
downloading the LCF2XML tool and compare generated XML information with the
existing in project database. Also, LCF2XML can convert back XML to the native
RPG Maker 2000/2003 file format and do a binary comparison between them.
Also, you can generate again XML files for text comparison for easier
information loss detection.

#### How to report EasyRPG liblcf defects

1. [Create a GitHub account] if you do not have already
2. Look through [liblcf issue list] to ensure it is not reported already
3. Open a new issue

### How to create new TestGame test cases

1. [Create a GitHub account] if you do not have already
2. Look into the [TestGame issue list] if there is any unassigned a test case
   request to do
3. [Fork and Clone] the TestGame repository if you did not do it already
4. See if the feature does not have a test case yet
5. Create the test case and [push changes] into your repository
6. Create a [pull request]

[Create a GitHub account]: https://github.com/join
[Player issue list]: https://github.com/EasyRPG/Player/issues
[liblcf issue list]: https://github.com/EasyRPG/liblcf/issues
[TestGame issue list]: https://github.com/EasyRPG/TestGame/issues

[Fork and Clone]: https://docs.github.com/en/get-started/quickstart/fork-a-repo
[push changes]: https://docs.github.com/en/get-started/using-git/pushing-commits-to-a-remote-repository#remotes-and-forks
[pull request]: https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests

</div>