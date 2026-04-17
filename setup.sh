#!/usr/bin/env bash
# setup.sh — dotfiles symlink installer
# Usage: ./setup.sh [--all] [component ...]

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

setup_tmux() {
  echo ":: setting up tmux"
  ln -sfv "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
  ln -sfv "$DOTFILES_DIR/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"
  mkdir -p "$HOME/.config/tmux"
  ln -sfv "$DOTFILES_DIR/tmux/tmux.conf.local" "$HOME/.config/tmux/tmux.conf.local"
  echo "   done"
}

setup_nvim() {
  echo ":: setting up nvim"
  mkdir -p "$HOME/.config/nvim"
  ln -sfv "$DOTFILES_DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"
  echo "   done"
}

setup_zsh() {
  echo ":: setting up zsh"
  ln -sfv "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
  ln -sfv "$DOTFILES_DIR/zsh/zprofile" "$HOME/.zprofile"
  echo "   done"
}

COMPONENTS=(tmux nvim zsh)

usage() {
  echo "Usage: $0 [--all] [component ...]"
  echo ""
  echo "Components: ${COMPONENTS[*]}"
  echo ""
  echo "Options:"
  echo "  --all    Set up all components"
  echo "  --help   Show this help"
}

prompt_menu() {
  echo "dotfiles setup"
  echo "=============="
  echo ""
  echo "Available components:"
  for i in "${!COMPONENTS[@]}"; do
    printf "  %d) %s\n" "$((i + 1))" "${COMPONENTS[$i]}"
  done
  printf "  a) all\n"
  printf "  q) quit\n"
  echo ""
  read -rp "Select components (e.g. 1 3, or a for all): " choice

  if [[ "$choice" == "q" ]]; then
    echo "Aborted."
    exit 0
  fi

  if [[ "$choice" == "a" ]]; then
    for c in "${COMPONENTS[@]}"; do
      "setup_$c"
    done
    return
  fi

  for token in $choice; do
    idx=$((token - 1))
    if [[ $idx -ge 0 && $idx -lt ${#COMPONENTS[@]} ]]; then
      "setup_${COMPONENTS[$idx]}"
    else
      echo "Unknown selection: $token"
    fi
  done
}

# --- main ---
if [[ $# -eq 0 ]]; then
  prompt_menu
  exit 0
fi

for arg in "$@"; do
  case "$arg" in
    --all)
      for c in "${COMPONENTS[@]}"; do
        "setup_$c"
      done
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    tmux|nvim|zsh)
      "setup_$arg"
      ;;
    *)
      echo "Unknown component: $arg"
      usage
      exit 1
      ;;
  esac
done
