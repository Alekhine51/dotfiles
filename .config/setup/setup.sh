#!/usr/bin/bash

# setup script for fedora/GNOME

# Enable RPMfusion repos 

dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install packages

dnf install $(cat packages.txt)

# packages to install if not using GNOME
# redshift

# enable flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install \
	Discord \
	OpenMW \
 	mGBA \


# Python Packages

python3 -m pip install pipx
python3 -m pipx ensurepath

pipx install jrnl

## Calibre install script ##

sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Enable dark mode for Calibre(requires restart):

touch /etc/profile.d/calibre.sh

echo "export CALIBRE_USE_DARK_PALETTE=1" >> /etc/profile.d/calibre.sh

# Change default shell to fish

usermod --shell /usr/bin/fish $LOGNAME


# move dots to correct locations



# install vim plug

curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#hand off to setup.fish

./setup.fish

### Notes ###

# remember to save IRC server information

# packages with weird install methods I might not want to automate
# AFL++
# GB studio


# ctrl+alt+arrow switches workspaces

# Install GNOME Tweaks
# Enable Night Light

# DISABLE USER MESSAGE SOUND IN DISCORD

# Keyboard shortcuts: # (easier to do these manually)

# note: running terminal apps via shortcut has to include the term emulator, meaning the short
# cut for running cmus would be something like 'alacritty -e cmus' since it has to be executed
# in a new window

#Super+Return = open terminal
#Super+w = open browser - use firejail for this
#Super+space = run menu
#Super+g = run steam
#Super+m = run cmus
#Super+j run jrnl
#Super+d = pdf reader

# dotfile locations

#~/.config/fish
#~/.config/alacritty/alacritty.yml
#~/.fonts
#~/.config/nvim/init.vim
#~/.config/jrnl/jrnl.yaml

# Game saves

# /home/alekhine/.steam/steam/steamapps/compatdata/374320/pfx/drive_c/users/steamuser/Application Data/DarkSoulsIII
# /home/alekhine/Documents/NBGI/DarkSouls/
