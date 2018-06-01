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
set(LIBRARY_OUTPUT_PATH    ${HH_ROOT_DIR}/build/${PROJECT_NAME}/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})
set(EXECUTABLE_OUTPUT_PATH ${HH_ROOT_DIR}/build/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})

# include libs
set(GLM_TEST_ENABLE           OFF CACHE BOOL "do glm tests" FORCE)
set(GLM_STATIC_LIBRARY_ENABLE ON  CACHE BOOL "do glm optional lib" FORCE)
add_subdirectory(glm)
