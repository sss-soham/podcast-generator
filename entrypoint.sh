#!/bin/bash
set -e

echo "==============="

git config --global user.name "${INPUT_NAME}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Generate the podcast feed
python3 /usr/local/bin/feed.py

# Commit and push the updated feed
git add -A
git commit -m "Update Feed" || echo "No changes to commit"
git push origin main

echo "==============="