#!/bin/bash
set -eu
VERSION=${VERSION:-"v1.0.0"}
WORKDIR=$(git rev-parse --show-toplevel)
rm -rf ${WORKDIR}/gen
mkdir ${WORKDIR}/gen
go run main.go

for f in ${WORKDIR}/gen/*.svg; do 
  echo "--- processing: $f"
  LC_CTYPE="en_US.UTF-8" convert -background none ${f} "${f%.svg}.png"
done

pushd ${WORKDIR}/gen 
find . -name '*.png' | zip -@ progress-emojis.zip 
popd 
rm -rf ${WORKDIR}/build
mkdir -p ${WORKDIR}/build
mv gen/progress-emojis.zip ${WORKDIR}/build/progress-emojis-${VERSION}.zip
