# Profiles
Profiles are files, often beginning with a `.` in which contain
information for your terminal and terminal-based programs to
access every time they run. This files are normally hidden when
you type `ls`. `ls -a` will show files beginning with a `.`
Anything ending in `.sh` is a shell script which you can run to help
configure your command-line environment.
This directory contains a few helpful files
- `set_git_config.sh` will set some helpful git aliases and defaults.
  (HIGHLY RECOMMENDED).
  A git profile will set up consistent options and settings for your git
  workflows.
- `vimrc` is a sample .vimrc that Josh uses, useful if you will be using
  the text editor `vim`.
  You can replace an existing `.vimrc` with this one.
- `.bash_profile` gets run every time you start a new terminal with the
  bash shell.
- `set_config.sh` is going to run `set_git_config.sh` and create the
  `.vimrc` for you, overwriting one if it exists.
  It will also create a `.bash_profile` if one does not exist.

## Git Profile
The script will 
1. Set up your username and email.
1. Set your default branch as `main`.
1. Add aliases.
1. Set up a global .gitignore and add `DS_Store`, a bane of MacOS git
   users.

Aliases added:
- `stat`, short for `status -s`.
- `slog`, short for "short log," which will print a `git log` with only the
  short commit hash in red and subject in green.
