@echo off

rmdir /S /Q build
mkdir build
cd build

cmake -DKI_BUILD_PLATFORM_WINDOWS=ON -DCMAKE_BUILD_TYPE=Debug ../cmake
