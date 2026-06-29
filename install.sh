#!/usr/bin/env bash
# Dotfiles installer — symlinks each Stow package into $HOME.
#
# Usage:
#   ./install.sh            # stow all packages
#   ./install.sh wezterm    # stow only specific packages
#   ./install.sh -n         # dry run (show what would happen)
#
# Each top-level directory here is a "Stow package" whose contents mirror
# your home directory. `stow wezterm` links wezterm/.config/wezterm ->
# ~/.config/wezterm, and so on.

set -euo pipefail
cd "$(dirname "$0")"

# All stowable packages (directories, minus git/meta)
PACKAGES=(claude wezterm tmux vim zsh nvim)

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is not installed. Install it with: brew install stow"
  exit 1
fi

DRY=""
TARGETS=()
for arg in "$@"; do
  if [[ "$arg" == "-n" ]]; then DRY="-n -v"; else TARGETS+=("$arg"); fi
done
[[ ${#TARGETS[@]} -eq 0 ]] && TARGETS=("${PACKAGES[@]}")

for pkg in "${TARGETS[@]}"; do
  echo "==> stowing $pkg"
  stow $DRY --target="$HOME" "$pkg"
done

echo "Done. Restart your terminal (or run: tmux source ~/.tmux.conf)."
