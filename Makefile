BUILD_DIR := build
ROM       ?=

ifeq ($(OS),Windows_NT)
	EXEEXT := .exe
else
	EXEEXT :=
endif

CMAKE_FLAGS := \
	-G Ninja \
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