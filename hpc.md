# Biowulf and High-Performance Computing at NIH

This collates resources for using Biowulf and HPC
- [Biowulf Tutorials][biowulf_tutorials]
- [Biowulf User Guide][biowulf_guide]
- [Automount Helix Drives][automount-helix-drives]

## Automount Helix Drives
These are instructions for setting Helix drives to automount on MacOS.
In order to automatically mount helix drives, you should create a script
using Script Editor called `HelixAutoMount.scpt` that looks like this:
```
tell application "Finder"
    mount volume "smb://helixdrive.nih.gov/SFIM_100RUNS" as user name "USERNAME"
    mount volume "smb://helixdrive.nih.gov/NIMH_SFIM" as user name "USERNAME"
    mount volume "smb://helixdrive.nih.gov/USERNAME" as user name "USERNAME"
    mount volume "smb://helixdrive.nih.gov/SFIMLBC" as user name "USERNAME"
    mount volume "smb://helixdrive.nih.gov/SFIM" as user name "USERNAME"
    mount volume "smb://helixdrive.nih.gov/data" as user name "USERNAME"
end tell
```
with `USERNAME` your NIH username.
The `USERNAME` address will mount to `/home/USERNAME` on biowulf.
The `/data` address will mount to `/data/USERNAME`.
All others will go to `/data/DIRNAME` with DIRNAME the directory name.
Then export it as an application in Script Editor.
When you run it, it will mount the directories.
You should be able to access them in MacOS under `/Volumes/` in Terminal.
If you run
```
sudo ln -s /Volumes /data
```
then you can share scripts across MacOS and biowulf which rely on data
living in `/data/` rather than `/Volumes/`.
Follow additional instructions [here][helix_mount] for MacOS in order to
tune mount performance.



[biowulf_tutorials]: <https://hpc.nih.gov/training/intro_biowulf/>
[biowulf_guide]: <https://hpc.nih.gov/docs/userguide.html>
[helix_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
