#!/bin/bash

# build-godot - A simple script to build Godot.

# Are we in or can we find the Godot directory? Otherwise, go to ~/workspace/godot
if [ ! -d "core/math" ]; then
    if [ -d "godot/core/math" ]; then
        cd "godot"
    elif [ -d "../godot/core/math" ]; then
        cd "../godot"
    elif [ -d "../../godot/core/math" ]; then
        cd "../../godot"
    elif [ -d "../../../godot/core/math" ]; then
        cd "../../../godot"
    elif [ -d "../../../../godot/core/math" ]; then
        cd "../../../../godot"
    elif [ -d "../../../../../godot/core/math" ]; then
        cd "../../../../../godot"
    elif [ -d "$HOME/workspace/godot" ]; then
        cd "$HOME/workspace/godot"
    else
        echo "Error: Unable to locate the Godot source code directory. Can't build."
        exit 1
    fi
fi

# Does Scons exist? If not, install it and other deps.
if [ ! -f /usr/bin/scons ]; then
    echo "Error: Unable to locate Scons."
    if [ -f /usr/bin/apt ]; then
        echo "We detected you're on Ubuntu, type your password to install required libs:"
        sudo apt update; sudo apt full-upgrade -y
        sudo apt install -y build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev \
            libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libfreetype6-dev libssl-dev libudev-dev \
            libxi-dev libxrandr-dev yasm
    elif [ -f /usr/bin/pacman ]; then
        echo "We detected you're on Arch, type your password to install required libs:"
        sudo pacman -S scons libxcursor libxinerama libxi libxrandr mesa glu alsa-lib pulseaudio freetype2 yasm
    elif [ -f /usr/bin/dnf ]; then
        echo "We detected you're on Fedora, type your password to install required libs:"
        sudo dnf install scons pkgconfig libX11-devel libXcursor-devel libXrandr-devel libXinerama-devel \
            libXi-devel mesa-libGL-devel alsa-lib-devel pulseaudio-libs-devel freetype-devel openssl-devel \
            libudev-devel mesa-libGLU-devel yasm
    fi
    if [ ! -f /usr/bin/scons ]; then # If it's still missing after running the above.
        echo "Please visit this website for more information: https://docs.godotengine.org/en/latest/development/compiling/compiling_for_x11.html."
        exit 2
    fi
fi

echo "Building Godot from $(pwd) ..."

rm -Rf ./bin/godot.* # Remove previously built binaries

# Actually begin the build process here:

scons target=editor werror=yes || echo -e '\a'

./bin/godot.linuxbsd.editor.x86_64
