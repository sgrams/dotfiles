# zsh

Zsh configuration with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and a custom Nord prompt.

## Files

| File | Description |
|------|-------------|
| `zshrc` | Main shell config (plugins, prompt, aliases) |
| `zprofile` | Login shell profile (sources `~/.profile`) |

## Installation

```sh
# install Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# symlink configs
ln -sf ~/git/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/git/dotfiles/zsh/zprofile ~/.zprofile
```

## Highlights

- **Theme:** custom Nord-colored prompt (no external theme required)
- **Plugins:** git
- **Aliases:** `vi`/`vim` → `nvim`, `ls` with color, `nvimlog` with AnsiEsc
