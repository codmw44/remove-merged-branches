#!/bin/bash

cd $1
echo "Git directory: $(pwd)"


if [[ "$2" == "delete" ]]; then
    while true; do
    read -p "Do you wish to delete and push already mearged branches? (Yes/No)" yn
    case $yn in
        [Yy]* ) git branch -r --merged develop | grep -e "feature" | sed "s/origin\///" | xargs -n 1 git push --delete origin; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
    done
    
else
    echo "Show branches to delete. Run script with "delete" argument for delete"
    git branch -r --merged develop | grep -e "feature" | sed "s/origin\///" | xargs -n 1
fi