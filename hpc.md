# Biowulf and High-Performance Computing at NIH

This collates resources for using Biowulf and HPC

- [Biowulf Tutorials][biowulf_tutorials]
- [Biowulf User Guide][biowulf_guide]
- [Automount Helix Drives](#automount-helix-drives)
- [Useful Modules](#Useful-Modules)
- [VSCode and Biowulf](#VSCode-and-Biowulf)

## Automount Helix Drives

These are instructions for setting Helix drives to automount on MacOS.
In order to automatically mount helix drives, you should create a script
using Script Editor called `HelixAutoMount.scpt` that looks like this:

```scpt
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

```bash
sudo ln -s /Volumes /data
```

then you can share scripts across MacOS and biowulf which rely on data
living in `/data/` rather than `/Volumes/`.
Follow additional instructions [here][helix_mount] for MacOS in order to
tune mount performance.

## Useful Modules

Biowulf has a [module system][module_system] that is sometimes useful for loading common programs that aren't loaded by default. You can use it to load either the newest version on biowulf or an older version for a range of programs. The [linked guide][module_system] has more information. Several modules that may be particularly useful for neuroimagers are

```bash
module load afni
module load R
module load git
module load fsl
module load fmriprep
module load mriqc
module load matlab
```

It's a bit messy, but some additional common programs are in /data/NIMH_SFIM/CommonScripts and some common anatomical parcellations are in /data/NIMH_SFIM/CommonParcellations. These might be out-of-date, but if you want to install a newer version there so that others can benefit, just ask around before updating.

## VSCode and Biowulf

VSCode has some nice features for using with Biowulf. Noteably, with the remote development extension, you can open a local copy of VSCode to save and edit scripts with no network lag, but, have scripts and command executions happen on a biowful node. The big advantage of this approach is that, unlike opening a remote script in a local script editor, the actual VSCode system is running on biowulf so, if you get disconnected, you can simply reconnect and everything is still there.

There are a few quirks with this setup. VScode will recognize your self-defined PATH, but not any calls to `module load` That means, unless you hard-code the path to a newer git version, it will use the default, very old git version. To correct this, add `export PATH=/usr/local/git/2.31.1/bin:$PATH` to your `~/.profile` on biowful. Note: 2.31.1 is the most recent git version, when this was written. You can `ls /usr/local/git` to see the current newest version and use that number instead.

[Here is a guide][biowulf_vscode] to connecting directly to an interactive or persistent node on biowulf. The key steps are to:

1. Install the `Remote Developer Extension` in VSCode.
2. Create an SSH key for logging into biowulf (detailed in the biowulf guide)
3. Open your ssh config file on your Mac. Likely  `/Users/$username/.ssh/config` with $username being your user ID. In that file add (again with your user ID):

    ```
    Host cn*
    User $username
    ProxyCommand /usr/bin/ssh -o ForwardAgent=yes $username@biowulf.nih.gov nc -w 120ms %h %p
    ```
4. Start an spersist node on biowulf and note the node number (i.e cn2728)
5. With the Remote Developer Exension installed, the bottom left corner of VSCode should be a symbol like >< in green. Click it, `Connect to Host` and type in just the node number (i.e. `cn2728`).

## Biowulf and Python
Sometimes biowulf and Python can have issues.
HPC has a fairly comprehensive guide [here][biowulf_python] that you can read.
One fairly common issue is the use of Python environments and biowulf, particularly conda.
There is a naming conflict ("dbus") that can be introduced, and may cause NoMachine to fail intermittently.
The solution is to first try to remove the lines inserted by conda into your `.bashrc`, so that conda does not load by default.
In the case that this does not work, try removing `dbus` with
```
conda uninstall dbus
```
which will remove the `dbus` package.
This can cause issues if you have packages which depend on it.

[biowulf_tutorials]: <https://hpc.nih.gov/training/intro_biowulf/>
[biowulf_guide]: <https://hpc.nih.gov/docs/userguide.html>
[helix_mount]: <https://hpc.nih.gov/docs/helixdrive.html>
[module_system]: <https://hpc.nih.gov/apps/modules.html>
[biowulf_vscode]: <https://hpc.nih.gov/apps/vscode.html>
[biowulf_python: <https://hpc.nih.gov/apps/python.html>
