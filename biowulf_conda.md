# Installing miniconda on biowulf

Installing miniconda on biowulf can be a bit tricky due to some of the
restrictions on biowulf users.
Please follow the guide below to install miniconda on biowulf.

## Request an interactive node
The process for installing miniconda can be somewhat surprisingly
intensive.
It is recommended to install it with an interactive node to avoid drawing
the ire of the HPC staff, running
```
sinteractive
```
to request an interactive node.
Once your node is allocated, you may proceed.

## Set Up a Temporary Directory
HPC does not allow users to use the commonly used `/tmp` directory.
As a consequence, you'll have to allocate your own temporary directory.
You can do the following in shell or add it to your bashrc
(don't forget to source it via `. .bashrc` if you want to proceed to
install immediately):
```
export TMPDIR=/data/$USER/tmp
```
If this directory does not exist, run
```
mkdir $TMPDIR
```
to create it.
Enter the temporary directory so that you can keep the miniconda installer
in a temporary location.
```
cd $TMPDIR
```

## Fetch and run the installer
As of September 2021, the following should fetch the correct miniconda
installation script:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
Once it is fetched, you should make the script executable:
```
chmod +x Miniconda3-latest-Linux-x86_64.sh
```
You can now run the installer:
```
./Miniconda3-latest-Linux-x86_64.sh
```

You will be prompted to press `Enter` to begin viewing the license
agreement.
Go ahead and scroll through the sprawling license, reading oh so carefully
and precisely to make sure you understand the legal implications of this
software package even though you're just a researcher trying to make
your Python packaging manageable.
At some point when the license ends, you will be prompted to agree by
typing `yes`, which you should do.
IMPORTANTLY, you should override the default conda install destination
(which is `~/miniconda3` by default).
INSTEAD, replace USER below with your username and use this as the
installation destination:
```
/data/USER/miniconda3
```
This is because your home directory has a very limited amount of storage
allocated to it, but you can request an expansion of storage for your data
directory.
If you have a lot of miniconda environments, this can exhaust your home
directory storage, which should be limited to lightweight configuration
files only.

Lastly, you will be prompted to run conda init, which you should reply
`yes` to.

## Configure conda to not activate base
For various reasons, it is not recommended to activate the base conda
environment on biowulf by default.
The instructions state to run `conda config`, but if you have not sourced
your .bashrc this instruction will fail.
Run
```
/data/$USER/miniconda3/bin/conda config --set auto_activate_base false
```
To properly configure conda to not activate.
Then, the next time you source your .bashrc or log in, you should be able
to activate the base environment via
```
conda activate base
```
If this is successful, you have a working miniconda installation on
biowulf!
If it is not successful, raise an issue in the repository and Josh will
address it.
