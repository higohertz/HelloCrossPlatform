cmake_minimum_required(VERSION 3.0)

project(libs)

include(${CMAKE_BINARY_DIR}/../cmake/packages/common.cmake)

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
