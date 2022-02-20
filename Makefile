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
	zip toolchain-linux.zip discoserver
	rm discoserver
	# darwin
	unzip discoservers/discoserver-darwin.zip discoserver
	zip toolchain-darwin.zip discoserver
	rm discoserver
	# windows
	unzip discoservers/discoserver-win32.zip discoserver.exe
	zip toolchain-win32.zip discoserver.exe
	rm discoserver.exe

