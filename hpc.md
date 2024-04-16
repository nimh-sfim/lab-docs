# Biowulf and High-Performance Computing at NIH

In SFIM, we use the NIH Biowulf cluster to do most of our data analysis. This is a GNU/Linux parallel processing system designed and built at the NIH that permits running large number of simultaneous jobs with high requirements of memory and processing power. This document collates resources for using Biowulf and HPC. Much of this is useful for setting up your account on Biowulf to benefit our typical workflows.

- Setting up Biowulf
  - [Installing Python](#install-python-on-biowulf)
  - [Automount Helix Drives](#automount-helix-drives)
  - [SSH Keys](#ssh-keys-for-github-on-biowulf)
- Using Biowulf
  - [Helpful HPC Tutorials](#hpc-tutorials)
  - [Useful Modules](#useful-modules)
  - [Using git on biowulf](Using-git-on-biowulf)
  - [Directory Permissions](Directory-Permissions)

## Set Up

### Install Python on Biowulf

Sometimes Biowulf and Python can have issues.
HPC has a fairly comprehensive guide [here][biowulf_python] that you can read, which includes information about the default versions of Python that are installed on Biowulf and common pitfalls. They have also created a [guide][biowulf_HPC_conda] on how to use conda and mamba to manage environments on Biowulf; there are a variety of important steps to do this correctly, so we have additional step-by-step instructions for [setting up conda on biowulf][biowulf_conda].

It is important to note that there can be a naming conflict ("dbus") when using `conda` on Biowulf. This confict can cause NoMachine to fail intermittently.
The solution is to first try to remove the lines inserted by conda into your `.bashrc`, so that conda does not load by default.
In the case that this does not work, try removing `dbus` with

```bash
conda uninstall dbus
```

which will remove the `dbus` package.
This can cause issues if you have packages which depend on it.

### Automount Helix Drives

These are instructions for setting Biowulf drives to automount on MacOS. This allows you to see your Biowulf drives in Finder as though they are a local directory on your laptop.
In order to automatically mount Biowulf drives, you should create a script
using Script Editor called `BiowulfAutoMount.scpt` that looks like this:

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

Follow additional instructions [here][helix_mount] for MacOS in order to
improve mount performance.

### SSH Keys for GitHub on Biowulf

You will want an SSH key on Biowulf to connect with GitHub via the command line. You can follow the same instructions used for [setting up your laptop][set_up_laptop].

If you are using Git on Biowulf, you might get some weird fatal errors when you start a new session. If this happens, try to restart the ssh-agent and re-add the key (instructions [here][ssh-add] from GitHub).

## Using Biowulf

### HPC Tutorials

The HPC team has put together an incredible amount of [helpful tutorials][biowulf_tutorials], including a [user guide][biowulf_guide] for common tasks and commands. There are many of them, but the following may be particularly useful as you get started:

- Connect to NIH HPC systems on your [Mac][biowulf_connect_mac] or via [NoMachine][biowulf_connect_nx]
  - You can connect to Biowulf through the Terminal using `ssh`, but using NoMachine may be necessary if you are using graphical applications.
- [Using Jupyter Notebooks on Biowulf][biowulf_jupyter]
  - If you want to run a Jupyter Notebook that connects to a compute node, you must create an SSH Tunnel. This requires a few specific steps outlined in the HPC documentation.
- [NIMH-specific resources][biowulf_nimh]
  - Specifically, more information about `spersist` sessions. These can be useful for setting up SSH tunneling when you want to have a longer session.
- [Swarm guide][swarm]
  - Swarm simplifies submitting a group of commands to the batch system on Biowulf.

In addition to the HPC user guide and tutorials, the Data Sharing and Science Team has helpfully created [additional Biowulf resources][hpc_helpers]. Several key tools are the ability to store an environment in an `spersist` node on the cluster, and the ability to easily run BIDS and fMRIPrep validation.

### Useful Modules

Biowulf has a [module system][module_system] that is sometimes useful for loading common programs that aren't loaded by default. You can use it to load either the newest version on Biowulf or an older version for a range of programs. Several modules that may be particularly useful for neuroimagers are

```bash
module load afni # usually kept up-to-date
module load R
module load git # default git is a very old verion. This will load a more up-to-date version
module load fsl
module load fmriprep
module load mriqc
module load matlab
```

It's a bit messy, but some additional common programs are in `/data/NIMH_SFIM/CommonScripts` and some common anatomical parcellations are in `/data/NIMH_SFIM/CommonParcellations`. These might be out-of-date, but if you want to install a newer version there so that others can benefit, just ask around before updating.

### Directory Permissions

If you're collaborating with others in a directory on Biowulf, you may need to change the permissions to allow others to write or read content. On Biowulf, each file or directory is part of a group. That group should be `SFIM` or the name of the `/data/[group]` directory. New files sometimes have the group as an individual's user ID, which means others won't be able to see it. `chgrp -R SFIM directory` will change the group for `directory` and all of the files inside. You can then adjust group access with `chmod -R 2770 directory`. The first `2` means that new files within a directory will (theoretically) inherit the same group name and permissions. The next 3 digits define file owner, group, and world permissions. 7 means a file is read/write/executable, 4 is read only, and 0 is no permissions. You can also consider adding `umask 007` to your `~/.bashrc` on Biowulf, which will allow all members of the directory's group to have write access to new subdirectories automatically.

 Here are some useful options

```bash
chmod -R 2770 directory # Owner and group can read/write/execute
chmod -R 2700 directory # Only owner can read/write/execute
chmod -R 2740 directory # Owner can read/write/execute and group members can read, but not alter files
```

Unless you are sharing files that do not contain personnally identifiable information (PII) with an out-group Biowulf user, **never** make files world-readable on Biowulf. If you have an ongoing collaboration with someone outside of SFIM, request a new group where you can define who has access. For example, `SFIMLBC` has been used for some collaborations between SFIM and other LBC lab members.

For more details and guidance from the HPC team, see their documetnation [here][biowulf_permissions].

### Using Git on Biowulf

Every cloned GitHub repo has a named owner. That means, if multiple people are working on the same code in the same Biowulf directory, it will be impossible to see who made which edit. Having multiple people work on code in one location can be convenient if one person is making most of the edits with some paired coding support from someone else. If this is the case, make sure to set `chmod` permissions for the code, including the `.git` directory so that they both have write access.

If a repo has more than one active contributor, storing the codebase in a single directory can cause problems. In this case, it is better for each person to have their own clone of the repo where they edit and commit changes to GitHub while specifying one location for where code is run from. Concretely, this might look like:

```bash
SFIM_shared_dir/ # shared directory on Biowulf
├── data # store data here
├── personA # person A's clone of a git repo
│   └── .git
└── personB # person B's clone of the git repo
    └── .git
```

If you aren't sure what the best structure for your project is, talk to the Scientific Programmer at the beginning of your project to get things set up.

#### Special note when using Git with VSCode

In order to interact with GitHub repos when you're connected to a compute node on VSCode via the Remote Developer Extension, you must have added the following to `~/.ssh/config` on Biowulf, replacing `$username` with your Biowulf username. Note that for this to work, the repository must be cloned using `https` not `ssh`.

```SSH Config
Host github.com
  User git
  ProxyCommand /usr/bin/ssh -o ForwardAgent=yes $username@biowulf.nih.gov nc -w 120ms %h %p
```

For additional information on using VSCode, check out our [VSCode Guide.][vscode_guide]

[biowulf_tutorials]: <https://hpc.nih.gov/training/intro_biowulf/>
[biowulf_guide]: <https://hpc.nih.gov/docs/userguide.html>
[biowulf_connect_mac]: https://hpc.nih.gov/docs/connect.html
[biowulf_connect_nx]: https://hpc.nih.gov/docs/nx.html
[biowulf_conda]: biowulf_conda.md
[biowulf_HPC_conda]: https://hpc.nih.gov/docs/diy_installation/conda.html
[set_up_laptop]: set_up_laptop.md
[helix_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
[module_system]: <https://hpc.nih.gov/apps/modules.html>
[biowulf_python]: <https://hpc.nih.gov/apps/python.html>
[ssh-add]:https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
[biowulf_permissions]:https://hpc.nih.gov/storage/permissions.html
[biowulf_jupyter]: https://hpc.nih.gov/apps/jupyter.html
[swarm]: https://hpc.nih.gov/apps/swarm.html
[biowulf_nimh]: https://hpc.nih.gov/docs/nimh.html
[vscode_guide]: <vscode_guide.md>
[hpc_helpers]: https://github.com/nimh-dsst/HPC_helpers
