cmake_minimum_required(VERSION 2.8)

project(glfw)

include(glfw)

subdirs(${KI_LIBGLFW_SOURCES_DIR}) # cmake it directly
