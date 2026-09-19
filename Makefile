BUILD_DIR := build
ROM       ?=
GENERATOR ?= Ninja

ifeq ($(OS),Windows_NT)
    EXEEXT := .exe
else
    EXEEXT :=
endif

ifeq ($(GENERATOR),Make)
    CMAKE_GEN := "Unix Makefiles"
    ifeq ($(OS),Windows_NT)
        CMAKE_GEN := "MinGW Makefiles"
    endif
else
    CMAKE_GEN := Ninja
endif

CMAKE_FLAGS := \
    -G $(CMAKE_GEN) \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

.PHONY: all run release clean

all:
	cmake -S . -B $(BUILD_DIR) $(CMAKE_FLAGS) \
		-DCMAKE_BUILD_TYPE=Debug
	cmake --build $(BUILD_DIR)

run: all
	$(BUILD_DIR)/MissingNo-desktop$(EXEEXT) "$(ROM)"

release:
	cmake -S . -B $(BUILD_DIR) $(CMAKE_FLAGS) \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build $(BUILD_DIR)

clean:
	cmake --build $(BUILD_DIR) --target clean