cmake_minimum_required(VERSION 3.1)

project(mprisex VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_VERBOSE_MAKEFILE ON)


find_package(Qt5 REQUIRED COMPONENTS Quick Qml)

qt5_add_resources(RESOURCES mprisex.qrc)

add_executable(appmprisex
    main.cpp
    ${RESOURCES}
)

# Link Qt5 libraries
target_link_libraries(appmprisex
    Qt5::Quick
    Qt5::Qml
    libwatchfish
)

# Install QML files (if needed)
install(FILES Main.qml DESTINATION ${CMAKE_INSTALL_BINDIR})

# Define your custom macro or variable
set(WATCHFISH_FEATURES "music")

add_subdirectory(libwatchfish)