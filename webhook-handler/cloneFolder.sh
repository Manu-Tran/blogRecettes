#!/usr/bin/env bash
set -euo pipefail

# Create a directory, so Git doesn't get messy, and enter it
mkdir /meta && cd /meta

# Start a Git repository
git init

# Track repository, do not enter subdirectory
git remote add -f origin https://github.com/Manu-Tran/blogRecettes

# Enable the tree check feature
git config core.sparseCheckout true

# Create a file in the path: .git/info/sparse-checkout
# That is inside the hidden .git directory that was created
# by running the command: git init
# And inside it enter the name of the sub directory you only want to clone
echo 'recettes' >> .git/info/sparse-checkout

## Download with pull, not clone
git pull origin master

git reset --hard
