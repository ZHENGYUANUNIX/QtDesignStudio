cmake_minimum_required(VERSION 3.9)

project(QtCreatorTQtCSuper)

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/cmake)

add_subdirectory(qtcreator)
add_subdirectory(vxworks)
