# Biowulf and High-Performance Computing at NIH

This collates resources for using Biowulf and HPC. Much of this is useful for setting up your account on Biowulf to benefit our typical workflows.

- [Automount Helix Drives](#automount-helix-drives)
- [Useful Modules](#useful-modules)
- [Biowulf and python](#biowulf-and-python)
- [SSH Keys for GitHub on Biowulf](SSH-Keys-for-GitHub-on-Biowulf)
- [Using git on biowulf](Using-git-on-biowulf)
- [Directory Permissions](Directory-Permissions)
- [Additional HPC resources](#additional-hpc-resources)

## Automount Helix Drives

These are instructions for setting Biowulf drives to automount on MacOS.
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
If you run

```bash
sudo ln -s /Volumes /data
```

then you can share scripts across MacOS and Biowulf which rely on data
living in `/data/` rather than `/Volumes/`.
Follow additional instructions [here][helix_mount] for MacOS in order to
improve mount performance.

## Useful Modules

Biowulf has a [module system][module_system] that is sometimes useful for loading common programs that aren't loaded by default. You can use it to load either the newest version on Biowulf or an older version for a range of programs. The [linked guide][module_system] has more information. Several modules that may be particularly useful for neuroimagers are

```bash
module load afni # usually kept up-to-date
module load R
module load git # default git is a very old verion. This will load a more up-to-date version
module load fsl
module load fmriprep
module load mriqc
module load matlab
```

It's a bit messy, but some additional common programs are in /data/NIMH_SFIM/CommonScripts and some common anatomical parcellations are in /data/NIMH_SFIM/CommonParcellations. These might be out-of-date, but if you want to install a newer version there so that others can benefit, just ask around before updating.

## Biowulf and Python

Sometimes Biowulf and Python can have issues.
HPC has a fairly comprehensive guide [here][biowulf_python] that you can read. We have additional instructions for [setting up conda on biowulf][biowulf_conda].
One fairly common issue is the use of Python environments and Biowulf, particularly conda. There is a naming conflict ("dbus") that can be introduced, and may cause NoMachine to fail intermittently.
The solution is to first try to remove the lines inserted by conda into your `.bashrc`, so that conda does not load by default.
In the case that this does not work, try removing `dbus` with

```bash
conda uninstall dbus
```

which will remove the `dbus` package.
This can cause issues if you have packages which depend on it.

## SSH Keys for GitHub on Biowulf

You will want an SSH key on biowulf to connect with github. You can follow the same instructions used for [setting up your laptop][set_up_laptop].

If you are using Git on Biowulf, you might get some weird fatal errors when you start a new session. If this happens, try to restart the ssh-agent and re-add the key (instructions [here][ssh-add] from GitHub)

## Using git on biowulf

Once you have an ssh key pair between Biowulf and GitHub add the following to `~/.ssh/config` with your username. This might be particularly useful for accessing GitHub through VSCode.

    ```SSH Config
    Host github.com
      User git
      ProxyCommand /usr/bin/ssh -o ForwardAgent=yes username@biowulf.nih.gov nc -w 120ms %h %p
    ```

When you clone a repository use `ssh` not `https`.

Every cloned github repo has a named owner. That means, if multiple people are working on the same code in the same biowulf directory, it will be impossible to see who made which edit. Having multiple people work on code in one location can be convenient if one person is making most of the edits with some paired coding support from someone else, but it will cause problems if a repo has more than one active contributor. It is better for each person to have their own clone of the repo where they edit and commit changes to github while specifying one location for where code is run from.

If two people are coding in the same directory, make sure to set `chmod` permissions for the code, including the `.git` directory so that they both have write access.

## Directory Permissions

If you're collaborating with others in a directory on Biowulf, you may need to change the permissions to allow others to write or read content. On biowful, each file or directory is part of a group. That group should be `SFIM` or the name of the `/data/[group]` directory. New files sometimes have the group as an individual's user ID, which means others won't be able to see it. `chgrp -R SFIM directory` will change the group for `directory` and all of the files inside. You can then adjust group access with `chmod -R 2770 directory` The first `2` means that new files within a directory will (theoretically) inherit the same group name and permissions. The next 3 digits define file owner, group, and world permissions. 7 means a file is read/write/executable, 4 is read only, and 0 is no permissions. Here are some useful options

```bash
chmod -R 2770 directory # Owner and group can read/write/execute
chmod -R 2700 directory # Only owner can read/write/execute
chmod -R 2740 directory # Owner can read/write/execute and group members can read, but not alter files
```

Unless you are sharing files that do not contain personnally identifiable information (PII) with an out-group Biowulf user, **never** make files world-readable on Biowulf. If you have an ongoing collaboration with someone outside of SFIM, request a new group where you can define who has access. For example, `SFIMLBC` has been used for some collaborations between SFIM and other LBC lab members.

## Additional HPC Resources

- [Biowulf Tutorials][biowulf_tutorials]
- [Biowulf User Guide][biowulf_guide]
- [Installing Miniconda on Biowulf][biowulf_conda]
- [VS Code and Biowulf](vscode_guide.md)
- In addition to the user guide and tutorials, Dustin Moraczewski in the Data Sharing and Science Team has helpfully created additional Biowulf resources.
Check them out [here](https://github.com/dmoracze/HPC_helper_tools). Several key tools are the ability to store an environment in an `spersist` node on the cluster, and the ability to easily run BIDS and fMRIPrep validation.

[biowulf_tutorials]: <https://hpc.nih.gov/training/intro_biowulf/>
[biowulf_guide]: <https://hpc.nih.gov/docs/userguide.html>
[biowulf_conda]: biowulf_conda.md
[set_up_laptop]: set_up_laptop.md
[helix_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
[module_system]: <https://hpc.nih.gov/apps/modules.html>
[biowulf_python]: <https://hpc.nih.gov/apps/python.html>
[ssh-add]:https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
