# dotfiles-public

My personal environment. Not a starter kit, not a framework — just how I like
my shell, my terminal, my editor, and my AI to behave. These are synced across
machines with [GNU Stow](https://www.gnu.org/software/stow/).

## zsh

oh-my-zsh with the `agnoster` theme — I want the prompt to tell me where I am
and what git's doing without me asking. Word-jumping with `Opt`/`Alt` arrows
because moving one character at a time is for people with more patience than me.
Anything secret or machine-specific lives in `~/.zshrc.local`, which never
leaves the laptop.

## WezTerm

Pure black background, white text, a green block cursor — high contrast, no
theme cosplay. JetBrains Mono Nerd Font at 16pt, DemiBold, hinting off so it
stays smooth. The keybindings pretend to be iTerm2/macOS so my muscle memory
keeps working: `⌘D` / `⌘⇧D` to split, `⌘T` for a tab, `⌘⌥arrows` to hop between
panes, `⌘1-9` to jump to a tab. Inactive panes dim themselves so I always know
which one is live.

## Vim

The lightweight one, for quick edits over SSH or when I don't want to wake the
whole Neovim machine. Relative line numbers, 4-space indents, smart search that
only cares about case when I type a capital. Nothing fancy — it should open
instantly and get out of the way.

## Neovim — not portable

My real editor, but it doesn't live here. It's a full IDE-grade setup (LSP via
Mason, Telescope, Treesitter, nvim-tree, OneDark) with enough moving parts that
it gets its own repo and its own install dance: [CollinJH/nvim](https://github.com/CollinJH/nvim).
Too opinionated and too dependency-heavy to pretend it's a simple symlink.

## Claude

Claude Code skills I actually keep around — the `ui-ux-pro-max` bundle and
friends. This is the part of my environment that thinks, so I treat its config
like any other dotfile.

## Install

```bash
brew install stow
git clone git@github.com:cjhargreaves/dotfiles-public.git ~/Side/dotfiles_public
cd ~/Side/dotfiles_public
./install.sh
```

If a real file is already sitting where Stow wants a symlink, it'll stop and
warn you — move the old file aside and re-run. To add a new dotfile, drop it
into the matching package folder (mirroring its path under `$HOME`) and re-run
`./install.sh <package>`.

## Secrets

Never commit secrets to a public repo. Machine-specific or sensitive values go
in `~/.zshrc.local` and other `*.local` files, which are gitignored.
