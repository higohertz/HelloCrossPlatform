cmake_minimum_required(VERSION 2.8)

project(glew)

if(NOT WIN32)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-attributes")
endif()

include_directories(${KI_GLEW_DIR}/include)

set(API
	${KI_GLEW_DIR}/include/GL/glew.h
	${KI_GLEW_DIR}/include/GL/glxew.h
	${KI_GLEW_DIR}/include/GL/wglew.h)

source_group(API FILES ${API})

set(SOURCES ${KI_GLEW_DIR}/src/glew.c)

add_library(glew STATIC ${SOURCES} ${API})
