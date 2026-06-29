# dotfiles-public

My configs, synced across machines with [GNU Stow](https://www.gnu.org/software/stow/).

## What's here

- **zsh** — `.zshrc` (oh-my-zsh, agnoster theme)
- **WezTerm** — `.config/wezterm/wezterm.lua`
- **tmux** — `.tmux.conf`
- **vim** — `.vimrc`
- **Neovim** — `.config/nvim` (packer; onedark, telescope, treesitter, nvim-tree, lualine, LSP via mason/lspconfig/lspsaga, nvim-cmp, toggleterm)
- **Claude** — Claude Code skills (`ui-ux-pro-max` bundle)

## Install

```bash
brew install stow
git clone git@github.com:cjhargreaves/dotfiles-public.git ~/Side/dotfiles_public
cd ~/Side/dotfiles_public
./install.sh
```

If a real file is already where Stow wants a symlink, it stops and warns you —
move the old file aside and re-run. To add a dotfile, put it in the matching
package folder (mirroring its path under `$HOME`) and run `./install.sh <package>`.

## Secrets

Machine-specific or sensitive values go in `~/.zshrc.local` and other `*.local`
files, which are gitignored.
