#!/bin/bash

DEBUG=
#GENERATOR=
GENERATOR="MSYS Makefile"
#GENERATOR="-G Xcode"
#GENERATOR="Unix Makefiles"

CMAKE_OPTIONS=()
CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_MACOS=ON")
if ! [[ -z $DEBUG ]]; then
  CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=Debug")
else
  CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=Release")
fi

###############

rm -rf build_game
mkdir -p build_game
cd build_game

echo "Copy 3d party libs"
cp -R ../build_libs/libs .

echo "CMAKE_OPTIONS: ${CMAKE_OPTIONS[@]}"
cmake ${GENERATOR} ${CMAKE_OPTIONS[@]} ../src

if [[ -z $GENERATOR ]]; then
    make
else
    open game.xcodeproj
fi
