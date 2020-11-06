# Profiles
This directory contains a few helpful files
- `set_git_config.sh` will set some helpful git aliases and defaults.
  (HIGHLY RECOMMENDED).
- `vimrc` is a sample .vimrc that Josh uses.
  You can replace an existing `.vimrc` with this one.
- `set_config.sh` is going to run `set_git_config.sh` and create the
  `.vimrc` for you, overwriting one if it exists.

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
