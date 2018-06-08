cmake_minimum_required(VERSION 3.0)

project(libs)

# set common pathes
# CMAKE_BINARY_DIR = usually /build/..
set(HH_TEMP ${CMAKE_BINARY_DIR}/temp)

# set output pathes
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set(LIBRARY_OUTPUT_PATH            ${CMAKE_BINARY_DIR}/libs/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH         ${CMAKE_BINARY_DIR}/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})

# set user options
option (HH_BUILD_PLATFORM_IOS     "Build for iOS"     OFF)
option (HH_BUILD_PLATFORM_ANDROID "Build for Android" OFF)
option (HH_BUILD_PLATFORM_WPHONE  "Build for wPhone"  OFF)
option (HH_BUILD_PLATFORM_WINDOWS "Build for Windows" OFF)
option (HH_BUILD_PLATFORM_MACOS   "Build for MacOS"   OFF)

# set output directory
message("CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
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

# include libs
#set(GLM_TEST_ENABLE           OFF CACHE BOOL "do glm tests" FORCE)
#set(GLM_STATIC_LIBRARY_ENABLE ON  CACHE BOOL "do glm optional lib" FORCE)
#add_subdirectory(glm)

if(NOT TARGET glew)
    add_subdirectory(glew/build/cmake ${HH_TEMP}/glew)
endif()
