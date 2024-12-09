# Downloads and re-zips toolchains required for ARM Development in COMP2300

# Toolchain: XPack ARM none EABI GCC

# https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v13.3.1-1.1/xpack-arm-none-eabi-gcc-13.3.1-1.1-linux-x64.tar.gz

TCVER=13.3.1-1.1
TCBASE=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v
TCNAME=xpack-arm-none-eabi-gcc-

TCDARWIN=$(TCNAME)$(TCVER)-darwin-x64.tar.gz
TCLINUX=$(TCNAME)$(TCVER)-linux-x64.tar.gz
TCWIN32=$(TCNAME)$(TCVER)-win32-x64.zip

TCDARWIN_URL=$(TCBASE)$(TCVER)/$(TCDARWIN)
TCLINUX_URL=$(TCBASE)$(TCVER)/$(TCLINUX)
TCWIN32_URL=$(TCBASE)$(TCVER)/$(TCWIN32)

# OpenOCD

# https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.12.0-4/xpack-openocd-0.12.0-4-linux-x64.tar.gz

OCDVER=0.12.0-4
OCDBASE=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v
OCDNAME=xpack-openocd-

OCDDARWIN=$(OCDNAME)$(OCDVER)-darwin-x64.tar.gz
OCDLINUX=$(OCDNAME)$(OCDVER)-linux-x64.tar.gz
OCDWIN32=$(OCDNAME)$(OCDVER)-win32-x64.zip

# DiscoServer
# ARM Emulator

DSVER=1.3.0
DSBASE=https://github.com/sophiepress/comp2300-discoserver/releases/download/v

DSDARWIN=discoserver-darwin.zip
DSLINUX=discoserver-linux.zip
DSWIN32=discoserver-win32.zip

.PHONY: all
all: toolchain-darwin.zip toolchain-linux.zip toolchain-win32.zip

toolchain-darwin.zip:
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

toolchain-linux.zip:
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

toolchain-win32.zip:
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

.PHONY: clean
clean:
	rm *.zip
	rm *.tar.gz

