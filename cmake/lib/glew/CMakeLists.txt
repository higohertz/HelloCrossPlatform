cmake_minimum_required(VERSION 2.8)

project(glew)

set(KI_LIBGLEW_SOURCES_DIR ${KI_LIB_SOURCES_DIR}/glew)

message("KI_LIBGLEW_SOURCES_DIR = ${KI_LIBGLEW_SOURCES_DIR}")

include_directories(${KI_LIBGLEW_SOURCES_DIR}/include)

set(HEADERS
	${KI_LIBGLEW_SOURCES_DIR}/include/GL/glew.h
	${KI_LIBGLEW_SOURCES_DIR}/include/GL/glxew.h
	${KI_LIBGLEW_SOURCES_DIR}/include/GL/wglew.h)

set(SOURCES ${KI_LIBGLEW_SOURCES_DIR}/src/glew.c)

#source_group(HEADERS FILES ${HEADERS})

add_library(glew STATIC ${SOURCES} ${HEADERS})
