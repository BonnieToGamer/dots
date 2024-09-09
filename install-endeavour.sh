#!/bin/bash

# This script installs rebos and sets it up.
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit
fi


echo -e "\n[oglo-arch-repo]\nSigLevel = Optional DatabaseOptional\nServer = https://gitlab.com/Oglo12/\$repo/-/raw/main/\$arch" | tee -a /etc/pacman.conf
pacman -Syy

yay -S rebos --noconfirm

rebos setup
rebos config init
rebos gen commit "inital"
rebos gen current build
rebos gen current sync