## ARM Development Toolchain for COMP2300

This repo packages the ARM development toolchain used in COMP2300 at the Australian National University [(website here)](https://comp.anu.edu.au/courses/comp2300).

Within that course, students use VSCode to develop for the microbit and we package arm-eabi-none-gcc, openocd, and a neat ARM Cortex M4 emulator together for Windows, Linux, and MacOS. Students install the toolchain in their `~/.comp2300` folder.

This goes with the VSCode `comp2300-2021-extension` extension.

## How does it work

`make all` downloads the toolchain components from GitHub, structures the directory correctly and then zips into platform specific zip files.

Toolchain versions are specified in the Makefile.

The repo is mainly here to run a github action that generates the toolchain on each releases.

## Can I do it manually?

Yep, here's what the Makefile does:

Installing the toolchain manually involves downloading three packages:
`xpack-arm-none-eabi`, `xpack-openocd` and `discoserver`. You'll need to unzip
the packages and move their contents into specifically named folders in your
home directory. These packages are available in releases on GitHub.

The packages can be found here:

- [xpack arm-none-eabi (GitHub link)](https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases)
- [xpack openocd (GitHub link)](https://github.com/xpack-dev-tools/openocd-xpack/releases)
- [COMP2300 discoserver (GitHub link)](https://github.com/cpmpercussion/comp2300-discoserver/releases)

Download the correct package for your platform (OS) and architecture (usually
x64 unless you have an ARM Mac or you know better). 

1. Create a directory called `.comp2300` in your home folder (e.g., Linux: `/home/charles/.comp2300`, MacOS: `/Users/charles/.comp2300`, Windows: `C:\Users\charles\.comp2300`.
2. Extract the discoserver binary into your comp2300 folder.
3. Extract the contents of `xpack-arm-none-eabi-gcc...` into `.comp2300`. It should be a folder with the same name as the `.zip`/`.tar.gz` file.
4. Rename the `xpack-arm-none-eabi-gcc...` folder to `arm-none-eabi`.
5. Extract the contents of `xpack-openocd...` into `.comp2300`. 
6. Rename the `xpack-openocd...` folder to `xpack-openocd`.

Your `.comp2300` folder should now look something like this (note that
executable files look different in windows compared with Linux/MacOS):

```
~/.comp2300/
+-- discoserver(.exe) 
+-- arm-none-eabi/
|   +-- README.md
|   +-- arm-none-eabi
|   +-- bin
|   +-- distro-info
|   +-- include
|   +-- lib
|   +-- libexec
|   +-- share 
+-- openocd/
|   +-- OpenULINK(.exe)
|   +-- README.md
|   +-- bin
|   +-- contrib
|   +-- distro-info
|   +-- libexec
|   +-- scripts
|   +-- share 
```

