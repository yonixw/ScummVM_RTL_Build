# Android Build

This docker container\files implements all the the steps described here: [Compiling ScummVM/Android-SDL](https://wiki.scummvm.org/index.php?title=Compiling_ScummVM/Android-SDL). This container was not build to run constantly like a build server. It comes with all the required packages installed and ready to be used. It comes with a sample python script that automatically clone a git repository and builds it (The default CMD). 

# Docker url
[yonixw/scummvm-android-sdl:v1](https://cloud.docker.com/u/yonixw/repository/docker/yonixw/scummvm-android-sdl)

# Environment variables in this docker:

* What is the public git URL? `GIT_REPO` like  `https://github.com/BLooperZ/scummvm`
* What hash\branch to checkout? `GIT_HASH` like `106234b`
  * Last tested with hash 106234b in https://github.com/BLooperZ/scummvm
  * Remote branch start with origin, so for anything other than master, like `feature/scumm-rtl` use `origin/feature/scumm-rtl`
* What to name the package of the apk ?  `APK_DOMAIN` like `org.scummvm.scummvm`
* What title to give the app to show in the app drawer ? `APK_TITLE` like `ScummVM`
* What architectures to support? `APK_ABI` default to `armeabi-v7a arm64-v8a x86 x86_64`
  * Compiling all 4 on a VM with 2 vCPU and 8GB RAM took ~30min.
  * For example, you must have `x86` if you want it to run on Bluestack emulator because that its architecture
* What  ScummVM configruation to add ? `CONFIG_ARGS` default to ` --disable-all-engines --enable-engine=scumm,scumm-7-8`

# Volumes:
* APK output `/etc/apk-output/`
* Custom keystore to sign the app `/root/.android/debug.keystore`

# How to run?
Assuming example `docker-compose.yml` file:
```
version: "3"

services:
  scmvm-apk-sdl:
    image: yonixw/scummvm-android-sdl:v1
    environment:
      GIT_REPO: https://github.com/BLooperZ/scummvm
      # Test it working with hash 106234b
      # Remote branch start with origin:  origin/feature/scumm-rtl
      GIT_HASH: 106234b
      APK_DOMAIN: org.scummvm.scummvm
      APK_TITLE: ScummVM
      APK_ABI: armeabi-v7a arm64-v8a x86 x86_64
      CONFIG_ARGS: --disable-all-engines --enable-engine=scumm,scumm-7-8
    volumes:
      - ./:/etc/apk-output/
```

just run `docker-compose up` and the entire process will start outputing an APK file to  the current folder `./`