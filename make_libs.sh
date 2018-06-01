#!/bin/bash

DEBUG=1
GENERATOR= #"Xcode" #"Unix Makefiles"

rm -rf build
mkdir -p build
cd build

CMAKE_OPTIONS=()
CMAKE_OPTIONS+=("-DHH_BUILD_PLATFORM_MACOS=1")
if ! [[ -z $DEBUG ]]; then
  CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=Debug")
else
  CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=Release")
fi

echo "CMAKE_OPTIONS: ${CMAKE_OPTIONS[@]}"
cmake ${GENERATOR} ${CMAKE_OPTIONS[@]} ../libs
make
