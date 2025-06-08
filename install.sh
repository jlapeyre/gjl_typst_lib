#!/bin/bash

# Ensure a version number is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <version-number>"
  exit 1
fi

# Set variables
VERSION=$1
PKG_NAME="gjl_typst_lib"
BASE_DIR="$HOME/.local/share/typst/packages/local/$PKG_NAME/$VERSION"

# Create the necessary directory structure
mkdir -p "$BASE_DIR"

# Copy the specified files to the new directory
FILES=("README.md" "typst.toml" "LICENSE")
for file in "${FILES[@]}"; do
  cp "$file" "$BASE_DIR"
done

# Copy the 'src' directory and its contents to the new directory
cp -r ./src "$BASE_DIR"

echo "Files and directories have been copied to $BASE_DIR"
