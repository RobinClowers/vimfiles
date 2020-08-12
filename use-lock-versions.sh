#!/bin/bash

set -eo pipefail

scriptdir=$(cd "$(dirname "$0")" && pwd)
lockfile="$scriptdir/.bundle-lock"

cd "$scriptdir/bundle"

if [[ ! -f "$lockfile" ]]; then
  echo "$lockfile" does not exist, run 'generate-lockfile.sh' first
  exit 1
fi

while IFS=" " read -r package sha; do
  if [[ -d "$package" ]]; then
    cd $package
    git checkout "$sha" &> /dev/null
    echo "$package" is now  at "$sha"
    cd ..
  fi
done < "$lockfile"
