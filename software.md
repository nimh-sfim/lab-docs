# Software Recommendations

We have (highly subjective) recommendations for the following categories of
software:

- [Text Editors](#Text-Editors)
- [Programming Packages](#Programming-Packages)
- [Scientific Software](#Scientific-Software)
- [Communication Platforms](#Communication-Platforms)
- [Other](#Other)
- [iPad Apps](#iPad-Apps)

## Text Editors

- For people who prefer to have graphical interfaces, or who work with
  various rich text formats, we recommend [Visual Studio Code][vscode]. VSCode is also has good features for working on biowulf can effectively do everything one might do on NoMachine except opening other graphical programs, like the AFNI interface. Here is our [VSCode guide][vscode_guide]
- For people who are kind of command savvy, but would still like a graphical
  interface, and don't work with a lot of markup text,
  [Sublime][sublime] is a good option.
- For the people who love the command line and inhabit it, Josh recommends
  vim (installed on MacOS and Linux by default),
  which is better than emacs (installed on MacOS and Linux by default)
  because Josh said so.

  Note: If you love the command line and inhabit it, you probably already have
  an opinion on the best text editor and don't care what Josh thinks. If that's
  not you, consider one of the graphical editors.

## Programming Packages

- [miniconda3][mc3] is the preferred way of managing your python
  environments.
  Back in our day, we had to manage our own environments.
  We do *not* recommend it.
- For those who want an IDE that isn't purely comamnd line, we recommend
  [VSCode][vscode] for Python development.

## Scientific Software

- We do most of our image processing with [AFNI][afni], because they're real
  swell folks who write good programs.
  They are also just down the hall and they're watching us.
- We present subjects in the scanner with stimulus through [PsychoPy][pp].
- MATLAB can be installed on your local machine with an NIH site license.
  Instructions for installing MATLAB and setting up an NIH-affiliated
  MathWorks account can be found [here][matlab].

## Communication Platforms

- We use [Slack][slack], because apparently we enjoy watching a gargantuan
  program devour our RAM.
- We also use Microsoft Teams, because the NIH gives it to us for free.
  If you're an NIH employee or fellow, it should come on your laptop.
  Bonus: it integrates into our calendars!
  Calendar integration is essential for those of us who are organizational
  disasters.
  We try not to point fingers at who those people are, but mostly it's Josh.
  Josh is the organizational disaster.

## Other

- [Gimp][gimp] is an image editing program that's open source and competes
  with Photoshop.
- [NoMachine][nomachine] and [turbovnc][tvnc] are both VNC servers that
  allow you to have graphical windows on Biowulf and allow for your
  terminal sessions to persist.
  - turbovnc can look sketchy but this link is actually correct.
    Download the disk image for it and open it in Finder.
    Open the .dmg file and then run TurboVNC.pkg, following instructions.
  - NoMachine you will install similarly to turbovnc.
    Sometimes advanced MATLAB graphics may not render correctly.
- EndNote, to manage references, can be installed from "Managed Software
  Center."

## iPad Apps

- SSH (Terminus)
    How to ssh into biowulf/helix from iPad
    1. Open the Apps@Work app in your ipad.
    1. On the top right corner, click on See All.
    1. Once the full list of apps load, go to the bottom of the screen and
    select the “Terminus” app.
    1. On the “Terminus” app description page, press on the “VIEW” button,
     this will take you to the App Store.
    1. Install the “Terminus” app from the App Store
       Once installation completes, the Terminus app will not yet allow
       you to connect to NIH systems because it is not yet being managed
       by MobileIron.
       This is necessary for communications to be tunneled via the VPN
       that MobileIron manager on the iPad.
       For Javier it took 24 hours before he got a notification from
       MobileIron asking me if wanted to let MobileIron manage the
       Terminus app.
       When you get such a prompt, answer yes.
    1. Open the Terminus app
    1. It will ask you to sign in, but it is not necessary, you can
       continue as a guest.
    1. Create a new connection in the SSH section to biowulf the same way
       you would do in NoMachine.
    1. Press connect.

[vscode]: <https://code.visualstudio.com>
[vscode_guide]: vscode_guide.md
[sublime]: <https://www.sublimetext.com>
[mc3]: <https://docs.conda.io/en/latest/miniconda.html>
[afni]: <https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/index.html>
[pp]: <https://www.psychopy.org>
[matlab]: <https://teams.microsoft.com/l/file/3031C985-F9FE-4C0F-8571-F549EFE6917B?tenantId=14b77578-9773-42d5-8507-251ca2dc2b06&fileType=docx&objectUrl=https%3A%2F%2Fnih.sharepoint.com%2Fsites%2FNIMH-SFIM%2FShared%20Documents%2FGeneral%2FOnboarding%2FHow%20to%20Create%20a%20MathWorks%20Account.docx&baseUrl=https%3A%2F%2Fnih.sharepoint.com%2Fsites%2FNIMH-SFIM&serviceName=teams&threadId=19:919e1081447a4d58ba4003dcfe291efb@thread.skype&groupId=826bd11d-fb74-4cd5-9153-a19b6b2e0361>
[slack]: <https://slack.com>
[gimp]: <http://gimp.org>
[nomachine]: <https://www.nomachine.com>
[tvnc]: <https://sourceforge.net/projects/turbovnc/files/latest/download>
