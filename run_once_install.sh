#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
    brew bundle --file="$HOME/.dotfiles/Brewfile"
else
    sudo pacman -S --noconfirm \
        tmux \
        neovim \
        zsh \
        git \
        chezmoi
fi
