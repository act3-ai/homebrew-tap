#!/usr/bin/env bash
set -e

# update-formula-version.sh "Formula/act3-pt.rb" "1.0.0"

FORMULA_FILE=$1 # Path to formula to update
VERSION=$2      # Version to update formula to

# Find something like "version 'v*.*.*'" and replace with the new version number
sed -i -E "s/version ['\"](.*)['\"]/version \"${VERSION#v}\"/g" "${FORMULA_FILE}"
