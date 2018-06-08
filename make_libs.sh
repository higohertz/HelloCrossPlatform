#!/bin/bash

DEBUG=1
GENERATOR= #"-G Xcode" #"Unix Makefiles"

CMAKE_OPTIONS=()
CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_MACOS=ON")
if ! [[ -z $DEBUG ]]; then
  CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=Debug")
else
  CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=Release")
fi

###############

rm -rf build
mkdir -p build
cd build

echo "CMAKE_OPTIONS: ${CMAKE_OPTIONS[@]}"
cmake ${GENERATOR} ${CMAKE_OPTIONS[@]} ../cmake

if [[ -z $GENERATOR ]]; then
    make
fi
