#!/bin/zsh

git switch main
HASH=$(git log -n 1 --pretty=format:"%h")
DATE=$(date '+%B %d, %Y')
echo "{\"commitHash\": \"$HASH\", \"buildDate\": \"$DATE\"}" > src/lib/staticdata.json
npm run build
git restore src/lib/staticdata.json
git switch --orphan deploy/$HASH
echo "/node_modules" > .gitignore
echo "/.svelte-kit" > .gitignore
echo ".DS_Store" > .gitignore
mv build/* ./
rm -r build
git rm -r --cached .
git add .
git commit -m "Add deployment for $HASH"
git switch deploy/current
git merge -X theirs deploy/$HASH --allow-unrelated-histories -m "Add deployment for $HASH"
git branch -d deploy/$HASH
git switch main
