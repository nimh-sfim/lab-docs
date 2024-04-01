# How to: Set up your laptop

If you're new to SFIM, welcome! On this page, we've got a list of tips and tricks to get your laptop all set up so you can do your work.

- [Download Software](#download-software)
- [Request Admin Rights](#request-admin-rights-for-your-laptop)
- [Set up SSH Keys](#set-up-ssh-keys)
- [Set up Python](#set-up-python)
- [Other potentially useful suggestions](#set-up-and-download-other-useful-things)

## Download Software

It is unlikely that you will have admin access to your laptop when you receive it. Because of that, installing software is a little bit complicated.

There are a number of programs that are available through the NIMH Self-Service Portal that you may or may not need, so first, check that out and download what you can/want. For anything else, you will have to go through ITB to have them install the software. Please see our [software recommendations][software] page for (highly subjective) opinions on what you might need - text editors, programming tools, communication tools, etc. If you have specific questions, please feel free to ask any of the Staff Scientists or Programmer about their opinions and workflows.

Regardless of what your workflow is, if you're going to have ITB install software, you're going to need an appointment, and it's more efficient for everyone involved for you to have installers downloaded for all the programs you're looking to install so it's just a matter of getting the password entered and you don't have to make multiple appointments.

## Request Admin rights for your laptop

Not everyone will be granted admin access, so check with others in the lab regarding current criteria. You can request this via BPLogix - IT Consolidated Waiver Form (PIV Card, Standard Configuration, Desktop/Laptop Encryption, Admin Rights, Vulnerability Scan, Patch Management). You'll have to do some additional [Role-based training][role_based_training] for this - you can do the IT Adminstrator Training and/or the Cybersecurity Essentials. Check in with Dan or Catherine before getting this process started.

## Set up SSH Keys

Creating SSH keys allows you to easily authenticate to places that aren't your laptop (i.e. GitHub, Biowulf) without having to enter your username and password every time. For Github and various servers on Biowulf, this is either necessary or makes life much easier. This works with a pair of SSH keys, one private, and one public. The private one is on the computer you are connecting from (i.e. your laptop). Keep this key private! SSH keys can be more secure than passwords, but if someone has access to your private key, they can log into any system where you've set up access through SSH keys.

You will likely need to create pairs of SSH keys: one for accessing Biowulf and GitHub from your laptop (private key on your laptop), and one for accessing GitHub from Biowulf (private key on Biowulf). Both of these can be set up the same way. We recommend following GitHub's instructions [here][ssh-keys] to create SSH keys.

Please create and remember your SSH key password! If you suspect anyone has had access to any of your private keys, remove access by that key from Biowulf, GitHub, etc as soon as possible.

### Using SSH Keys with GitHub

Once you've created your key locally, you will need to associate it with
your GitHub account. You can use GitHub's instructions [here][gh_affiliate]. Make sure that once you've set up your SSH keys, you are accessing each GitHub repository with the SSH addresses rather than HTTPS. For this repo, the SSH link is `git@github.com:nimh-sfim/lab-docs.git` while the HTTPS link is `https://github.com/nimh-sfim/lab-docs.git`.
You can do this by going to the repository, clicking on the green "code" tab, and then pressing the "code" drop-down menu.
Click "SSH" and then the clipboard icon to copy the new link. If you're cloning repository for the first time, for example, this repo, you can type: `git clone REPO_SSH_LINK`
You you have already cloned a repo with HTTPS and want to change it to SSH, run

```bash
git remote remove NAME
git remote add NAME REPO_SSH_LINK
```

and you will be set up to use SSH keys.

Note that especially if you're using SSH keys with GitHub on Biowulf, you might need to start up the ssh-agent and run `ssh-add` to start your key up with each new session. You can include `ssh-add` into your `~/.zschrc` file on your Mac, which means the key will work every time you open up a terminal window, but it also means you'll be asked for your ssh key passphrase every time you open up a new terminal.

### Using SSH Keys with Biowulf

You can also use SSH keys to make your life easier and not have to enter your Biowulf password every time. NIH HPC has provided [instructions][biowulf_ssh_key] on how to set up an SSH Key with Biowulf. The GitHub instructions for making a public and private key are more clear and you can use the same keys with Biowulf. The same private key should remain on your laptop, but follow the Biowulf instructions to add the public key to your `authorized_keys` file on Biowulf.

## Set up Python

A lot of the work we do is in Python, so it will behoove you to have an updated distribution of Python installed on your laptop and on Biowulf. Please see our detailed instructions on [installing Python on Biowulf via miniconda][python_biowulf] for how to do this without making HPC mad at us. Please ensure that you follow the instructions on acquiring an Anaconda Professional Token from CIT if you install Python through [miniconda][conda_install] (the same token can be used for your local laptop and Biowulf). You also can consider installing Python via [micromamba][mamba_install].

A big advantage of using conda or mamba is you can set up multiple python environments. This is particularly useful if one python program installs a lot of other python packages with specific version numbers that mess up other things you are doing with python. We recommend having a general environment for most things you do (i.e. including `numpy, scipy, matplotlib, pandas, and jupyter`), and separate environments for anything that might install a wider range of distinct packages. the [miniconda][conda_install] and [micromamba][mamba_install] installation instructions include information on creating and naming multiple environments.

## Set up and download other useful things

### Mac System Settings

A few notes to make your Mac laptop run smoothly with NIH accounts:

- Do **not** add your NIH account to System Preferences-> Internet Accounts. We use Outlook for mail and adding the account there will just do things like have everything downloaded in parallel to Mac Mail.
- Log into an iCloud account - an iCloud account is necessary to download even free software from the App Store and may be necessary for some OS updates. If you don't want to have a personal account on a work laptop, you can consider making a new iCloud account specifically for your work laptop. Unless you want to pay for storage, you should turn off most sharing except for the Notes app.
- You may run into an issue where your Keychain gets locked automatically if you have been inactive on your laptop, meaning you get asked for your password frequently. If this happens, you can set a length of time before Keychain asks for your password. See [this link][keychain] for instructions - if you uncheck both boxes, it should stop asking for your password so often.

### Clone GitHub repos

One thing you may need/wish to do is to clone necessary GitHub repos to your local laptop. If you've set up your SSH keys (which you should do), you should clone them via SSH. Talk to the senior members of the lab to decide which repos (if any) are necessary for you to download.

### Set up your laptop profiles

Another (subjective) tip: you can add aliases and settings to your .bashrc and .vimrc profiles to make your life easier. Take a look at the samples in the `profiles` directory in this repo.

You can also consider setting up your Git config file so that Git will correctly attribute the changes you make to you. To help you with this process, we suggest running the `set_git_config.sh` script in the `profiles` directory in this repo. This will interactively set up your username/email, set your default branch as `main`, create a global `.gitignore` and add some helpful aliases.

### Scripts to automount Biowulf

One thing you may want to do is set up a script to auto-mount Biowulf directories. This means that you can access various directories from Biowulf as though they are on your local MacOS laptop.

In order to automatically mount Biowulf drives, you should create a script using Script Editor called `BiowulfAutoMount.scpt` that looks like this:

```scpt
tell application "Finder"
    mount volume "smb://hpcdrive.nih.gov/NIMH_SFIM" as user name "USERNAME"
    mount volume "smb://hpcdrive.nih.gov/USERNAME" as user name "USERNAME"
    mount volume "smb://hpcdrive.nih.gov/SFIMLBC" as user name "USERNAME"
    mount volume "smb://hpcdrive.nih.gov/SFIM" as user name "USERNAME"
    mount volume "smb://hpcdrive.nih.gov/data" as user name "USERNAME"
end tell
```

with `USERNAME` your NIH username.
The `USERNAME` address will mount to `/home/USERNAME` on biowulf.
The `/data` address will mount to `/data/USERNAME`.
All others will go to `/data/DIRNAME` with DIRNAME the directory name. Repeat for as many directories as you need.
Then export it as an application in Script Editor.
When you run it, it will mount the directories.
You should be able to access them in MacOS under `/Volumes/` in Terminal so that `/Volumes/NIMH_SFIM` on your laptop will be the same as `/data/NIMH_SFIM` on biowulf.

Additional information from the NIH HPC team about creating automounts is [here][hpc_mount].

[software]: <software.md>
[ssh-keys]:<https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>
[gh_affiliate]: <https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>
[biowulf_ssh_key]: https://hpc.nih.gov/docs/sshkeys.html
[python_biowulf]: <biowulf_conda.md>
[hpc_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
[role_based_training]: https://irtsectraining.nih.gov/
[conda_install]: https://docs.anaconda.com/free/miniconda/miniconda-install/
[mamba_install]: https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html
[keychain]: https://support.apple.com/guide/keychain-access/mac-keychain-password-kyca1242/mac
