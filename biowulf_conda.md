# Installing conda on Biowulf

## Installing via mamba_install

We recommend installing conda on Biowulf via miniforge, which includes mamba, a faster implementation of conda. The good people on the Biowulf team have set up a convenient ```mamba_install```  script to make your life easier. To run this script, request an sinteractive node and run:

``` bash
module load mamba_install 
mamba_install
```

From there, you can activate conda by running:

``` bash
source myconda
```

## Configure conda to not activate base

For various reasons, it is not recommended to activate the base conda
environment on biowulf by default.
The instructions state to run `conda config`, but if you have not sourced
your .bashrc this instruction will fail.
Run

``` bash
conda config --set auto_activate_base false
```

To properly configure conda to not activate.
Then, the next time you source your .bashrc or log in, you should be able
to activate the base environment via

``` bash
conda activate base
```

If this is successful, you have a working conda/mamba installation on
Biowulf! If it is not successful, check in with Catherine, Dan or Javier and they will work with you to fix it.