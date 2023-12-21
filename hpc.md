# Biowulf and High-Performance Computing at NIH

This collates resources for using Biowulf and HPC

- [Automount Helix Drives](#automount-helix-drives)
- [Useful Modules](#useful-modules)
- [Biowulf and python](#biowulf-and-python)
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
HPC has a fairly comprehensive guide [here][biowulf_python] that you can read.
One fairly common issue is the use of Python environments and Biowulf, particularly conda.
There is a naming conflict ("dbus") that can be introduced, and may cause NoMachine to fail intermittently.
The solution is to first try to remove the lines inserted by conda into your `.bashrc`, so that conda does not load by default.
In the case that this does not work, try removing `dbus` with

```bash
conda uninstall dbus
```

which will remove the `dbus` package.
This can cause issues if you have packages which depend on it.

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
[helix_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
[module_system]: <https://hpc.nih.gov/apps/modules.html>
[biowulf_python]: <https://hpc.nih.gov/apps/python.html>
