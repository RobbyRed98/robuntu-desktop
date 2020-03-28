#!/bin/bash

set -e 

SOURCE_DIR="$( dirname "${BASH_SOURCE[0]}" )"
cd "./$SOURCE_DIR"

PACKAGE_NAME="robuntu-desktop"
VERSION="$( head -n 1 VERSION )"

if [ -d "build/*" ]; then
    sudo rm build/* -rfv
fi

sudo rsync -av debian build/$PACKAGE_NAME-$VERSION

cd "./build/$PACKAGE_NAME-$VERSION"

dh_make --createorig --indep --yes && ?=0

debuild -us -uc

exit 0
