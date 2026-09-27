cmake_minimum_required(VERSION 3.16)

project(MissingNo-desktop
    VERSION 0.1.0
    LANGUAGES C
)

include(FetchContent)

FetchContent_Declare(
    SDL3
    GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
    GIT_TAG release-3.2.0
    GIT_SHALLOW TRUE
)

FetchContent_MakeAvailable(SDL3)

add_subdirectory(lib/MissingNo-core)

add_executable(MissingNo-desktop
    src/main.c
)

target_link_libraries(MissingNo-desktop
    PRIVATE
        MissingNo::MissingNo
        SDL3::SDL3
)

add_custom_command(TARGET MissingNo-desktop POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:SDL3::SDL3>
        $<TARGET_FILE_DIR:MissingNo-desktop>
)