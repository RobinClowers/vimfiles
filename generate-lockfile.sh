#!/bin/bash

set -eo pipefail

scriptdir=$(cd "$(dirname "$0")" && pwd)
lockfile="$scriptdir/.bundle-lock"

cd "$scriptdir/bundle"

if [[ -f $lockfile ]]; then
  echo "$lockfile exists, please remove it if you want to generate a new one"
  exit 1
fi

for entry in *; do
  if [ -d "$entry" ]; then
    cd "$entry"
    revision=$(git rev-parse HEAD)
    cd ..
    echo "$entry $revision" >> $lockfile
  fi
done
