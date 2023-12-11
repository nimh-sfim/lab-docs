# Software Recommendations

We have (highly subjective) recommendations for the following categories of
software:

- [Text Editors](#Text-Editors)
- [Programming Packages](#Programming-Packages)
- [Scientific Software](#Scientific-Software)
- [Communication Platforms](#Communication-Platforms)
- [Other](#Other)
- [iPad Apps](#iPad-Apps)

Some of these software recommendations can be downloaded from the NIMH Self-Service Portal. Note that if they are not available in the portal, you will need to have an admin account to install applications and this likely means making an appointment with ITB. If that's the case, to make everyone's life easier, download the installer packages for all the programs you need before the appointment so it's just a matter of getting the password entered and you don't have to make multiple appointments.   

## Text Editors

- For people who prefer to have graphical interfaces, or who work with
  various rich text formats, we recommend [Visual Studio Code][vscode]. VSCode is also has good features for working on biowulf can effectively do everything one might do on NoMachine except opening other graphical programs, like the AFNI interface. Here is our [VSCode guide][vscode_guide]
- For people who are kind of command savvy, but would still like a graphical
  interface, and don't work with a lot of markup text,
  [Sublime][sublime] is a good option.
- For the people who love the command line and inhabit it, Josh, our former scientific programmer,
  recommends vim (installed on MacOS and Linux by default), but if you love the command line and
  inhabit it, you probably already have an opinion on the best text editor and don't care what
  Josh thinks. If that's not you, consider one of the graphical editors.

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
    - first, install the dependencies from the NIMH Self-Service Portal
    - then, follow the [instructions online][afni-instructions] for NIH-managed laptops
- We present subjects in the scanner with stimulus through [PsychoPy][pp].
  - if you are planning on doing eye-tracking, you may also need to download the [EyeLink Developers Toolkit][eyelink-api]. Downloading requires a (free) SR research account to access the forum with the links. 
- MATLAB can be installed on your local machine with an NIH site license.
  Instructions for installing MATLAB and setting up an NIH-affiliated
  MathWorks account can be found [here][matlab].

## Communication Platforms

- We use [Slack][slack], because apparently we enjoy watching a gargantuan
  program devour our RAM. You may have been invited to different Slack workspaces with different emails, so make sure that all the groups you want to use are there. 
- We also use Microsoft Teams, because the NIH gives it to us for free.
  If you're an NIH employee or fellow, it should come on your laptop.
  Bonus: it integrates into our calendars!
  Calendar integration is essential for those of us who are organizational
  disasters.

## Other

- [Gimp][gimp] is an image editing program that's open source and competes
  with Photoshop. 
- [Inkscape][inkscape] is another open source option that is comparable to Illustrator. 
- [NoMachine][nomachine] and [turbovnc][tvnc] are both VNC servers that
  allow you to have graphical windows on Biowulf and allow for your
  terminal sessions to persist.
  - turbovnc can look sketchy but this link is actually correct.
    Download the disk image for it and open it in Finder.
    Open the .dmg file and then run TurboVNC.pkg, following instructions.
  - NoMachine you will install similarly to turbovnc.
    Sometimes advanced MATLAB graphics may not render correctly.
- EndNote, to manage references, can be installed from "NIMH Self Service Portal" Other options (which can not be installled from the NIMH Self Service Portal) include [Zotero][zotero], [Mendeley][mendeley] or [ReadCube Papers][papers]. 
- Adobe Acrobat - MacOS comes with the built-in Preview to view PDFs, images, etc, but you may need to install Adobe Acrobat to be able to digitally sign PDFs with your PIV card. You can install the software itself from the Self Service Portal, but will need to ask IT to add your user account to the Adobe group in order to use it. 
  - if you need Illustrator (or other Adobe software), ask first, as we may need to pay for an account. 

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
[afni-instructions]:https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/steps_macOS_12_Silicon.html#quick-setup-special-case-nimh-administered-computers
[pp]: <https://www.psychopy.org>
[eyelink-api]: https://www.sr-research.com/support/forum-9.html
[matlab]: <https://teams.microsoft.com/l/file/3031C985-F9FE-4C0F-8571-F549EFE6917B?tenantId=14b77578-9773-42d5-8507-251ca2dc2b06&fileType=docx&objectUrl=https%3A%2F%2Fnih.sharepoint.com%2Fsites%2FNIMH-SFIM%2FShared%20Documents%2FGeneral%2FOnboarding%2FHow%20to%20Create%20a%20MathWorks%20Account.docx&baseUrl=https%3A%2F%2Fnih.sharepoint.com%2Fsites%2FNIMH-SFIM&serviceName=teams&threadId=19:919e1081447a4d58ba4003dcfe291efb@thread.skype&groupId=826bd11d-fb74-4cd5-9153-a19b6b2e0361>
[slack]: <https://slack.com>
[gimp]: <http://gimp.org>
[inkscape]: https://inkscape.org/
[nomachine]: <https://www.nomachine.com>
[tvnc]: <https://sourceforge.net/projects/turbovnc/files/latest/download>
[zotero]: https://www.zotero.org/
[mendeley]: https://www.mendeley.com/
[papers]: https://www.papersapp.com/