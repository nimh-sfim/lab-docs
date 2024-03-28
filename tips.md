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

## SSH Keys for GitHub on Biowulf

If you are using Git on Biowulf, you might get some weird fatal errors when you start a new session. If this happens, try to restart the ssh-agent and re-add the key (instructions [here][ssh-add] from GitHub)

[ssh-add]:https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent

## Aliases

Adding aliases to your `.bashrc` (or the profile for whichever shell script you prefer using) can make your life easier as you navigate around the Terminal. Some potential ones might be:

```bash
alias ls="ls -G" # don't list group ownership
alias ll="ls -lG" # list out all information about all files, including file ownership 
alias ltr="ls -lGtr" # sort by time, newest first
alias biowulf="ssh USER" #replace USER with your logon information - if you have your SSH key set up, then you can just type "biowulf" and it will log you on. If you tend to mess up spellings, you can also add things like "biowufl" with the same command. 
```

## Directory Permissions

Especially if you're working with collaborators on Biowulf, you may need to ensure that directory permissions allow others to write to them. This also can be an issue with the `.git` directory. If you own the file, you can change permissions using the `chmod` command.
