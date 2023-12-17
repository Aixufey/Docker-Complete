#!/bin/bash

BRANCH=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ "$BRANCH" == "developer" ]; then
    echo "Switched to developer branch, pulling latest from origin/developer..."
    git pull origin developer
elif [ "$BRANCH" == "main" ]; then
    echo "Switched to main branch, pulling latest from origin/main..."
    git pull origin main
fi
