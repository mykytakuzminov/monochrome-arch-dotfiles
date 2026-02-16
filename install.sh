#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

PROJECT_NAME="arch-monochrome"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
PACKAGES_FILE="$SCRIPT_DIR/packages.txt"
CORE_DIR="$SCRIPT_DIR/core"
UTILS_DIR="$SCRIPT_DIR/utils"

BACKUP_DIR="$HOME/.config/${PROJECT_NAME}_backup_$(date +%Y%m%d_%H%M%S)"

log() {
    printf "[%s] %s\n" "$(date +'%H:%M:%S')" "$1"
}

error() {
    printf "[ERROR] %s\n" "$1" >&2
    exit 1
}

require_command() {
    command -v "$1" &>/dev/null || error "Required command '$1' not found."
}

check_arch() {
    [[ -f /etc/arch-release ]] || \
        error "This installer is intended for Arch Linux or Arch-based systems only."
}

install_packages() {
    log "Installing packages..."

    require_command pacman
    [[ -f "$PACKAGES_FILE" ]] || error "packages.txt not found."

    sudo pacman -Syu --needed --noconfirm - < "$PACKAGES_FILE"

    log "Package installation complete."
}

backup_if_exists() {
    local target="$1"

    if [[ -e "$target" && ! -L "$target" ]]; then
        mkdir -p "$BACKUP_DIR"
        log "Backing up $target → $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    fi
}

create_symlink() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        if [[ "$(readlink -f "$target")" == "$(readlink -f "$source")" ]]; then
            log "Symlink already correct: $target"
            return
        else
            log "Updating symlink: $target"
            rm "$target"
        fi
    elif [[ -e "$target" ]]; then
        backup_if_exists "$target"
    fi

    ln -s "$source" "$target"
    log "Linked $target → $source"
}

prepare_home_dirs() {
    log "Preparing home directories..."
    mkdir -p "$HOME/.config"
    mkdir -p "$HOME/screenshots"
}

deploy_core() {
    log "Deploying core configs..."

    # Explicit mappings (no magic)
    create_symlink "$CORE_DIR/hypr"       "$HOME/.config/hypr"
    create_symlink "$CORE_DIR/alacritty"  "$HOME/.config/alacritty"
    create_symlink "$CORE_DIR/waybar"     "$HOME/.config/waybar"
    create_symlink "$CORE_DIR/wofi"       "$HOME/.config/wofi"

    # zsh config
    create_symlink "$CORE_DIR/zsh/.zshrc" "$HOME/.zshrc"

    # wallpapers go directly into $HOME
    create_symlink "$CORE_DIR/wallpapers" "$HOME/wallpapers"
}

deploy_utils() {
    log "Deploying utility configs..."

    create_symlink "$UTILS_DIR/btop"      "$HOME/.config/btop"
    create_symlink "$UTILS_DIR/fastfetch" "$HOME/.config/fastfetch"
}

post_install() {
    log "Running post-install steps..."

    require_command zsh

    if [[ "$SHELL" != "$(command -v zsh)" ]]; then
        log "Changing default shell to zsh..."
        chsh -s "$(command -v zsh)"
    fi

    log "Installation finished successfully."
}

main() {
    check_arch
    install_packages
    prepare_home_dirs
    deploy_core
    deploy_utils
    post_install

    log "Backup directory (if used): $BACKUP_DIR"
}

main "$@"

