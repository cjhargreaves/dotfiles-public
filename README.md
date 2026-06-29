# dotfiles-public

My personal config for zsh, WezTerm, vim, tmux, and Claude Code. Synced across
machines with [GNU Stow](https://www.gnu.org/software/stow/).

## zsh

oh-my-zsh with the `agnoster` theme, so the prompt shows the path and git
status. Opt/Alt arrows jump by word. Secrets and machine-specific stuff go in
`~/.zshrc.local`, which isn't committed.

## WezTerm

Black background, white text, green block cursor. JetBrains Mono Nerd Font,
16pt, DemiBold, hinting off. Keybindings match iTerm2/macOS: `⌘D` / `⌘⇧D` to
split, `⌘T` for a tab, `⌘⌥arrows` to move between panes, `⌘1-9` to jump to a
tab. Inactive panes dim.

## Vim

A small config for quick edits over SSH or when I don't want to load Neovim.
Relative line numbers, 4-space indents, case-insensitive search unless I type a
capital.

## Neovim — not here

My main editor lives in its own repo because it's a bigger setup (LSP via Mason,
Telescope, Treesitter, nvim-tree, OneDark): [CollinJH/nvim](https://github.com/CollinJH/nvim).

## Claude

Claude Code skills I keep around, like the `ui-ux-pro-max` bundle.

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
