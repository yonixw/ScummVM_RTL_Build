export PATH=$PATH:/c/src/app/PortableGit/bin
cd /c/src/app/
git clone --single-branch --branch "feature/scumm-rtl" https://github.com/BLooperZ/scummvm
cd /c/src/app/scummvm/
./configure --disable-all-engines --enable-engine=scumm,scumm-7-8
make
strip scummvm.exe
mv scummvm.exe ../output