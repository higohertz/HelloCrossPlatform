#!/bin/bash

trap 'echo "ERROR occurred. ABORT..." >&2; exit 1;' 0
set -e

source "argparse.sh"
ARGPARSE_VAR_PREFIX=

echo "all params: $@"

############################################################
##
## PARSE/SET ARGUMENTS
##
############################################################

BUILD_LIBS_DIR=build_libs
BUILD_GAME_DIR=build_game

#GENERATOR=
GENERATOR="Xcode"
#GENERATOR="Unix Makefiles"
#GENERATOR="MSYS Makefile"

#BUILD_TYPE="Debug"
BUILD_TYPE="Release"

PLATFORM="macos"

putarg "arg='p:platform' dest='PLATFORM' count=1 description='Target platform (macos|windows|ios|android|wphone)'"
putarg "arg='h:help' dest='HELP_USAGE' description='Show this help'"
args_parse "$@" || { make_usage; exit 1; }
[[ "x$HELP_USAGE" == "x1" ]] && { make_usage; exit 1; }

############################################################
##
## RUN MAIN
##
############################################################

function main()
{
	CMAKE_OPTIONS=()
	CMAKE_OPTIONS+=("-G${GENERATOR}")
	CMAKE_OPTIONS+=("-DCMAKE_BUILD_TYPE=$BUILD_TYPE")
	case $PLATFORM in
		macos)
			CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_MACOS=ON");;
		windows)
			CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_WINDOWS=ON");;
		ios)
			CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_IOS=ON");;
		android)
			CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_ANDROID=ON");;
		wphone)
			CMAKE_OPTIONS+=("-DKI_BUILD_PLATFORM_WPHONE=ON");;
	esac

#	MakeProjectLibs "1"
	MakeProjectGame "1"
#	open $BUILD_GAME_DIR/game.xcodeproj
}

############################################################
##
##
############################################################

function MakeProjectLibs()
{
	local lcBuild=$1
	echo -e "\n >> MAKE PROJECT LIBS. ARGS: Build = $lcBuild \n"

	rm -rf $BUILD_LIBS_DIR
	mkdir -p $BUILD_LIBS_DIR
	pushd $BUILD_LIBS_DIR

	echo "CMAKE_OPTIONS: ${CMAKE_OPTIONS[@]}"
	cmake ${CMAKE_OPTIONS[@]} ../cmake/libs

	if ! [[ "x$lcBuild" == "x" ]]; then
		cmake --build . --config $BUILD_TYPE
	fi

	popd
}

############################################################
##
##
############################################################

function MakeProjectGame()
{
	local lcBuild=$1
	echo -e "\n >> MAKE PROJECT GAME. ARGS: Build = $lcBuild \n"

	rm -rf $BUILD_GAME_DIR
	mkdir -p $BUILD_GAME_DIR
	pushd $BUILD_GAME_DIR
	
	echo "Copy 3d party libs"
	cp -R ../$BUILD_LIBS_DIR/libs .
	
	echo "CMAKE_OPTIONS: ${CMAKE_OPTIONS[@]}"
	cmake ${CMAKE_OPTIONS[@]} ../src

	if ! [[ "x$lcBuild" == "x" ]]; then
		cmake --build . --config $BUILD_TYPE
	fi

	popd
}

############################################################
##
##
############################################################

main "$@"
trap - 0