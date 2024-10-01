#!/bin/bash

# This script installs rebos and sets it up.

sudo echo -e "\n[oglo-arch-repo]\nSigLevel = Optional DatabaseOptional\nServer = https://gitlab.com/Oglo12/\$repo/-/raw/main/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy

yay -S rebos --noconfirm

rebos setup
rebos config init
rebos gen commit "inital"
rebos gen current build
rebos gen current sync
