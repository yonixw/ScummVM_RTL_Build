# Linux build
Just follow all the instruction in [Compiling_ScummVM/GCC](https://wiki.scummvm.org/index.php?title=Compiling_ScummVM/GCC)

# Why not using docker?
In order to run the build, you need to install some of the libs anyway (the libraries are dynamic and not static) and therefore there is no point in a docker architecture here.

# How I did it on Ubuntu 19.04
```bash
# Install all the required packages:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install g++ make libsdl2-dev liba52-dev libjpeg62-dev libmpeg2-4-dev libogg-dev libvorbis-dev libflac-dev libmad0-dev libpng-dev libtheora-dev libfaad-dev libfluidsynth-dev libfreetype6-dev zlib1g-dev 
sudo apt-get install libunity-dev

# Clone the repo and build:
git clone --single-branch --branch "feature/scumm-rtl" https://github.com/BLooperZ/scummvm
cd scummvm
./configure --disable-all-engines --enable-engine=scumm,scumm-7-8
make

# Run the output
./scummvm
```