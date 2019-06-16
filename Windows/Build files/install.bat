mkdir c:\src\app
cd c:\src\app

powershell -Command "& {Install-Package -Scope CurrentUser -Force 7Zip4PowerShell}"
powershell -Command "& {wget https://netix.dl.sourceforge.net/project/mingw/Installer/mingw-get/mingw-get-0.6.2-beta-20131004-1/mingw-get-0.6.2-mingw32-beta-20131004-1-bin.tar.xz -OutFile mingw-get.tar.xz}"

powershell -Command "& {Expand-7Zip .\mingw-get.tar.xz .\}"
powershell -Command "& {Expand-7Zip .\mingw-get.tar .\mingw\}"

del mingw-get.tar
del mingw-get.tar.xz

cd c:\src\app\mingw
.\bin\mingw-get.exe install mingw32-base
.\bin\mingw-get.exe install msys-base
.\bin\mingw-get.exe install install msys-bash 
.\bin\mingw-get.exe install mingw-developer-toolkit-bin
.\bin\mingw-get.exe install mingw32-autoconf-bin
.\bin\mingw-get.exe install mingw32-autoconf2.1-bin
.\bin\mingw-get.exe install mingw32-autoconf2.5-bin
.\bin\mingw-get.exe install mingw32-automake-bin
.\bin\mingw-get.exe install mingw32-automake1.10-bin
.\bin\mingw-get.exe install mingw32-automake1.11-bin
.\bin\mingw-get.exe install mingw32-automake1.4-bin
.\bin\mingw-get.exe install mingw32-automake1.5-bin
.\bin\mingw-get.exe install mingw32-automake1.6-bin
.\bin\mingw-get.exe install mingw32-automake1.7-bin
.\bin\mingw-get.exe install mingw32-automake1.8-bin
.\bin\mingw-get.exe install mingw32-automake1.9-bin
.\bin\mingw-get.exe install mingw32-autotools-bin
.\bin\mingw-get.exe install mingw32-binutils-bin
.\bin\mingw-get.exe install mingw32-gcc-bin
.\bin\mingw-get.exe install mingw32-gcc-dev
.\bin\mingw-get.exe install mingw32-gcc-core-deps-dll
.\bin\mingw-get.exe install mingw32-gcc-g++-bin
.\bin\mingw-get.exe install mingw32-gcc-g++-dev
.\bin\mingw-get.exe install mingw32-gettext-bin
.\bin\mingw-get.exe install mingw32-gettext-dev
.\bin\mingw-get.exe install mingw32-gmp-dev
.\bin\mingw-get.exe install mingw32-libatomic-dll
.\bin\mingw-get.exe install mingw32-libexpat-dll
.\bin\mingw-get.exe install mingw32-libgcc-dll
.\bin\mingw-get.exe install mingw32-libgettextpo-dll
.\bin\mingw-get.exe install mingw32-libgmp-dll
.\bin\mingw-get.exe install mingw32-libgmpxx-dll
.\bin\mingw-get.exe install mingw32-libgomp-dll
.\bin\mingw-get.exe install mingw32-libgomp-deps-dll
.\bin\mingw-get.exe install mingw32-libiconv-bin
.\bin\mingw-get.exe install mingw32-libiconv-dev
.\bin\mingw-get.exe install mingw32-libiconv-dll
.\bin\mingw-get.exe install mingw32-libintl-dll
.\bin\mingw-get.exe install mingw32-libisl-dll
.\bin\mingw-get.exe install mingw32-libltdl-dev
.\bin\mingw-get.exe install mingw32-libltdl-dll
.\bin\mingw-get.exe install mingw32-libmingwex-dev
.\bin\mingw-get.exe install mingw32-libmingwex-dll
.\bin\mingw-get.exe install mingw32-libmpc-dll
.\bin\mingw-get.exe install mingw32-libmpfr-dll
.\bin\mingw-get.exe install mingw32-libpthreadgc-dev
.\bin\mingw-get.exe install mingw32-libpthreadgc-dll
.\bin\mingw-get.exe install mingw32-libquadmath-dll
.\bin\mingw-get.exe install mingw32-libssp-dll
.\bin\mingw-get.exe install mingw32-libstdc++-dll
.\bin\mingw-get.exe install mingw32-libtool-bin
.\bin\mingw-get.exe install mingw32-mingw-get-bin
.\bin\mingw-get.exe install mingw32-mingw-get-gui
.\bin\mingw-get.exe install mingw32-mingw-get-lic
.\bin\mingw-get.exe install mingw32-mingwrt-dev
.\bin\mingw-get.exe install mingw32-mingwrt-dll
.\bin\mingw-get.exe install mingw32-w32api-dev
.\bin\mingw-get.exe install mingw32-zlib-lic
.\bin\mingw-get.exe install msys-autogen-bin
.\bin\mingw-get.exe install msys-base-bin
.\bin\mingw-get.exe install msys-bash-bin
.\bin\mingw-get.exe install msys-bison-bin
.\bin\mingw-get.exe install msys-bsdcpio-bin
.\bin\mingw-get.exe install msys-bsdtar-bin
.\bin\mingw-get.exe install msys-bzip2-bin
.\bin\mingw-get.exe install msys-core-bin
.\bin\mingw-get.exe install msys-core-doc
.\bin\mingw-get.exe install msys-core-ext
.\bin\mingw-get.exe install msys-core-lic
.\bin\mingw-get.exe install msys-coreutils-bin
.\bin\mingw-get.exe install msys-coreutils-ext
.\bin\mingw-get.exe install msys-cvs-bin
.\bin\mingw-get.exe install msys-diffstat-bin
.\bin\mingw-get.exe install msys-diffutils-bin
.\bin\mingw-get.exe install msys-dos2unix-bin
.\bin\mingw-get.exe install msys-file-bin
.\bin\mingw-get.exe install msys-findutils-bin
.\bin\mingw-get.exe install msys-flex-bin
.\bin\mingw-get.exe install msys-gawk-bin
.\bin\mingw-get.exe install msys-grep-bin
.\bin\mingw-get.exe install msys-guile-bin
.\bin\mingw-get.exe install msys-gzip-bin
.\bin\mingw-get.exe install msys-inetutils-bin
.\bin\mingw-get.exe install msys-less-bin
.\bin\mingw-get.exe install msys-libarchive-dll
.\bin\mingw-get.exe install msys-libbz2-dll
.\bin\mingw-get.exe install msys-libcrypt-dll
.\bin\mingw-get.exe install msys-libexpat-dll
.\bin\mingw-get.exe install msys-libgdbm-dll
.\bin\mingw-get.exe install msys-libgmp-dll
.\bin\mingw-get.exe install msys-libguile-dll
.\bin\mingw-get.exe install msys-libguile-rtm
.\bin\mingw-get.exe install msys-libiconv-dll
.\bin\mingw-get.exe install msys-libintl-dll
.\bin\mingw-get.exe install msys-libltdl-dll
.\bin\mingw-get.exe install msys-liblzma-dll
.\bin\mingw-get.exe install msys-libmagic-dll
.\bin\mingw-get.exe install msys-libminires-dll
.\bin\mingw-get.exe install msys-libopenssl-dll
.\bin\mingw-get.exe install msys-libopts-dll
.\bin\mingw-get.exe install msys-libpopt-dll
.\bin\mingw-get.exe install msys-libregex-dll
.\bin\mingw-get.exe install msys-libtermcap-dll
.\bin\mingw-get.exe install msys-libxml2-dll
.\bin\mingw-get.exe install msys-lndir-bin
.\bin\mingw-get.exe install msys-m4-bin
.\bin\mingw-get.exe install msys-make-bin
.\bin\mingw-get.exe install msys-mktemp-bin
.\bin\mingw-get.exe install msys-openssh-bin
.\bin\mingw-get.exe install msys-openssl-bin
.\bin\mingw-get.exe install msys-patch-bin
.\bin\mingw-get.exe install msys-perl-bin
.\bin\mingw-get.exe install msys-rsync-bin
.\bin\mingw-get.exe install msys-sed-bin
.\bin\mingw-get.exe install msys-tar-bin
.\bin\mingw-get.exe install msys-termcap-bin
.\bin\mingw-get.exe install msys-texinfo-bin
.\bin\mingw-get.exe install msys-vim-bin
.\bin\mingw-get.exe install msys-xz-bin
.\bin\mingw-get.exe install msys-zlib-dll

cd c:\src\app
powershell -Command "& {wget https://github.com/git-for-windows/git/releases/download/v2.22.0.windows.1/PortableGit-2.22.0-64-bit.7z.exe -OutFile git.7z.exe}"
powershell -Command "& {Start-Process -Wait -Args '-y -gm2 -InstallPath="C:\\src\\app"' -FilePath './git.7z.exe'}"
del git.7z.exe

powershell -Command "& {wget http://www.scummvm.org/frs/build/scummvm-required-libs-mingw.zip -OutFile libs.zip}"
powershell -Command "& {wget http://www.libsdl.org/release/SDL-1.2.15-win32.zip -OutFile sdl.zip}"
powershell -Command "& {Expand-7Zip .\libs.zip c:\src\app\mingw}"
powershell -Command "& {Expand-7Zip .\sdl.zip c:\src\app\mingw\bin}"

mkdir c:\src\app\output
