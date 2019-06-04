# ScummVM-RTL Build & Play
This git repo set to give helpful tools in order to compile the ScummVM engine for most platform, mainly the Hebrew (RTL) version maintained at https://github.com/BLooperZ/scummvm.

# Platforms

## Windows

Windows use [MinGW](http://www.mingw.org/) to build the source. More instruction in the Windows [README](/Windows/README.md). 

## Linux
Since you need to build C++ files and since each Linux distro have different packages, we only publish instruction to build from the git in the Linux [README](/Linux/README.md). 

**Note:** Currently linux is not supported by the [Bluestacks emulator](https://www.bluestacks.com/).

![](/images/linux_bs_sam.png)


## Android
Read about how to build the APK on linux in the android [README](/Android/README.md).

Since the android build uses the NDK to compile C++ to use in android, and since NDK has different output for each instruction set (armeabi-v7a, arm64-v8a, x86, x86_64) in the same APK, there are different bugs on different devices.

**Note:** [Bluestacks emulator](https://www.bluestacks.com/) architecture is x86 everywhere (Windows, Mac).

Hebrew game support for 4/6/19:

| | Sam&Max (Scummvm) | Full Throttle (Scummvm7/8) |
| :------------- |:-------------:| :-----:|
| x86 (*[Bluestacks emulator](https://www.bluestacks.com/)*) | OK | Adds gibbrish letters ![](/images/x86_ft_gibrish.png) |
| x86_64 |  Not tested | Not tested |
| armeabi-v7a |  Not tested | Not tested |
| arm64-v8a (*LG6*) | Crash every time on first dialog (ידידים?) ![](/images/lg6_sam_crash.png) | Crash rarely on some dialog ![](/images/lg6_ft_crash.png)|


## Mac
Currently this repo has no native way to compile on a Mac. **But**, you can use the [Bluestacks emulator](https://www.bluestacks.com/) together with the APK file from the android build.

![](/images/mac_bs_sam.png)

# Using Bluestack

## Config

In both Windows and Mac you need to enable better graphics in the settings to avoid render problems in the game.

## Copy files into the emulator