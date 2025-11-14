# qt/CMakeLists.txt (modified)
cmake_minimum_required(VERSION 3.16)
project(NoteQuarry VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt packages
find_package(Qt6 REQUIRED COMPONENTS Quick)

# Build Rust library
add_custom_target(rust_lib ALL
    COMMAND ${CMAKE_COMMAND} -E env CARGO_TARGET_DIR=${CMAKE_BINARY_DIR}/rust cargo build --release
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/../rust
    COMMENT "Building Rust backend for NoteQuarry"
)

# Rust library path
set(RUST_LIB_DIR ${CMAKE_BINARY_DIR}/rust/release)
if(APPLE)
    set(RUST_LIB ${RUST_LIB_DIR}/libnotequarry_core.dylib)
elseif(UNIX)
    set(RUST_LIB ${RUST_LIB_DIR}/libnotequarry_core.so)
elseif(WIN32)
    set(RUST_LIB ${RUST_LIB_DIR}/notequarry_core.dll)
endif()

# Qt application
qt6_add_executable(NoteQuarry
    main.cpp
    bridge/bridge.cpp
    bridge/bridge.h
)

# Link dependencies
target_link_libraries(NoteQuarry PRIVATE 
    Qt6::Quick
    ${RUST_LIB}
)

# Copy Rust library to build directory
add_custom_command(TARGET NoteQuarry POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${RUST_LIB}
        $<TARGET_FILE_DIR:NoteQuarry>
    COMMENT "Copying Rust library to build directory"
)

# QML module setup (keep your existing QML files)
qt6_add_qml_module(NoteQuarry
    URI NoteQuarry
    VERSION 1.0
    QML_FILES
        "QT/Constants.qml"
        "QT/EventListModel.qml"
        "QT/EventListSimulator.qml"
        "QT Content/App.qml"
        "QT Content/Screen01.ui.qml"
)

# Resource files if any
qt_add_resources(NoteQuarry "resources"
    PREFIX "/"
    FILES
        # Add any .qrc files if you have them
)