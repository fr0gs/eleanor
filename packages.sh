#!/bin/bash
tput setaf 3
echo "INSTALLING ELEANOR PROJECT"
echo "---------------------------"
tput sgr0

tput setaf 4
echo "*Installing basic packages"
tput sgr0


sudo apt-get install --no-install-recommends lua5.1 xmlto luadoc libxcb-randr0-dev libxcb-xtest0-dev \
 libxcb-xinerama0-dev  libxcb-shape0-dev libxcb-keysyms1-dev libxcb-icccm4-dev libx11-xcb-dev lua-lgi-dev \
 libstartup-notification0-dev libxdg-basedir-dev libxcb-image0-dev libxcb-util0-dev libgdk-pixbuf2.0-dev build-essential cmake graphicsmagick-imagemagick-compat libxcb-cursor0 cairo-clock gtk2-engines* libxcb-xkb1 libcairo2-dev libxcb-cursor-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xkb-dev liblua5.1-0 liblua5.1-0-dbg lua5.1 liblua5.1-0-dev curl graphicsmagick cmake curl xorg libasound2 alsa-utils alsa-oss alsa-tools-gui curl thunar wicd wicd-curses terminator iceweasel xfonts-terminus --yes


#Awesome

tput setaf 4
echo "*Downloading AWESOME-WM"
tput sgr0

MACHINE_TYPE=`uname -m`

if [ "$MACHINE_TYPE" == "x86_64" ]; then
    curl -O http://lmde-mirror.gwendallebihan.net/latest/pool/main/a/awesome/awesome_3.5.1-1_amd64.deb
    tput setaf 4
    echo "*Installing AWESOME-WM-64"
    tput sgr0
    sudo dpkg -i awesome_3.5.1-1_amd64.deb
    apt-get -f install
else
    curl -O http://lmde-mirror.gwendallebihan.net/latest/pool/main/a/awesome/awesome_3.5.1-1_i386.deb
    tput setaf 4
    echo "*Installing AWESOME-WM-32"
    tput sgr0
    sudo dpkg -i awesome_3.5.1-1_i386.deb
    apt-get -f install
fi
tput setaf 4
echo "*INSTALLING THEMES"
tput sgr0

tar -xvf packages/169791-Blue\ Ambiance.tar.gz
tar -xvf packages/Papyrus-Install-Package.tar.gz

sudo cp -r Blue\ Ambiance/themes/Blue\ Ambiance/ /usr/share/themes/
cd Install-Package/
./INSTALL.sh
sudo chmod -R +xr /usr/share/icons/*
cd ..
