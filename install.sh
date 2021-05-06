#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt update && sudo apt upgrade -y
sudo apt install curl wget apt-transport-https dirmngr

sudo apt install -f -y i3blocks xorg software-properties-common firefox-esr fonts-font-awesome fonts-roboto devscripts snapd rxvt-unicode pulseaudio pavucontrol alsa-utils flameshot feh build-essential vim neovim ranger highlight atool w3m poppler-utils mediainfo compton python-pip libcanberra-gtk-module snapd font-manager discord network-manager

sudo apt install -f -y default-jre default-jdk python3

sudo snap install intellij-idea-ultimate --classic --edge
sudo snap install spotify

### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
### Create dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

### Create dirs
mkdir ~/.config/
mkdir ~/.themes/
mkdir ~/.fonts/

### Install fonts
rsync -a .fonts ~/
fc-cache

### gaps installer
chmod +x sh/gaps.sh
sh/./gaps.sh

### Install configs
rsync -a .config/ ~/.config/
rsync .Xresources ~/
sudo xrdb ~/.Xresources
mv ./Black.png ~/
rsync .bashrc ~/
