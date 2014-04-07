# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -d /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin ] ; then
    PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:"${PATH}"
fi

# set PATH so it includes user's private bin if it exists
if [ -d $HOME/bin ] ; then  
    PATH=$HOME/bin:/usr/local/bin:"${PATH}"
fi

alias p4st="pushd $P4ROOT;/usr/local/bin/perforce_status|less;popd"
alias gitp4on="cp $HOME/.gitconfig-p4 $HOME/.gitconfig"
alias gitp4off="cp $HOME/.gitconfig-cmd $HOME/.gitconfig"
alias gitclog="git log --graph --full-history --all --color --pretty=format:\"%C(yellow)%h %C(green)%d %C(red)%ce %C(cyan)%cr %C(reset)%s\""
alias gitcdiff="git diff --color"
alias gitsubpnu="git pull && git submodule foreach --recursive git submodule init && git submodule foreach --recursive git submodule update && git submodule foreach --recursive git submodule status"
alias cdft="cd $HOME/Projects/GameDev/C4FlipCC"
alias cdms="cd $HOME/Projects/MacSetup"
alias badtest="mvn clean install -Ptests,sign -Dtuenti.api_endpoint=https://web2.${USER}vm.testing.tuenti.local/index.msngr.php -Dtuenti.tuentomatic_endpoint=http://tuentomatic.${USER}vm.testing.tuenti.local -Dandroid.lint.skip=true -DskipTests -Pfull"
alias badmvn="time ( mvn clean install -Parmeabi-v7a,sign,fast && mvn android:{deploy,run} -pl app )"
alias armbadmvn="time (mvn clean install -Parmeabi,armeabi-v7a,sign,fast && mvn android:{deploy,run} -pl app )"

# MacPorts Installer addition on 2011-07-09_at_19:15:09: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


#Scons specific stuff
#export SCONS_DIR=/usr/local/Cellar/scons/2.1.0
export SCONS_DIR=/usr/local/Cellar/scons/2.1.0/libexec/scons-local
#end Scons specific stuff
#swtoolkit
PATH_TO_SWTOOLKIT=$HOME/troot/swtoolkit
export PATH=$PATH_TO_SWTOOLKIT:$PATH
#end swtoolkit
#pvr stuff
if [ -f /Applications/Imagination/PowerVR/GraphicsSDK/PVRTexTool/CL/OSX_x86/PVRTexToolCL ]; then
    PVR_BIN="/Applications/Imagination/PowerVR/GraphicsSDK/PVRTexTool/CL/OSX_x86";
    export PVR_TEXTOOL="${PVR_BIN}/PVRTexToolCL";
elif [ -f /Applications/Imagination/PowerVR/GraphicsSDK/PVRTexTool/CLI/OSX_x86/PVRTexToolCLI ]; then
    PVR_BIN="/Applications/Imagination/PowerVR/GraphicsSDK/PVRTexTool/CLI/OSX_x86";
    export PVR_TEXTOOL="${PVR_BIN}/PVRTexToolCLI";
fi
#end pvr stuff
#Android / Java specific stuff
if [ -d /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK ] ; then
    #darwin
    export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
    export JAVA_SRC="${JAVA_HOME}/bundle"
elif [ -d /usr/lib/jvm/java-6-sun ] ; then
    #linux
    export JAVA_HOME="/usr/lib/jvm/java-6-sun"
    export JAVA_SRC="${JAVA_HOME}"
fi
CATALINA_HOME="/Users/nick/troot/mss-3.0.0-SNAPSHOT-apache-tomcat-7.0.50"
export ANT_ROOT=/usr/share/ant
export ANDROID_NDK_ROOT=$HOME/android-ndks/android-ndk-r9d
export ANDROID_SDK_ROOT=$HOME/android-sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_SDK=$ANDROID_SDK_ROOT
export ANDROID_NDK_HOME=$ANDROID_NDK_ROOT
export NDK_ROOT=$ANDROID_NDK_ROOT
#DISTCCD config
PATH=$ANDROID_NDK_HOME/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86/bin:$ANDROID_NDK_ROOT:$ANDROID_SDK_ROOT:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/build-tools/17.0.0:$HOME/troot/depot_tools:$PVR_BIN:$CATALINA_HOME/bin:$PATH

# Finished adapting your PATH environment variable for use with MacPorts.
# MacPorts Installer addition on 2011-07-09_at_19:20:35: adding an appropriate PATH variable for use with MacPorts.
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
