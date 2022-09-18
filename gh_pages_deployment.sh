#!/bin/sh

# Author: Lavanya Mishra

# 1. Switch to a new branch.
git checkout --orphan gh-pages

# 2. Build the production version.
yarn build

# 3. Add the 'dist' files to a work-tree.
git --work-tree dist add --all

# 4. Commit the changes.
git --work-tree dist commit -m "Deploy."

# 5. Push the changes.
git push origin HEAD:gh-pages --force

# 6. Delete the 'dist' repo.
rm -r dist

# 7. Switch to 'dev' branch.
git checkout dev -f

# 8. Delete 'gh-pages' branch.
git branch -D gh-pages
