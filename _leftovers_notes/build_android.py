from tempfile import mkstemp
from shutil import move
from os import fdopen, remove

import time, os, sys

### VARIABLES ###
env_gitrepo = os.getenv("GIT_REPO", "https://github.com/BLooperZ/scummvm")
env_gitcheckout = os.getenv("GIT_HASH", "origin/feature/scumm-rtl");

env_apkdomain = os.getenv("APK_DOMAIN", "org.scummvm.scummvm");
env_apktitle = os.getenv("APK_TITLE", "ScummVM")
env_abi = os.getenv("APK_ABI","armeabi-v7a arm64-v8a x86 x86_64");

env_configure = os.getenv("CONFIG_ARGS", "--disable-all-engines --enable-engine=scumm,scumm-7-8");

print("Environment used:\n");
print([env_gitrepo, env_gitcheckout, env_apkdomain, env_apktitle, env_abi, env_configure]);

### HELPERS ###

def updatefiles(file_path, callback = None):
    #Create temp file
    fh, abs_path = mkstemp()
    with fdopen(fh,'w') as new_file:
        with open(file_path) as old_file:
            for line in old_file:
                if callback:
                    new_file.write(callback(line))
    #Remove original file
    remove(file_path)
    #Move new file
    move(abs_path, file_path)

lastErrorCode = 0;
def run(command):
    global lastErrorCode
    import subprocess
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE)
    for linebytes in iter(process.stdout.readline, b''):  # replace '' with b'' for Python 3
        sys.stdout.buffer.write(linebytes)
    process.wait()
    lastErrorCode = process.returncode;
    return lastErrorCode == 0;

def replaceAppSetting(line):
    global env_abi, env_apkdomain, env_apktitle;
    if line.find("MultiABI") > -1:
        return line[0:line.find("=")] + '="' + env_abi + '"'
    elif line.find("AppName") >-1:
        return line[0:line.find("=")] + '="' + env_apktitle + '"'
    elif line.find("AppFullName") >-1:
        return line[0:line.find("=")] + '="' + env_apkdomain + '"'
    else:
        return line;

def replaceConfig(line):
    global env_configure;
    if line.find("./configure") > -1:
        return line.replace("/configure","/configure " + env_configure + " ")
    else:
        return line;

### BUILD SCRIPT ###

print("(*) Sanity check #1: expecting 4 modules installed:\n")
if not run("/root/Android/android-sdk/tools/bin/sdkmanager --list"):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')

print("(*) Sanity check #2: ndk-build path is not empty\n")
if not run("which ndk-build"):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')

print("(*) Sanity check #3: ndk env is set\n")
if os.getenv("ANDROID_NDK_HOME","") == "":
    raise Exception('Command failed')

print("(*) Sanity check #4: zip is installed (for assets)\n")
if not run("which zip"):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')

print("(*) Cloning '" + env_gitrepo + "'\n")
t1 = time.time()
if not run("git clone " + env_gitrepo+ ""):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')
print("(*) <-- Cloning Time: " + str(time.time()-t1) + "s. ")


print("(*) Git, checkout to '" + env_gitcheckout+ "'\n")
os.chdir(os.path.join(os.getcwd(), "scummvm"))
if not run("git checkout " + env_gitcheckout+ ""):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')

print("(*) Editing App setting\n");
updatefiles("./dists/androidsdl/scummvm/AndroidAppSettings.cfg",replaceAppSetting);

print("(*) Adding configure params '" + env_configure+ "'\n")
updatefiles("./dists/androidsdl/scummvm/AndroidBuild.sh", replaceConfig);

print("(*) Running the build script.\n")
os.chdir(os.path.join(os.getcwd(), "dists","androidsdl"))
t1 = time.time()
if not run("./build.sh"):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')
print("(*) <-- Building time: " + str(time.time()-t1) + " sec. \n")

if not run("cp -f scummvm-debug.apk /etc/apk-output/"):
    print("Command failed with code " + str(lastErrorCode))
    raise Exception('Command failed')

print("(*) Build script finished\n")