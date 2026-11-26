#!/bin/bash

# Codespaces repo symlink script

# ----------------------------------------------------------------------
# 1. Define Variables (Using readlink -f to avoid symlink loops)
# ----------------------------------------------------------------------
WORKSPACE_ROOT="$(readlink -f "$PWD")"
SYMLINK_PATH="$HOME/repo"

echo "Starting Codespaces setup..."
echo "----------------------------------------------------"

# Safety check: Prevent linking to itself if run from the home directory
if [ "$WORKSPACE_ROOT" = "$HOME" ]; then
    echo "ERROR: You cannot run this script from your home directory."
    echo "Please navigate to your repository folder first."
    exit 1
fi

# ----------------------------------------------------------------------
# 2. Create Symlink (Shortcut)
# ----------------------------------------------------------------------

# Clean up existing bad symlinks or directories cleanly
if [ -L "$SYMLINK_PATH" ]; then
    echo "Symlink '~/repo' already exists. Removing old link..."
    rm "$SYMLINK_PATH"
elif [ -d "$SYMLINK_PATH" ]; then
    echo "Warning: A directory named 'repo' already exists in home. Removing it..."
    rm -rf "$SYMLINK_PATH"
fi

# Create the new symlink using the absolute physical path
echo "Creating symlink: ~/repo -> $WORKSPACE_ROOT"
ln -s "$WORKSPACE_ROOT" "$SYMLINK_PATH"

if [ $? -eq 0 ]; then
    echo "SUCCESS: Symlink '~/repo' created."
else
    echo "ERROR: Failed to create symlink."
fi

echo "----------------------------------------------------"
echo "Setup complete. You can now use 'cd ~/repo' from anywhere!"
