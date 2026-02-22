#!/usr/bin/env bash
set -euo pipefail

### ==========================================
### PATHS
### ==========================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_SOURCE="$DOTFILES_DIR/config"
CONFIG_TARGET="$HOME/.config"

HOME_SOURCE="$DOTFILES_DIR/home"
HOME_TARGET="$HOME"

WALLPAPER_SOURCE="$DOTFILES_DIR/wallpapers"
WALLPAPER_TARGET="$HOME/wallpapers"

PACKAGES_FILE="$DOTFILES_DIR/packages.txt"

BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

### ==========================================
### LOGGING
### ==========================================

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }
warn() { echo -e "\033[1;33m[WARN]\033[0m $1"; }

### ==========================================
### PACKAGE INSTALL
### ==========================================

install_packages() {
  if [[ -f "$PACKAGES_FILE" ]]; then
    log "Installing packages..."
    sudo pacman -S --needed --noconfirm $(grep -v '^#' "$PACKAGES_FILE")
  else
    warn "packages.txt not found, skipping."
  fi
}

### ==========================================
### DIRECTORIES
### ==========================================

create_user_dirs() {
  log "Creating user directories..."
  mkdir -p "$HOME/downloads" "$HOME/records" "$HOME/screenshots"
  mkdir -p "$CONFIG_TARGET"
}

### ==========================================
### SAFE SYMLINK
### ==========================================

backup_if_exists() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    log "Backing up $target"
    mkdir -p "$BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
  fi
}

create_symlink() {
  local source="$1"
  local target="$2"

  if [[ -L "$target" ]]; then
    if [[ "$(readlink "$target")" == "$source" ]]; then
      log "$target already linked correctly"
      return
    else
      rm "$target"
    fi
  fi

  backup_if_exists "$target"

  ln -s "$source" "$target"
  log "Linked $target → $source"
}

### ==========================================
### LINK CONFIG (.config)
### ==========================================

link_config() {
  log "Linking .config directory..."
  for item in "$CONFIG_SOURCE"/*; do
    name="$(basename "$item")"
    create_symlink "$item" "$CONFIG_TARGET/$name"
  done
}

### ==========================================
### LINK HOME DOTFILES
### ==========================================

link_home() {
  log "Linking home dotfiles..."

  # gitconfig
  create_symlink "$HOME_SOURCE/git/.gitconfig" "$HOME_TARGET/.gitconfig"

  # zshrc
  create_symlink "$HOME_SOURCE/zsh/.zshrc" "$HOME_TARGET/.zshrc"

  # ssh directory
  create_symlink "$HOME_SOURCE/ssh/.ssh" "$HOME_TARGET/.ssh"

  # secure ssh permissions
  chmod 700 "$HOME_TARGET/.ssh"
  chmod 600 "$HOME_TARGET/.ssh/"*
}

### ==========================================
### LINK WALLPAPERS
### ==========================================

link_wallpapers() {
  log "Linking wallpapers..."
  create_symlink "$WALLPAPER_SOURCE" "$WALLPAPER_TARGET"
}

### ==========================================
### MAIN
### ==========================================

main() {
  install_packages
  create_user_dirs
  link_config
  link_home
  link_wallpapers
  log "All done."
}

main "$@"
