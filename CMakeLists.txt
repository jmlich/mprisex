cmake_minimum_required(VERSION 3.28)

project(mprisex VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_VERBOSE_MAKEFILE ON)

# Qt version — override with -DQT_VERSION_MAJOR=5 or -DQT_VERSION_MAJOR=6
set(QT_VERSION_MAJOR 6 CACHE STRING "Qt major version to use (5 or 6)")
set_property(CACHE QT_VERSION_MAJOR PROPERTY STRINGS 5 6)

find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Qml)

qt_add_resources(RESOURCES mprisex.qrc)

# Define your custom macro or variable
set(WATCHFISH_FEATURES "music")
add_subdirectory(libwatchfish)


add_executable(appmprisex
    main.cpp
    ${RESOURCES}
)

# Link Qt5 libraries
target_link_libraries(appmprisex
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::Qml
    libwatchfish
)

