#!/usr/bin/env bash

set -e

here="$(pwd)"
tmp=$(mktemp -d)

cd "${tmp}"
cp -r "${here}" .
cd apiaxle

# need to do this so that I can test whilst actually editing this
# script
git reset --hard &>/dev/null

branch="${1:-master}"

# checkout the supplied or the master branch
git checkout "${branch}" >/dev/null
cd api
npm link ../base &>/dev/null

# output the documentation
./bin/generate-docs.coffee > "${tmp}/api.md"

# if that worked we can overwrite this branches docs
cd "${here}"
mv "${tmp}/api.md" .

# now commit
git add "api.md"
git ci -m "Updated documentation via generate-api-docs.bash."

# offer to push, showing diff logs
git fetch

echo "Stuff that can be pushed:"
git log --pretty=oneline --decorate=full --abbrev-commit origin/gh-pages..HEAD

read -p "Push? (y/n) "
[ "$REPLY" == "y" ] && git push origin gh-pages
