# MissingNo-desktop

Desktop implementation of MissingNo-core

## Usage

### Getting the source

Clone with

```
git clone --recurse-submodules https://github.com/MissingNoEmu/MissingNo-desktop.git
```

or populate `lib/MissingNo-core` with

```
git submodule update --init --recursive
```

Update to latest commit in MissingNo-core with

```
git submodule update --remote
git add lib/MissingNo-core
git commit -m "Update MissingNo-core"
```
### Running

#### Prerequisites
- CMake (required)
- Ninja (default generator) or GNU Make

> The Makefile lists Ninja as the default build system, which you need to have installed on your system. If you wish to use GNU Make instead, use `GENERATOR=Make` as an argument, or edit line 3 of Makefile to `GENERATOR ?= Make`.

> Note that if you're switching build systems, you must delete the current `build/` directory.

#### Using wrapper Makefile

```
make          # normal build
make run ROM="path"  # Build and run with a ROM file

make release  # clean + optimised build

make clean    # remove build/ and bin/
```

#### Using CMake directly (with Ninja)

```
# Configure (Debug by default)
cmake -S . -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug

# Build
cmake --build build

# Run
./build/MissingNo-desktop "path/to/rom.gb"   # On Windows: .\build\MissingNo-desktop.exe "path\to\rom.gb"

# Release build (optional)
cmake -S . -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release
cmake --build build
```

## License

This project is licensed under the MIT license. See LICENSE file for more details.