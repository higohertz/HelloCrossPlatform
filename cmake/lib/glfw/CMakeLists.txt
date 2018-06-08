cmake_minimum_required(VERSION 2.8)

project(glfw)

set(KI_LIBGLFW_SOURCES_DIR ${KI_LIB_SOURCES_DIR}/glfw)

message("KI_LIBGLFW_SOURCES_DIR = ${KI_LIBGLFW_SOURCES_DIR}")

include_directories(${KI_LIBGLFW_SOURCES_DIR}/include)

subdirs(${KI_LIBGLFW_SOURCES_DIR}) # cmake it directly
