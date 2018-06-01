cmake_minimum_required(VERSION 3.0)

project(libs)

set(HH_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(HH_LIBS_DIR ${HH_ROOT_DIR}/libs)

message("HH_ROOT_DIR = ${HH_ROOT_DIR}")
message("HH_LIBS_DIR = ${HH_LIBS_DIR}")
message("HH_BUILD_PLATFORM_IOS     = ${HH_BUILD_PLATFORM_IOS}")
message("HH_BUILD_PLATFORM_ANDROID = ${HH_BUILD_PLATFORM_ANDROID}")
message("HH_BUILD_PLATFORM_WPHONE  = ${HH_BUILD_PLATFORM_WPHONE}")
message("HH_BUILD_PLATFORM_WINDOWS = ${HH_BUILD_PLATFORM_WINDOWS}")
message("HH_BUILD_PLATFORM_MACOS   = ${HH_BUILD_PLATFORM_MACOS}")

if(HH_BUILD_PLATFORM_IOS)
    message(FATAL_ERROR "Build platform not supported")
elseif(HH_BUILD_PLATFORM_ANDROID)
    message(FATAL_ERROR "Build platform not supported")
elseif(HH_BUILD_PLATFORM_WPHONE)
    message(FATAL_ERROR "Build platform not supported")
elseif(HH_BUILD_PLATFORM_WINDOWS)
    message(FATAL_ERROR "Build platform not supported")
elseif(HH_BUILD_PLATFORM_MACOS)
    #message(FATAL_ERROR "Build platform not supported")
endif()

# generate debug symbol
if(MSVC_VERSION)
    # ...
else()
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -DDEBUG -g")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG -DDEBUG -g")

    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3 -Wreturn-type -DNDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -Wno-reorder -Wreturn-type -DNDEBUG")
endif()

# set output directory
if(HH_BUILD_PLATFORM_IOS)
    set (LIBRARY_OUTPUT_PATH ${HH_ROOT_DIR}/build/lib/ios/${CMAKE_PROJECT_NAME}$EFFECTIVE_PLATFORM_NAME)
    set (EXECUTABLE_OUTPUT_PATH ${HH_ROOT_DIR}/build/bin/ios/${CMAKE_PROJECT_NAME}$EFFECTIVE_PLATFORM_NAME)
elseif(HH_BUILD_PLATFORM_ANDROID)
    set (LIBRARY_OUTPUT_PATH ${HH_ROOT_DIR}/build/lib/android/${CMAKE_PROJECT_NAME})
elseif(HH_BUILD_PLATFORM_WPHONE)
    set (LIBRARY_OUTPUT_PATH ${HH_ROOT_DIR}/build/lib/${COMMON_LIBS_FOLDER}/${CMAKE_PROJECT_NAME})  
else()
    set (LIBRARY_OUTPUT_PATH ${HH_ROOT_DIR}/build/lib/${CMAKE_SYSTEM_NAME}/${LIBRARY_OUTPUT_DIR})
endif()

# include libs
add_subdirectory(glm)
