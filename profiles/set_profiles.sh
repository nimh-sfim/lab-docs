#!/bin/bash

# Shamelessly stolen from StackOverflow here:
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Bash profile
echo "Setting .bash_profile"
if [ -e ~/.bash_profile ]
then
    echo "A .bash_profile exists, consider manual merging."
    echo "Skipping .bash_profile"
else
    cat $DIR/.bash_profile > ~/.bash_profile
fi

# Vim profile
echo "Setting .vimrc"
if [ -e ~/.vimrc ]
then
    echo "A .vimrc exists, skipping..."
else
    cat $DIR/vimrc > ~/.vimrc
fi

# Git Configuration
echo "Setting git config"
bash $DIR/set_git_config.sh
