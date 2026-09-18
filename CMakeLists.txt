cmake_minimum_required(VERSION 3.16)

project(MissingNo-desktop
    VERSION 0.1.0
    LANGUAGES C
)

add_subdirectory(lib/MissingNo-core)

add_executable(MissingNo-desktop
    src/main.c
)

target_link_libraries(MissingNo-desktop
    PRIVATE
        MissingNo::MissingNo
)