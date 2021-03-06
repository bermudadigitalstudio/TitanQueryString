#!/usr/bin/env bash

# Replace the following with something like TESTIMPORTMODULE="MyPackageTests"
TESTIMPORTMODULE="TitanQueryStringTests"

SOURCERY_VERSION="$(sourcery --version)"
if [ "$SOURCERY_VERSION" != "0.5.3" ]
then
  echo "You need sourcery 0.5.3 – please `brew install sourcery`"
  exit 1
fi

set -e
SCRIPTS="`dirname \"$0\"`"
TESTS="$SCRIPTS/../Tests"

sourcery $TESTS $SCRIPTS/LinuxMain.stencil $TESTS --args testimports="@testable import $TESTIMPORTMODULE"
mv $TESTS/LinuxMain.generated.swift $TESTS/LinuxMain.swift
