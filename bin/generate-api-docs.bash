#!/usr/bin/env bash

set -e

function output {
  echo "---"
  echo "layout: apidocs"
  echo "title: \"Api documentation\""
  echo -e "---\n"

  ./bin/generate-docs.coffee
}

here="$(pwd)"
tmp=$(mktemp -d)

cd "${tmp}"
git clone "${here}"
cd apiaxle
git checkout master
cd api
npm install
npm link ../base
output > "${here}/api.md"

