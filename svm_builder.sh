
#!/bin/bash

# *************************************************
# Script to build ScummVM on the OSMC Vero 4K
# HissingShark 2017 -
# *************************************************

# stop Kodi to free up resources
sudo systemctl stop mediacenter

# install typical building suite
sudo apt-get update
sudo apt-get install -y vero3-userland-dev-osmc build-essential git

# if sdl2 missing we need to build it first
echo -n "Checking for SDL2... "
if [ "$(sdl2-config 2> >(grep 'command not found'))" = "" ];
then
  echo OK
else
  echo -n BUILDING... 
	cd
	git clone https://github.com/hissingshark/sdl2-vero4k.git
	cd sdl2-vero4k
	./sdl2_build.sh
fi

# install depends
sudo apt-get install -y g++ make libsdl2-dev libjpeg62-turbo-dev libmpeg2-4-dev libogg-dev libvorbis-dev libflac-dev libmad0-dev libpng-dev libtheora-dev libfaad-dev libfluidsynth-dev libfreetype6-dev zlib1g-dev

# get source
cd
git clone https://github.com/scummvm/scummvm.git
cd scummvm

# prep and build
export CFLAGS="-I/opt/vero3/include -L/opt/vero3/lib -O3 -march=armv8-a+crc -mtune=cortex-a53 -funsafe-math-optimizations"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS
./configure --opengl-mode=gles2
make -j4
cd 
