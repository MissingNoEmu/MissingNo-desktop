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

```
make          # normal build
make run      # build + run

make release  # clean + optimised build

make clean    # remove build/ and bin/
```

Use a `ROM` variable to pass in file path to the ROM file

## License

This project is licensed under the MIT license. See LICENSE file for more details.