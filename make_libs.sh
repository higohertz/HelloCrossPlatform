#!/bin/bash

rm -rf build
mkdir -p build
cd build

CMAKE_OPTIONS=()
CMAKE_OPTIONS+=("-DHH_BUILD_PLATFORM_MACOS=1")

echo "CMAKE_OPTIONS: ${CMAKE_OPTIONS[@]}"
cmake ${CMAKE_OPTIONS[@]} ../libs
make
