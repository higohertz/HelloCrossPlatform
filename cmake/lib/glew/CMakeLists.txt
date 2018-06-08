cmake_minimum_required(VERSION 2.8)

project(glew)

message("KI_LIBGLEW_DIR = ${KI_LIBGLEW_DIR}")

include_directories(${KI_LIBGLEW_DIR}/include)

set(HEADERS
	${KI_LIBGLEW_DIR}/include/GL/glew.h
	${KI_LIBGLEW_DIR}/include/GL/glxew.h
	${KI_LIBGLEW_DIR}/include/GL/wglew.h)

set(SOURCES ${KI_LIBGLEW_DIR}/src/glew.c)

source_group(HEADERS FILES ${HEADERS})

add_library(glew STATIC ${SOURCES} ${HEADERS})
