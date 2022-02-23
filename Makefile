TOOLCHAIN_DARWIN=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v10.3.1-2.3/xpack-arm-none-eabi-gcc-10.3.1-2.3-darwin-x64.tar.gz
TOOLCHAIN_LINUX=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v10.3.1-2.3/xpack-arm-none-eabi-gcc-10.3.1-2.3-linux-x64.tar.gz
TOOLCHAIN_WIN32=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v10.3.1-2.3/xpack-arm-none-eabi-gcc-10.3.1-2.3-win32-x64.zip

# TOOLCHAIN_VER=10.3.1-2.3
# TOOLCHAIN_BASE=https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v

OPENOCD_DARWIN=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.11.0-3/xpack-openocd-0.11.0-3-darwin-x64.tar.gz
OPENOCD_LINUX=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.11.0-3/xpack-openocd-0.11.0-3-linux-x64.tar.gz
OPENOCD_WIN32=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.11.0-3/xpack-openocd-0.11.0-3-win32-x64.zip




build-toolchain-darwin:
	wget $TOOLCHAIN_DARWIN
	tar -xzf xpack-arm-none-eabi-gcc-10.3.1-2.3-darwin-x64.tar.gz -C darwin/
	unzip discoservers/discoserver-darwin.zip discoserver
	mv discoserver darwin/


get-original:
	wget https://github.com/paked/stm32-vscode-simple/releases/download/v1.0/toolchain-linux.zip
	wget https://github.com/paked/stm32-vscode-simple/releases/download/v1.0/toolchain-darwin.zip
	wget https://github.com/paked/stm32-vscode-simple/releases/download/v1.0/toolchain-win32.zip
	mv toolchain-*.zip zips/

get-discoserver:
	wget https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v1.1.3/discoserver-linux.zip
	wget https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v1.1.3/discoserver-darwin.zip
	wget https://github.com/cpmpercussion/comp2300-discoserver/releases/download/v1.1.3/discoserver-win32.zip
	mv discoserver-*.zip discoservers/

unzip-toolchains:
	unzip zips/toolchain-linux.zip -d linux
	unzip zips/toolchain-win32.zip -d win32
	unzip zips/toolchain-darwin.zip -d darwin

# zip-toolchains:

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

