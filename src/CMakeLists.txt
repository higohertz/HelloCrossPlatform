cmake_minimum_required(VERSION 3.0)

project(game)

include(${CMAKE_BINARY_DIR}/../cmake/packages/common.cmake)
include(glew)
include(glfw)
include(glm)

#########################################
# 
#########################################

find_package(OpenGL REQUIRED)

if(WIN32)
	set(COMMON_LIBS ${OPENGL_LIBRARIES} glew glfw3)
	message(STATUS "WIN32 add libs: " ${COMMON_LIBS} )
elseif (UNIX)
	if(APPLE)
		set(COMMON_LIBS ${OPENGL_LIBRARIES} glew glfw3 stdc++ "-framework Foundation" "-framework Cocoa" "-framework OpenGL" "-framework CoreVideo" "-framework IOKit")
		message(STATUS "APPLE add libs: " ${COMMON_LIBS} )
	else()
		set(COMMON_LIBS vermilion ${OPENGL_LIBRARIES} glew glfw3 GL rt dl)
		message(STATUS "UNIX add libs: " ${COMMON_LIBS} )
	endif()
else()
	set(COMMON_LIBS)
	message(STATUS "OTHER SYSTEM add libs: " ${COMMON_LIBS})
endif()

#########################################
# 
#########################################

link_directories(${LIBRARY_OUTPUT_PATH})

add_executable(game WIN32 ${KI_GAME_SOURCES_DIR}/game/main.cpp ${ASSET_FILES} ${COMMON_HEADERS})

target_link_libraries(game ${COMMON_LIBS})

if(MSVC)
    set_property(TARGET game APPEND PROPERTY LINK_FLAGS /SUBSYSTEM:CONSOLE)
endif()
