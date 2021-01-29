#!/bin/bash

cd $1
echo "Git directory: $(pwd)"

echo "Showing branches to delete"
git branch -r --merged develop | grep -e "feature\|bugfix" | sed "s/origin\///" | xargs -n 1
while true; do
  read -p "Do you wish to delete and push those mearged branches? (Yes/No)" yn
  case $yn in
  [Yy]*)
    git branch -r --merged develop | grep -e "feature\|bugfix" | sed "s/origin\///" | xargs -n 1 git push --delete origin
    break
    ;;
  [Nn]*) exit ;;
  *) echo "Please answer yes or no." ;;
  esac
done
