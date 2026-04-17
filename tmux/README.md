# tmux configuration

Forked from [Oh my tmux!](https://github.com/gpakosz/.tmux) by Gregory Pakosz.
Dual licensed under WTFPL v2 and MIT — see `LICENSE.WTFPLv2` and `LICENSE.MIT`.

## Files

| File | Description |
|------|-------------|
| `tmux.conf` | Oh my tmux! framework (forked base config) |
| `tmux.conf.local` | User customizations (theme, bindings, options) |
| `LICENSE.MIT` | MIT license (upstream) |
| `LICENSE.WTFPLv2` | WTFPL v2 license (upstream) |

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
