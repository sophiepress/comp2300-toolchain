## Toolchain Zipper for COMP2300

`make all` downloads the toolchain components from GitHub, structures the directory correctly and then zips into platform specific zip files.

Toolchain versions are specified in the Makefile.

The directory structure (when unzipped into `~/.comp2300` should be:

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

