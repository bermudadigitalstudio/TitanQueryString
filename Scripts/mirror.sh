#!/usr/bin/env bash

# Bind mount the local Sources, Tests, and Packages dirs into a Swift 3.0 container.

# The container will be erased on stop

set -eo pipefail

IMAGE=swift:3.0

args=()
i=0
# Construct volume mount arguments (we don't want to mount the .build folder, among others!)
for f in "Sources" "Tests" "Package.swift"
do
  args[$i]="-v $(pwd)/$f:/code/$f"
  ((++i))
done

set -x
docker run --rm -it -w /code ${args[@]} $IMAGE bash
