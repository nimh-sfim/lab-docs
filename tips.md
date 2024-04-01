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

## SSH Keys for GitHub on Biowulf

If you are using Git on Biowulf, you might get some weird fatal errors when you start a new session. If this happens, try to restart the ssh-agent and re-add the key (instructions [here][ssh-add] from GitHub)

## Aliases

Adding aliases to your `.bashrc` (or the profile for whichever shell script you prefer using) can make your life easier as you navigate around the Terminal. Some potential ones might be:

```bash
alias ls="ls -G" # don't list group ownership
alias ll="ls -lG" # list out all information about all files, including file ownership 
alias ltr="ls -lGtr" # sort by time, newest first
#The following requires having your SSH key set up. Otherwise this requires also including your username@biowulf.
alias biowulf="ssh -XY biowulf.nih.gov"
# If you tend to mess up spellings, the following two aliases will be very useful:
alias biowful="ssh -XY biowulf.nih.gov"
alias biowufl="ssh -XY biowulf.nih.gov"
```

## Directory Permissions

If you're collaborating with others in a directory on Biowulf, you may need to change the permissions to allow others to write or read content. On biowful, each file or directory is part of a group. That group should be `SFIM` or the name of the `/data/[group]` directory. New files sometimes have the group as an individual's user ID, which means others won't be able to see it. `chgrp -R SFIM directory` will change the group for `directory` and all of the files inside. You can then adjust group access with `chmod -R 2770 directory` The first `2` means that new files within a directory will (theoretically) inherit the same group name and permissions. The next 3 digits define file owner, group, and world permissions. 7 means a file is read/write/executable, 4 is read only, and 0 is no permissions. Here are some useful options

```bash
chmod -R 2770 directory # Owner and group can read/write/execute
chmod -R 2700 directory # Only owner can read/write/execute
chmod -R 2740 directory # Owner can read/write/execute and group members can read, but not alter files
```

Unless you are sharing files that do not contain personnally identifiable information (PII) with an out-group Biowulf user, **never** make files world-readable on Biowulf. If you have an ongoing collaboration with someone outside of SFIM, request a new group where you can define who has access. For example, `SFIMLBC` has been used for some collaborations between SFIM and other LBC lab members.

## Using git on biowulf

Every cloned github repo has a named owner. That means, if multiple people are working on the same code in the same biowulf directory, it will be impossible to see who made which edit. Having multiple people work on code in one location can be convenient if one person is making most of the edits with some paired coding support from someone else, but it will cause problems if a repo has more than one active contributor. It is better for each person to have their own clone of the repo where they edit and commit changes to github while specifying one location for where code is run from.

If two people are coding in the same directory, make sure to set `chmod` permissions for the code, including the `.git` directory so that they both have write access.

[ssh-add]:https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
