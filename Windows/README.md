# Windows mingw32 Build

This docker container\files implements all the the steps described here: [Compiling_ScummVM/MinGW](https://wiki.scummvm.org/index.php?title=Compiling_ScummVM/MinGW). This container was not build to run constantly like a build server. It comes with all the required packages installed and ready to be used. It comes with a sample bash script that automatically clone a git repository and builds it (The default CMD). 

# Docker repo
Pull from [yonixw/scummvm-win32-mingw:servercore-1809](https://hub.docker.com/r/yonixw/scummvm-win32-mingw)

# Environment variables in this docker:

None.

# Volumes:

* Exe output: `C:\src\app\output`

# How to run?

This docker only runs on windows systems. It was last tested on Windows server 2019 (tagged by microsoft **1809**) with a docker container support.

Assuming you want the output exe in `C:\Users\docker\output`, just run:

```
docker run --rm -v C:\Users\docker\output:C:\src\app\output yonixw/scummvm-win32-mingw:servercore-1809
```

To run the output exe, add to the same folder all the dlls from the *"output_dlls"* folder.