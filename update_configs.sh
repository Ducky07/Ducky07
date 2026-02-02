#!/usr/bin/env bash

set -e

sudo pacman -S ghostty
sudo pacman -S fish
sudo pacman -S starship

#Ghostty - 0xProto font recommended
cp /files/config ~/.config/ghostty/config
#Fish
cp /files/config.fish ~/.config/fish/config.fish
#Starship
cp /files/starship.toml ~/.config/starship.toml

echo "Configuration installation and update complete"