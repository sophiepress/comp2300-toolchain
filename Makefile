# Downloads and re-zips toolchains required for ARM Development in COMP2300

# Toolchain: XPack ARM none EABI GCC

# https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v10.3.1-2.3/xpack-arm-none-eabi-gcc-10.3.1-2.3-linux-x64.tar.gz

TCVER=10.3.1-2.3
TCBASE=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v
TCNAME=xpack-arm-none-eabi-gcc-

TCDARWIN=$(TCNAME)$(TCVER)-darwin-x64.tar.gz
TCLINUX=$(TCNAME)$(TCVER)-linux-x64.tar.gz
TCWIN32=$(TCNAME)$(TCVER)-win32-x64.zip

TCDARWIN_URL=$(TCBASE)$(TCVER)/$(TCDARWIN)
TCLINUX_URL=$(TCBASE)$(TCVER)/$(TCLINUX)
TCWIN32_URL=$(TCBASE)$(TCVER)/$(TCWIN32)

# OpenOCD

# https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.11.0-3/xpack-openocd-0.11.0-3-linux-x64.tar.gz

OCDVER=0.11.0-3
OCDBASE=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v
OCDNAME=xpack-openocd-

OCDDARWIN=$(OCDNAME)$(OCDVER)-darwin-x64.tar.gz
OCDLINUX=$(OCDNAME)$(OCDVER)-linux-x64.tar.gz
OCDWIN32=$(OCDNAME)$(OCDVER)-win32-x64.zip

# DiscoServer
# ARM Emulator

DSVER=1.1.3
DSBASE=https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v

DSDARWIN=discoserver-darwin.zip
DSLINUX=discoserver-linux.zip
DSWIN32=discoserver-win32.zip

.PHONY: all
all: darwin linux win32

.PHONY: darwin
darwin:
	mkdir -p darwin
	wget -nc  $(TCBASE)$(TCVER)/$(TCDARWIN)
	tar -xzf $(TCDARWIN) -C darwin/
	mv darwin/$(TCNAME)$(TCVER) darwin/arm-none-eabi
	wget -nc $(OCDBASE)$(OCDVER)/$(OCDDARWIN)
	tar -xzf $(OCDDARWIN) -C darwin/
	mv darwin/$(OCDNAME)$(OCDVER) darwin/openocd
	wget -nc $(DSBASE)$(DSVER)/$(DSDARWIN) 
	unzip -o $(DSDARWIN) -d darwin
	cd darwin; zip -r ../toolchain-darwin.zip *
	rm -fr darwin

.PHONY: linux
linux:
	mkdir -p linux
	wget -nc  $(TCBASE)$(TCVER)/$(TCLINUX)
	tar -xzf $(TCLINUX) -C linux/
	mv linux/$(TCNAME)$(TCVER) linux/arm-none-eabi
	wget -nc $(OCDBASE)$(OCDVER)/$(OCDLINUX)
	tar -xzf $(OCDLINUX) -C linux/
	mv linux/$(OCDNAME)$(OCDVER) linux/openocd
	wget -nc $(DSBASE)$(DSVER)/$(DSLINUX) 
	unzip -o $(DSLINUX) -d linux
	cd linux; zip -r ../toolchain-linux.zip *
	rm -fr linux

.PHONY: win32
win32:
	mkdir -p win32
	wget -nc  $(TCBASE)$(TCVER)/$(TCWIN32)
	unzip -o $(TCWIN32) -d win32/
	mv win32/$(TCNAME)$(TCVER) win32/arm-none-eabi
	wget -nc $(OCDBASE)$(OCDVER)/$(OCDWIN32)
	unzip -o $(OCDWIN32) -d win32/
	mv win32/$(OCDNAME)$(OCDVER) win32/openocd
	wget -nc $(DSBASE)$(DSVER)/$(DSWIN32) 
	unzip -o $(DSWIN32) -d win32
	cd win32; zip -r ../toolchain-win32.zip *
	rm -fr win32

.PHONY: unzip
unzip:
	mkdir -p darwin
	unzip toolchain-darwin.zip -d darwin
	mkdir -p linux
	unzip toolchain-linux.zip -d linux
	mkdir -p win32
	unzip toolchain-win32.zip -d win32

get-original:
	wget https://github.com/paked/stm32-vscode-simple/releases/download/v1.0/toolchain-linux.zip
	wget https://github.com/paked/stm32-vscode-simple/releases/download/v1.0/toolchain-darwin.zip
	wget https://github.com/paked/stm32-vscode-simple/releases/download/v1.0/toolchain-win32.zip
	mv toolchain-*.zip zips/

get-discoserver:
	wget -nc https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v1.1.3/discoserver-linux.zip
	wget -nc https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v1.1.3/discoserver-darwin.zip
	wget -nc https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v1.1.3/discoserver-win32.zip
	mv discoserver-*.zip discoservers/

.PHONY: clean
clean:
	rm -fr linux/*
	rm -fr win32/*
	rm -fr darwin/*

update:
	# linux
	unzip discoservers/discoserver-linux.zip discoserver
	zip zips/toolchain-linux.zip discoserver
	rm discoserver
	# darwin
	unzip discoservers/discoserver-darwin.zip discoserver
	zip zips/toolchain-darwin.zip discoserver
	rm discoserver
	# windows
	unzip discoservers/discoserver-win32.zip discoserver.exe
	zip zips/toolchain-win32.zip discoserver.exe
	rm discoserver.exe

