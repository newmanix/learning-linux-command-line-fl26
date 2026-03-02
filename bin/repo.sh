
#!/bin/bash

# Codespaces repo symlink script

# ----------------------------------------------------------------------
# 1. Define Variables
# ----------------------------------------------------------------------

# $PWD holds the current path, which should be the workspace root when
# the user executes this script from the default terminal location.
WORKSPACE_ROOT="$PWD"
SYMLINK_PATH="$HOME/repo"

echo "Starting Codespaces setup..."
echo "----------------------------------------------------"

# ----------------------------------------------------------------------
# 2. Create Symlink (Shortcut)
# ----------------------------------------------------------------------

# Check if the symlink already exists to prevent an error
if [ -L "$SYMLINK_PATH" ]; then
    echo "Symlink '~/repo' already exists. Removing old link..."
    rm "$SYMLINK_PATH"
elif [ -d "$SYMLINK_PATH" ]; then
    echo "Warning: A directory named 'repo' already exists in home. Skipping symlink creation."
    exit 1
fi

# Create the new symlink
echo "Creating symlink: ~/repo -> $WORKSPACE_ROOT"
ln -s "$WORKSPACE_ROOT" "$SYMLINK_PATH"

if [ $? -eq 0 ]; then
    echo "SUCCESS: Symlink '~/repo' created."
else
    echo "ERROR: Failed to create symlink."
fi

echo "----------------------------------------------------"

echo "Setup complete. You can now use 'cd ~/repo' from anywhere, or 'cd repo' once you are in the home directory (~)."

