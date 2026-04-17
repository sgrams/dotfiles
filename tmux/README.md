# tmux configuration

Consolidated tmux configuration based on [Oh my tmux!](https://github.com/gpakosz/.tmux) by Gregory Pakosz.

## Files

| File | Description |
|------|-------------|
| `tmux.conf` | Oh my tmux! framework (upstream base config — do not modify) |
| `tmux.conf.local` | User customizations (theme, bindings, options) |

## Highlights

- **Theme:** Nord (Polar Night / Snow Storm / Frost / Aurora palette)
- **Prefix:** `C-a` on host, `C-b` on remotes (auto-detected via `SSH_TTY`)
- **Mouse:** enabled
- **Mode keys:** vi
- **History limit:** 10000
- **Powerline separators:** enabled (requires Nerd Font or Powerline-patched font)

## Installation

```sh
# symlink the framework config
ln -sf ~/git/dotfiles/tmux/tmux.conf ~/.tmux.conf

# symlink the local customizations (XDG path)
mkdir -p ~/.config/tmux
ln -sf ~/git/dotfiles/tmux/tmux.conf.local ~/.config/tmux/tmux.conf.local

# alternatively, symlink local config to home (legacy path)
# ln -sf ~/git/dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local
```

Reload with `<prefix> + r` or `tmux source-file ~/.tmux.conf`.
