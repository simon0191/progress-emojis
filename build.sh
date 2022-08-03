#!/bin/bash
set -eu
WORKDIR=$(git rev-parse --show-toplevel)
rm -rf ${WORKDIR}/gen
mkdir ${WORKDIR}/gen
go run main.go

for f in ${WORKDIR}/gen/*.svg; do 
  echo "--- processing: $f"
  LC_CTYPE="en_US.UTF-8" convert -background none ${f} "${f%.svg}.png"
done
