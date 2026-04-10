#!/bin/bash
set -e

DOTS="$(cd "$(dirname "$0")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Packages that symlink into ~/.config/
config_packages=(nvim kitty gh zsh scripts)

link() {
    local target="$1" link="$2"

    if [ -L "$link" ]; then
        echo "  removing old symlink $link"
        rm "$link"
    elif [ -e "$link" ]; then
        echo "  backing up $link -> ${link}.bak"
        mv "$link" "${link}.bak"
    fi

    ln -s "$target" "$link"
    echo "  linked $link -> $target"
}

echo "==> Initializing submodules"
git -C "$DOTS" submodule update --init --recursive

echo "==> Linking config packages"
mkdir -p "$CONFIG_HOME"
for pkg in "${config_packages[@]}"; do
    link "$DOTS/$pkg" "$CONFIG_HOME/$pkg"
done

echo "==> Setting up ~/.zshenv"
link "$DOTS/zshenv" "$HOME/.zshenv"

echo "==> Done"
