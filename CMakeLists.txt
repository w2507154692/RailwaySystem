cmake_minimum_required(VERSION 3.16)

project(RailwaySystem VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appRailwaySystem main.cpp)

# 自动收集所有 QML 文件
file(GLOB_RECURSE QML_FILES qml/*.qml)

qt_add_resources(appRailwaySystem "images"
    PREFIX "/images"
    FILES resources/images/logbackground.png
)

set(REL_QML_FILES "")
foreach(QML_FILE ${QML_FILES})
    file(RELATIVE_PATH REL_QML_FILE "${CMAKE_SOURCE_DIR}" "${QML_FILE}")
    string(REPLACE "\\" "/" REL_QML_FILE "${REL_QML_FILE}")
    list(APPEND REL_QML_FILES "${REL_QML_FILE}")
endforeach()

qt_add_qml_module(appRailwaySystem
    URI RailwaySystem
    VERSION 1.0
    QML_FILES ${REL_QML_FILES}
    RESOURCES images.qrc
)

set_target_properties(appRailwaySystem PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRailwaySystem
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appRailwaySystem
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
