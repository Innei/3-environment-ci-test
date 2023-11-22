#!/bin/bash

echo "Select the operation:"
echo "1. Bump to stable"
echo "2. Bump to dev"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" == "1" ]; then
  HEAD=bump/to-stable
  BASE=dev
  TO=stable
elif [ "$choice" == "2" ]; then
  HEAD=bump/to-dev
  BASE=canary
  TO=dev
else
  echo "Invalid choice. Exiting."
  exit 1
fi

git checkout $BASE
git pull --rebase
git checkout -B $HEAD
git push -f origin $HEAD
gh pr create --base $TO --head $HEAD --title "Bump to $TO" --body "Bump" || exit 0
