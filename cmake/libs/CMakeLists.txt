cmake_minimum_required(VERSION 3.0)

project(lib)

#########################################
# set common pathes
#  CMAKE_BINARY_DIR = usually dir /build/..
#  CMAKE_SOURCE_DIR = usually dir with CMakeLists.txt
#########################################

set(KI_TEMP ${CMAKE_BINARY_DIR}/temp)
set(KI_PACKAGE_CMAKE_DIR ${CMAKE_BINARY_DIR}/../cmake/packages)
set(KI_LIB_CMAKE_DIR     ${CMAKE_BINARY_DIR}/../cmake/libs)
set(KI_LIB_SOURCES_DIR   ${CMAKE_BINARY_DIR}/../libs)

#########################################
# set output pathes
#########################################

set(CMAKE_MODULE_PATH              ${CMAKE_MODULE_PATH} ) # tell CMake to search modules in directories 

set(LIBRARY_OUTPUT_PATH            ${CMAKE_BINARY_DIR}/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${LIBRARY_OUTPUT_PATH})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${LIBRARY_OUTPUT_PATH})
set(EXECUTABLE_OUTPUT_PATH         ${CMAKE_BINARY_DIR}/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})
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

message("CMAKE_BINARY_DIR   = ${CMAKE_BINARY_DIR}")
message("CMAKE_SOURCE_DIR   = ${CMAKE_SOURCE_DIR}")

message("KI_TEMP            = ${KI_TEMP}")
message("KI_LIB_CMAKE_DIR   = ${KI_LIB_CMAKE_DIR}")
message("KI_LIB_SOURCES_DIR = ${KI_LIB_SOURCES_DIR}")

message("KI_BUILD_PLATFORM_IOS     = ${KI_BUILD_PLATFORM_IOS}")
message("KI_BUILD_PLATFORM_ANDROID = ${KI_BUILD_PLATFORM_ANDROID}")
message("KI_BUILD_PLATFORM_WPHONE  = ${KI_BUILD_PLATFORM_WPHONE}")
message("KI_BUILD_PLATFORM_WINDOWS = ${KI_BUILD_PLATFORM_WINDOWS}")
message("KI_BUILD_PLATFORM_MACOS   = ${KI_BUILD_PLATFORM_MACOS}")

if(KI_BUILD_PLATFORM_IOS)
    message(FATAL_ERROR "Build platform not supported")
elseif(KI_BUILD_PLATFORM_ANDROID)
    message(FATAL_ERROR "Build platform not supported")
elseif(KI_BUILD_PLATFORM_WPHONE)
    message(FATAL_ERROR "Build platform not supported")
elseif(KI_BUILD_PLATFORM_WINDOWS)
    #message(FATAL_ERROR "Build platform not supported")
elseif(KI_BUILD_PLATFORM_MACOS)
    #message(FATAL_ERROR "Build platform not supported")
endif()

#########################################
# generate debug symbol
#########################################

if(MSVC_VERSION)
    # ...
else()
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -DDEBUG -g")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -DDEBUG -g")

    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3 -Wreturn-type -DNDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -Wno-reorder -Wreturn-type -DNDEBUG")
endif()

if(NOT WIN32)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-attributes")
endif()

#########################################
# include libs
#########################################

if(NOT TARGET glm)
    set(GLM_TEST_ENABLE           OFF CACHE BOOL "do glm tests" FORCE)
    set(GLM_STATIC_LIBRARY_ENABLE OFF CACHE BOOL "do glm optional lib" FORCE)
    add_subdirectory(${KI_LIB_CMAKE_DIR}/glm ${KI_TEMP}/glm)
endif()

if(NOT TARGET glew)
    add_subdirectory(${KI_LIB_CMAKE_DIR}/glew ${KI_TEMP}/glew)
endif()

if(NOT TARGET glfw)
    set(BUILD_SHARED_LIBS       OFF CACHE BOOL "Build shared libraries")
    set(GLFW_BUILD_EXAMPLES     OFF CACHE BOOL "Build the GLFW example programs")
    set(GLFW_BUILD_TESTS        OFF CACHE BOOL "Build the GLFW test programs")
    set(GLFW_BUILD_DOCS         OFF CACHE BOOL "Build the GLFW documentation")
    set(GLFW_INSTALL            OFF CACHE BOOL "Generate installation target")
    set(GLFW_DOCUMENT_INTERNALS OFF CACHE BOOL "Include internals in documentation")
    add_subdirectory(${KI_LIB_CMAKE_DIR}/glfw ${KI_TEMP}/glfw)
endif()
