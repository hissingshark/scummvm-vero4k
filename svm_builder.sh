***BUILDING

apti g++ make libsdl2-dev libjpeg62-turbo-dev libmpeg2-4-dev libogg-dev libvorbis-dev libflac-dev libmad0-dev libpng-dev libtheora-dev libfaad-dev libfluidsynth-dev libfreetype6-dev zlib1g-dev

git clone https://github.com/scummvm/scummvm.git


export CFLAGS="-I/opt/vero3/include -L/opt/vero3/lib -O3 -march=armv8-a+crc -mtune=cortex-a53 -funsafe-math-optimizations"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS

./configure --enable-engine=sky --opengl-mode=gles2

Had to install at runtime ?try building in next time with dev verions installed,
or if they were do they need configing

libmpeg2-4 libfaad2 libflac8 libtheora0 libvorbisfile3 


***Running

./scummvm -f --gfx-mode=hq3x --joystick --path=/mnt/nas/emulation/roms/ScummVM/ --recursive --add

then 

./scummvm -f --gfx-mode=hq3x --joystick --path=/mnt/nas/emulation/roms/ScummVM/ 
