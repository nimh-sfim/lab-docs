# How to: Set up your laptop

If you're new to SFIM, welcome! On this page, we've got a list of tips and tricks to get your laptop all set up so you can do your work.

## Download Software

Due to changing IT rules at the NIH, it is becoming increasingly unlikely that you will have admin access to your laptop (at least when you first get here). Because of that, installing software becomes a little bit more complicated.

There are a number of programs that are available thorugh the NIMH Self-Service Portal that you may or may not need, so first, check that out and download what you can/want. For anything else, you will have to go through ITB to have them install the software. Please see our [software recommendations][software] page for (highly subjective) opinions on what you might need - text editors, programming tools, communication tools, etc. If you have specific questions, please feel free to ask any of the Staff Scientists or Programmer about their opinions and workflows.

Regardless of what your workflow is, if you're going to have ITB install software, you're going to need an appointment, and it's more efficient for everyone involved for you to have installers downloaded for all the programs you're looking to install so it's just a matter of getting the password entered and you don't have to make multiple appointments.

## Request Admin rights for your laptop

As mentioned above, you likely will not have admin rights when you first get your laptop. You can request thisy via BPLogix - IT Consolidated Waiver Form (PIV Card, Standard Configuration, Desktop/Laptop Encryption, Admin Rights, Vulnerability Scan, Patch Management). You'll have to do some additional [Role-based training][role_based_training] for this - you can do the IT Adminstrator Training and/or the Cybersecurity Essentials. Check in with Dan or Catherine before getting this process started.

## Set up SSH Keys

Creating SSH keys allows you to easily authenticate to places that aren't your laptop (i.e. GitHub, Biowulf) without having to enter your username and password every time. This will make your life easier and your data/code more secure! Keep in mind that each SSH key pair is associated with only one machine. If you change machines or take ownership on a new one, you will need a new SSH key pair.

You will likely need to set up a few keys: one for accessing Biowulf from your laptop, one for accessing GitHub from your laptop, one for accessing GitHub from Biowulf, etc. Luckily, all of these can be set up the same way. We recommend following GitHub's instructions [here][ssh-keys] to create SSH keys.

Please create and remember your SSH key password! You will only need to enter it ocassionally.

### Using SSH Keys with GitHub

Once you've created your key locally, you will need to associate it with
your GitHub account. You can use GitHub's instructions [here][gh_affiliate]. Make sure that once you've set up your SSH keys, your remotes are set up to use the SSH addresses rather than HTTPS.
You can do this by going to the repository, clicking on the "code" tab, and then pressing the "code" drop-down menu.
Click "SSH" and then the clipboard icon to copy the new link.
Then, for each remote, run

```bash
git remote remove NAME
git remote add NAME NEW_LINK
```

and you will be set up to use SSH keys.

Note that especially if you're using SSH keys with GitHub on Biowulf, you might need to start up the ssh-agent and run `ssh-add` to start your key up with each new session.

### Using SSH Keys with Biowulf

You can also use SSH keys to make your life easier and not have to enter your Biowulf password every time. NIH HPC has provided [instructions][biowulf_ssh_key] on how to set up an SSH Key with Biowulf. You might find the GitHub instructions above on how to set up the key easier, but the main difference is that for this, you leave the private key on your local laptop, while you add the public key to your `authorized_keys` file on Biowulf.

## Set up Python

A lot of the work we do is in Python, so it will behoove you to have an updated distribution of Python installed on your laptop and on Biowulf. Please see our detailed instructions on [installing Python on Biowulf via miniconda][python_biowulf] for how to do this without making HPC mad at us. Please ensure that you follow the instructions on acquiring an Anaconda Professional Token from CIT if you install Python through miniconda (the same token can be used for your local laptop and Biowulf). You also can consider installing Python via [mamba][mamba_install].

## Set up and download other useful things

### Clone GitHub repos

One thing you may need/wish to do is to clone necessary GitHub repos to your local laptop. If you've set up your SSH keys (which you should do), you should clone them via SSH. Talk to the senior members of the lab to decide which repos (if any) are necessary for you to download.

### Set up your laptop profiles

Another (subjective) tip: you can add aliases and settings to your .bashrc and .vimrc profiles to make your life easier. Take a look at the samples in the `profiles` directory in this repo.

You can also consider setting up your Git config file so that Git will correctly attribute the changes you make to you. To help you with this process, we suggest running the `set_git_config.sh` script in the `profiles` directory in this repo. This will interactively set up your username/email, set your default branch as `main`, create a global `.gitignore` and add some helpful aliases.

### Scripts to automount Biowulf/Helix

This is absolutely not a requirement, but one thing you may want to do is set up a script to auto-mount Biowulf/Helix directories. This means that you can access various directories from Biowulf as though they are on your local MacOS laptop.

In order to automatically mount Biowulf drives, you should create a script using Script Editor called `BiowulfAutoMount.scpt` that looks like this:

```scpt
tell application "Finder"
    mount volume "smb://hpcdrive.nih.gov/SFIM_100RUNS" as user name "USERNAME"
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
You should be able to access them in MacOS under `/Volumes/` in Terminal.
If you run

```bash
sudo ln -s /Volumes /data
```

then you can share scripts across MacOS and Biowulf which rely on data
living in `/data/` rather than `/Volumes/`.
Follow additional instructions from the NIH HPC team [here][helix_mount] for MacOS in order to
improve mount performance.

[software]: <software.md>
[ssh-keys]:<https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>
[gh_affiliate]: <https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>
[biowulf_ssh_key]: https://hpc.nih.gov/docs/sshkeys.html
[python_biowulf]: <biowulf_conda.md>
[helix_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
[role_based_training]: https://irtsectraining.nih.gov/
[mamba_install]: https://github.com/Paradoxdruid/mamba-how-to?tab=readme-ov-file
