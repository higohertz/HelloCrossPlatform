cmake_minimum_required(VERSION 2.8)

project(glm)

set(KI_LIBGLM_SOURCES_DIR ${KI_LIB_SOURCES_DIR}/glm)
message("KI_LIBGLM_SOURCES_DIR = ${KI_LIBGLM_SOURCES_DIR}")
include_directories(${KI_LIBGLM_SOURCES_DIR})

subdirs(${KI_LIBGLM_SOURCES_DIR}) # cmake it directly
