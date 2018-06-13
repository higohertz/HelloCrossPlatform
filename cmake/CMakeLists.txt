cmake_minimum_required(VERSION 3.0)

project(game)

set(KI_LIB_CMAKE_DIR   ${CMAKE_BINARY_DIR}/../cmake/lib)
set(KI_LIB_SOURCES_DIR ${CMAKE_BINARY_DIR}/../lib)
set(KI_GAME_SOURCES_DIR ${CMAKE_BINARY_DIR}/../src)

subdirs(${KI_LIB_CMAKE_DIR}) # cmake lib directly

#########################################
# 
#########################################

find_package(OpenGL REQUIRED)

if(WIN32)
	set(COMMON_LIBS ${OPENGL_LIBRARIES} glew glfw)
	message(STATUS "WIN32 add libs: " ${COMMON_LIBS} )
elseif (UNIX)
	if(APPLE)
		set(COMMON_LIBS ${OPENGL_LIBRARIES} glew glfw glm stdc++ "-framework Foundation" "-framework Cocoa" "-framework OpenGL" "-framework CoreVideo" "-framework IOKit")
		message(STATUS "APPLE add libs: " ${COMMON_LIBS} )
	else()
		set(COMMON_LIBS vermilion ${OPENGL_LIBRARIES} glew glfw GL rt dl)
		message(STATUS "UNIX add libs: " ${COMMON_LIBS} )
	endif()
else()
	set(COMMON_LIBS)
	message(STATUS "OTHER SYSTEM add libs: " ${COMMON_LIBS})
endif()

if(MSVC)
    set_property(TARGET game APPEND PROPERTY LINK_FLAGS /SUBSYSTEM:CONSOLE)
endif()

#########################################
# 
#########################################

link_directories(${LIBRARY_OUTPUT_PATH})

add_executable(game WIN32 ${KI_GAME_SOURCES_DIR}/game/main.cpp ${ASSET_FILES} ${COMMON_HEADERS})

target_link_libraries(game ${COMMON_LIBS})
