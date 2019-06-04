FROM ubuntu:16.04

# Switch to root to be able to install stuff
USER root

# This will make apt-get install without question
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade

# Install dependencies
RUN apt-get -y install nano \
 git build-essential \
 openjdk-8-jdk \
 g++ make libsdl2-dev liba52-dev \
 libjpeg62-dev libmpeg2-4-dev libogg-dev libvorbis-dev \
 libflac-dev libmad0-dev libpng-dev libtheora-dev \
 libfaad-dev libfluidsynth-dev libfreetype6-dev zlib1g-dev \
 libunity-dev \
 unzip zip python3
#Zip is very important, o.w. wont work!

# Create folders
RUN mkdir ~/.android
RUN mkdir ~/Android
RUN mkdir ~/Android/android-sdk
RUN mkdir -p /etc/apk-output/

# Unzip files:
COPY sdk-tools-linux-4333796.zip .
RUN unzip sdk-tools-linux-4333796.zip -d ~/Android/android-sdk/
RUN rm sdk-tools-linux-4333796.zip

COPY android-ndk-r15c-linux-x86_64.zip  .
RUN unzip android-ndk-r15c-linux-x86_64.zip -d ~/Android/
RUN rm android-ndk-r15c-linux-x86_64.zip

# Install and accept all SDK\NDK licences: 
RUN touch /root/.android/repositories.cfg
RUN sh -c ' printf "y\ny\ny\ny\ny\ny\ny\ny\ny\ny\n" | ~/Android/android-sdk/tools/bin/sdkmanager --install "platforms;android-26" '
RUN sh -c ' printf "y\ny\ny\ny\ny\ny\ny\ny\ny\ny\n" | ~/Android/android-sdk/tools/bin/sdkmanager --install "build-tools;26.0.0" '
RUN sh -c ' printf "y\ny\ny\ny\ny\ny\ny\ny\ny\ny\n" | ~/Android/android-sdk/tools/bin/sdkmanager --install "extras;android;m2repository" '
RUN sh -c ' printf "y\ny\ny\ny\ny\ny\ny\ny\ny\ny\n" | ~/Android/android-sdk/tools/bin/sdkmanager --licenses'

RUN /root/Android/android-sdk/tools/bin/sdkmanager --list

# Set envs:
ENV ANDROID_HOME=/root/Android/android-sdk
ENV ANDROID_SDK_ROOT=/root/Android/android-sdk
ENV ANDROID_NDK_HOME=/root/Android/android-ndk-r15c
ENV ANDROID_SDK_TOOLS=$ANDROID_HOME/tools
ENV ANDROID_SDK_BTOOLS=$ANDROID_HOME/build-tools/26.0.0
ENV PATH=$ANDROID_NDK_HOME:$ANDROID_SDK_TOOLS:$ANDROID_SDK_BTOOLS:$PATH

# Create android debug key for signing
RUN keytool -genkey -v -keystore /root/.android/debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "cn=ScummVM Heb, ou=HebrewAdventure, o=Group, c=IL"
RUN keytool -importkeystore -srckeystore /root/.android/debug.keystore -srcstorepass android -destkeystore /root/.android/debug.keystore -deststoretype pkcs12 

# Solve problems with which command by alias (only for interactive)
#RUN echo 'alias which="type -P"' >> /root/.bashr

WORKDIR /

COPY git_build.py /

CMD ["python3","git_build.py"]
