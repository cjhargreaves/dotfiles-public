# dotfiles-public

Portable configuration synced across machines via [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a **Stow package** whose contents mirror `$HOME`.
Running `stow <package>` symlinks its files into your home directory.

```
dotfiles_public/
├── claude/.claude/skills/      → ~/.claude/skills/   (Claude Code skills)
├── wezterm/.config/wezterm/    → ~/.config/wezterm/  (terminal config)
├── tmux/.tmux.conf             → ~/.tmux.conf        (session manager)
└── install.sh                  symlinks everything via stow
```

## Install on a new machine

```bash
# 1. Prereqs
brew install stow tmux
brew install --cask wezterm

# 2. Clone and link
git clone git@github.com:cjhargreaves/dotfiles-public.git ~/Side/dotfiles_public
cd ~/Side/dotfiles_public
./install.sh
```

If a real file already exists where Stow wants to put a symlink, Stow will
stop and warn you. Move the existing file aside, then re-run.

## Adding a new dotfile

Drop it into the matching package folder (mirroring its path under `$HOME`),
then re-run `./install.sh <package>`. No script edits needed.

## Tools

- **WezTerm** — GPU terminal, configured in Lua. Keybindings mirror iTerm2's
  macOS defaults (⌘D split, ⌘T tab, ⌘⌥arrows to move between panes).
- **tmux** — persistent sessions. Prefix is `Ctrl-a`. `|` / `-` split,
  `h/j/k/l` move between panes, `prefix r` reloads config.
- **Claude skills** — includes the `ui-ux-pro-max` skill bundle.

## Secrets

Never commit secrets to this public repo. Keep machine-specific or sensitive
values in `~/.zshrc.local` etc. — those `*.local` files are gitignored.
