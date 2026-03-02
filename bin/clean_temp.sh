#!/bin/bash

TARGET="/home/user/downloads"

find $TARGET -type f -name "*.tmp" -delete

echo "Temporary files removed!"
