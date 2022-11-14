#!/bin/zsh

# Setup
git switch main
npm i
HASH=$(git log -n 1 --pretty=format:"%h")
DATE=$(date '+%B %d, %Y')

# Build
echo "{\"commitHash\": \"$HASH\", \"buildDate\": \"$DATE\"}" > src/lib/staticdata.json
npm run build
git restore src/lib/staticdata.json

# Switch to new branch
git switch --orphan deploy/$HASH

# Expand build into current directory
mv build/* ./
rm -r build

# Add nojekyll and gitignore
touch .nojekyll
echo "/node_modules" >> .gitignore
echo "/.svelte-kit" >> .gitignore
echo ".DS_Store" >> .gitignore

# Commit deployment
git rm -r --cached .
git add .
git commit -m "Add deployment for $HASH"

# Merge into deploy/current
git switch deploy/current
git merge -X theirs deploy/$HASH --allow-unrelated-histories --squash
git commit -m "Add deployment for $HASH"

git branch -D deploy/$HASH
git switch main
