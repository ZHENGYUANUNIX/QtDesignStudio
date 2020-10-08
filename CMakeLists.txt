cmake_minimum_required(VERSION 3.9)

include(FeatureSummary)

project(QtCreatorTQtCSuper)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_PREFIX_PATH
  ${CMAKE_BINARY_DIR}/cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/license-managing
)

set(QTC_MERGE_BINARY_DIR YES)
find_package(GammaRay QUIET)


# level 0
add_subdirectory(qtcreator)

# level 1
add_subdirectory(licensechecker)

# level 2
if (TARGET gammaray_core)
  add_subdirectory(gammarayintegration)
endif()
add_subdirectory(qtapplicationmanagerintegration)
add_subdirectory(qtquickdesigner)
add_subdirectory(vxworks)

feature_summary(INCLUDE_QUIET_PACKAGES WHAT
  PACKAGES_FOUND PACKAGES_NOT_FOUND
  ENABLED_FEATURES DISABLED_FEATURES
)
