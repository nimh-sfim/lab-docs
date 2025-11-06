# Helpful Tips

## Generate a .tsv file

For things like BIDS, you may need to generate a .tsv file.
We recommend the following procedure:

1. Create your file in Excel
1. Go to File -> Save As -> Tab-delimited text (\*.txt).
1. Accept that there will be potential information loss (note: this means
   you can't use things like formulas)
1. Rename your `.txt` file to a `.tsv` file, with either your operating
   system's renaming function or with

   ```bash
   mv file.txt file.tsv
   ```

If you already have a csv file (comma separated values), you can create a tsv file using:

   ```bash
   sed 's/,/\t/g' file.csv > file.tsv
   ```

## Updating your password

If you get an email telling you that you need to update your password, you should change your password through the black key icon in the top right of your screen. This will ensure that your laptop password and NIH credentials stay synced and you don't get locked out of your laptop.

## PIV Cards and the internet browser

You may run into an issue when trying to authenticate on various NIH sites using your PIV card if you try to check your certificate before your laptop realizes that you have your card inserted. You might find that you get all sorts of funky messages and it won't let you try to authenticate via PIV card again. If this happens, you can try to quit out of your browswer (i.e. `Command + Q` on a Mac) and then re-open your windows. This should allow you to try to find your PIV card again and all should be well. Alternatively, you can try to use an incognito or private browswer window.

## SSH Keys

If you log out of your shell (i.e. quit out of Terminal, re-start your laptop, log out of Biowulf, etc) and then try to interact with GitHub, you will likely get an error that looks like:

```bash
Permission denied (publickey)
```

In most cases, this means that your ssh-agent has been stopped and you need to re-add your identities to the agent. To do so, you can run the following commands:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Note that this command assumes that your SSH keys don't have personal labels and are located in ```~/.ssh```. If this is not the case (you're on Biowulf, or you have given your keys different names), make sure to make those changes in your command. On Biowulf, it is likely that your SSH keys are located in ```/data/$USER/.ssh```, where ```$USER``` is your Biowulf login.

## Installing Pylink with PsychoPy

If you want to do work with eye-tracking, you'll need to install the ```pylink``` package, which comes with the [Eyelink Developer's Kit](https://www.sr-research.com/support/forum-9.html). You can follow their instructions to either [install](https://www.sr-research.com/support/thread-8291.html) via ```pip```, or you can install offline by building the included wheel (```pip install *.whl```, where you will need to use the .whl file associated with your version of Python).

One important note is that if you wish to use pylink in the context of PsychoPy's Builder or Coder, you need to ensure that the standalone version of Python that is shipped with PsychoPy can access the pylink package. To do so, you should find where the pylink package has been installed to your computer (one way is to run ```pip show sr-research-pylink```). From there, you will need to copy the whole directory to PsychoPy's version of Python - this is likely somewhere like ```/Applications/PsychoPy.app/Contents/Resources/lib/python3.10``` (although it may be a different version of Python). You can just copy the whole package directory into this folder. If you have installed the package offline via a wheel, you may have to rename the ```pylink_c_somestuffhere.so``` to just ```pylink_c.so```.

## Intel Distribution of Python

For some scientific computing purposes, you may wish to install an [Intel distribution of Python](https://www.intel.com/content/www/us/en/developer/tools/oneapi/distribution-for-python.html). This version of Python is optimized for linear algebra functions in NumPy and SciPy, which can drastically speed up computation times. Instructions to install this distribution are [here](https://www.intel.com/content/www/us/en/developer/tools/oneapi/distribution-python-download.html), but for convenience, the relevant commands are below.

To install with conda:

```bash
conda create -n idp intelpython3_full python=3.12 -c https://software.repos.intel.com/python/conda -c conda-forge --override-channels
conda activate idp
```

To install with mamba:

```bash
mamba create -n idp intelpython3_full python=3.12 -c https://software.repos.intel.com/python/conda -c conda-forge --override-channels
mamba activate idp
```

Note that you may wish to change the name of the environment and the version of Python. Currently (as of 11/6/25), the options available are Python 3.11 and 3.12, but this may change in the future.

## Getting Code Versions

When you're finalizing your project for publication, you'll need to have a list of versions of packages and software used for your analyses. Here's how to do this depending on what software stack you're using.

### Python

If you're writing code in Python, there are a few different ways to get this information, depending on how you're managing your environments.

If you're using conda:

```bash

conda activate ENV_NAME # activate your environment
conda list # list out all versions 
conda env export > environment.yml # export environment to a yml file that can be used to recreate environment
```

If you're using mamba, the command is exactly the same format:

```bash
mamba activate ENV_NAME
mamba env export > environment.yaml
```

If you're using pip:

```bash
pip freeze > requirements.txt
```

### MATLAB

To get version information about all currently installed MATLAB packages, you can run:

```bash
ver
```

### R

If you're using R, the relevant information for all packages loaded in your workspace is one command:

```R
sessionInfo()
```

If you're interested in doing environment management in R like you do with conda/mamba/pip in Python, consider looking into the [packrat](https://rstudio.github.io/packrat/walkthrough.html) package
