#!/usr/bin/env bash

set -e

packages=("ghostty" "fish" "starship")

missing=()

for pkg in "${packages[@]}"; do
    if ! pacman -Qi "$pkg" > /dev/null 2>&1; then
        missing+=("$pkg")
    fi
done

if [ ${#missing[@]} -eq 0 ]; then
    echo "Everything is already installed"
else
    echo "Installing: ${missing[*]}"
    sudo pacman -S "${missing[@]}"
fi

ghostty &
sleep 2

#Ghostty - 0xProto font recommended
cp ./files/config ~/.config/ghostty/config
#Fish
cp ./files/config.fish ~/.config/fish/config.fish
#Starship
cp ./files/starship.toml ~/.config/starship.toml

clear
echo "Configuration installation and update complete"
