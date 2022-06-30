#!/bin/bash

ROOTDIR=$(dirname "$0")
pushd "$ROOTDIR" || exit 1

VERSION=$(rpm -q --qf '%{version}\n' --specfile ./registry-formula.spec 2> /dev/null)

git archive --format=tar.gz --prefix="registry-formula-$VERSION/" HEAD --output="registry-formula-$VERSION.tar.gz"

popd || exit
