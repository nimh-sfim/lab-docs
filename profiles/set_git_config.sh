#!/bin/bash
# Set git defaults and aliases as recommended by SFIM

# Check for existing git config
if [ -e ~/.gitconfig ]
then
    echo "Warning: existing .gitconfig"
fi

# Get username and email if they don't exist
git_uname=$(git config --global --get user.name)
git_email=$(git config --global --get user.email)

if [ -z "$git_uname" ]
then
    echo 'No git username is set, please enter one below:'
    read git_uname
    git config --global user.name "$git_uname"
else
    printf "Git name set as %s, skipping\n" "$git_uname"
fi

if [ -z "$git_email" ]
then
    echo 'No git email is set, please enter one below:'
    read git_email
    git config --global user.email "$git_email"
else
    printf "Git email set as %s, skipping\n" "$git_email"
fi

# Set default branch as main
echo "Setting local default branch as main"
git config --global init.defaultBranch main

# Set helpful aliases
echo "Setting helpful aliases; see README for details"
git config --global alias.stat "status -s"
git config --global alias.slog 'log --pretty="%Cred%h %Cgreen%s"'

# Check for existing user .gitignore
git_ignore=$(git config --global --get core.excludesfile)
if [ -z $git_ignore ]
then
    # No .gitignore set; make one
    echo "Creating .gitignore file"
    git config --global core.excludesfile ~/.gitignore
    echo "Adding .DS_Store to .gitignore"
    echo ".DS_Store" >> ~/.gitignore
else
    # .gitignore set; check for existence and make it if it doesn't
    if [ -f ~/.gitignore ]
    then
        var=$(cat ~/.gitignore | grep .DS_Store)
        if [ -z "$var" ]
        then
            printf "Adding .DS_Store to %s" "$var"
            echo ".DS_Store" >> "$git_ignore"
        fi
    else
        echo "Set git ignore does not exist, creating and adding .DS_Store"
        echo ".DS_Store" > "$git_ignore"
    fi
fi
