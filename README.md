# ScummVM-RTL Build & Play
This git repo supposed to give helpful tools in order to compile the ScummVM engine for most platform, mainly the Hebrew (RTL) version maintained at https://github.com/BLooperZ/scummvm.

# Platforms

## Windows

Windows uses [MinGW](http://www.mingw.org/) to compile the source. More instruction in the Windows [README](/Windows/). 

![Windows example](/images/win_ft_build.png)

## Linux
Since you need to build C++ files and since each Linux distro have different packages, we only publish instruction to build from the git in the Linux [README](/Linux/). 

**Note:** Unfortunately, currently linux is not supported by the Bluestacks emulator.

![Linux example](/images/linux_bs_sam.png)


## Android
Read about how to build the APK on linux in the android [README](/Android/).

Since the android build uses the NDK to compile the C++ for android, and since NDK has different output for each instruction set (armeabi-v7a, arm64-v8a, x86, x86_64) in the same APK, there are different results on different devices.

**Note:** The Bluestacks emulator architecture is x86 everywhere (Windows, Mac).

## Android RTL bugs report for 4/6/19:

| | Sam&Max (Scummvm v0-v6) | Full Throttle (Scummvm v7/v8) |
| :------------- |:-------------:| :-----:|
| x86 (*Bluestacks emulator*) | No bugs | Adds gibbrish letters ![](/images/x86_ft_gibrish.png) |
| x86_64 |  Not tested | Not tested |
| armeabi-v7a |  Not tested | Not tested |
| arm64-v8a (*like LG6*) | Crash every time on first dialog (ידידים?) ![](/images/lg6_sam_crash.png) | Crash rarely on some dialog ![](/images/lg6_ft_crash.png)|


## Mac
Currently this repo has no native way to compile on a Mac. **But**, you can use the Bluestacks emulator together with the APK file from the android build.

![Mac Bluestacks example](/images/mac_bs_sam.png)

# Bluestacks

If you plan to use the Bluestacks emulator (Download [Here](https://www.bluestacks.com/) ) be sure to read how to configure the emulator and copy files in the [Bluestacks README](BLUESTACK.md)