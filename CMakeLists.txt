cmake_minimum_required(VERSION 3.9)

project(QtCreatorTQtCSuper)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 14)

list(APPEND CMAKE_PREFIX_PATH
  ${CMAKE_BINARY_DIR}/cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/license-managing
)

set(QTC_MERGE_BINARY_DIR YES)

add_subdirectory(qtcreator)
add_subdirectory(licensechecker)
add_subdirectory(vxworks)
