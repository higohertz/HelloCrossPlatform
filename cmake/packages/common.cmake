#########################################
# set common pathes
#  CMAKE_BINARY_DIR = usually dir /build/..
#  CMAKE_SOURCE_DIR = usually dir with CMakeLists.txt
#########################################

set(KI_TEMP ${CMAKE_BINARY_DIR}/temp)
set(KI_PACKAGE_CMAKE_DIR ${CMAKE_BINARY_DIR}/../cmake/packages)
set(KI_LIB_CMAKE_DIR     ${CMAKE_BINARY_DIR}/../cmake/libs)
set(KI_LIB_SOURCES_DIR   ${CMAKE_BINARY_DIR}/../libs)
set(KI_GAME_SOURCES_DIR   ${CMAKE_BINARY_DIR}/../src)

#########################################
# set output pathes
#########################################

set(CMAKE_MODULE_PATH              ${CMAKE_MODULE_PATH} ${KI_PACKAGE_CMAKE_DIR}) # tell CMake to search modules in directories 

#set(LIBRARY_OUTPUT_PATH            ${CMAKE_BINARY_DIR}/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE}) # if generator == "" 
set(LIBRARY_OUTPUT_PATH            ${CMAKE_BINARY_DIR}/libs/${CMAKE_SYSTEM_NAME})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${LIBRARY_OUTPUT_PATH})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${LIBRARY_OUTPUT_PATH})

#set(EXECUTABLE_OUTPUT_PATH         ${CMAKE_BINARY_DIR}/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE}) # if generator == "" 
set(EXECUTABLE_OUTPUT_PATH         ${CMAKE_BINARY_DIR}/bin/${CMAKE_SYSTEM_NAME}) #
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_PATH})

#########################################
# set user options
#########################################

option (KI_BUILD_PLATFORM_IOS     "Build for iOS"     OFF)
option (KI_BUILD_PLATFORM_ANDROID "Build for Android" OFF)
option (KI_BUILD_PLATFORM_WPHONE  "Build for wPhone"  OFF)
option (KI_BUILD_PLATFORM_WINDOWS "Build for Windows" OFF)
option (KI_BUILD_PLATFORM_MACOS   "Build for MacOS"   OFF)

#########################################
# print output directory
#########################################

message("GENERATOR = ${CMAKE_GENERATOR}")
message("BUILD_TYPE = ${CMAKE_BUILD_TYPE}")

message("CMAKE_BINARY_DIR   = ${CMAKE_BINARY_DIR}")
message("CMAKE_SOURCE_DIR   = ${CMAKE_SOURCE_DIR}")

message("KI_TEMP              = ${KI_TEMP}")
message("KI_PACKAGE_CMAKE_DIR = ${KI_PACKAGE_CMAKE_DIR}")
message("KI_LIB_CMAKE_DIR     = ${KI_LIB_CMAKE_DIR}")
message("KI_LIB_SOURCES_DIR   = ${KI_LIB_SOURCES_DIR}")
message("KI_GAME_SOURCES_DIR  = ${KI_GAME_SOURCES_DIR}")

message("LIBRARY_OUTPUT_PATH    = ${LIBRARY_OUTPUT_PATH}")
message("EXECUTABLE_OUTPUT_PATH = ${EXECUTABLE_OUTPUT_PATH}")

message("KI_BUILD_PLATFORM_IOS     = ${KI_BUILD_PLATFORM_IOS}")
message("KI_BUILD_PLATFORM_ANDROID = ${KI_BUILD_PLATFORM_ANDROID}")
message("KI_BUILD_PLATFORM_WPHONE  = ${KI_BUILD_PLATFORM_WPHONE}")
message("KI_BUILD_PLATFORM_WINDOWS = ${KI_BUILD_PLATFORM_WINDOWS}")
message("KI_BUILD_PLATFORM_MACOS   = ${KI_BUILD_PLATFORM_MACOS}")