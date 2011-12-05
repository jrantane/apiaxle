#!/usr/bin/env bash

if [[ ! -d "../apiaxle.api" ]]; then
  echo "No ../apiaxle.api to cd to."
  exit 1
fi

function output {
  echo "---"
  echo "layout: apidocs"
  echo "title: \"Api documentation\""
  echo -e "---\n"

  pushd ../apiaxle.api &>/dev/null

  ./bin/generate-docs.coffee

  popd &>/dev/null
}

output > api.md
