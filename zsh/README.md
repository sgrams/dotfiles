# zsh

Zsh configuration with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and a custom Nord prompt.

## Files

| File | Description |
|------|-------------|
| `zshrc` | Main shell config (plugins, prompt, aliases) |
| `zprofile` | Login shell profile (sources `~/.profile`) |

## Oh My Zsh

[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) is a community-driven framework for managing zsh configuration.
It provides helpful plugins, themes, and functions out of the box.

### Installing Oh My Zsh

Via curl:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Via wget:

```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This installs Oh My Zsh to `~/.oh-my-zsh` and backs up any existing `~/.zshrc`.

> **Note:** After installing, replace the generated `~/.zshrc` with the symlink below.

### Oh My Zsh commands

| Command | Description |
|---------|-------------|
| `omz update` | Update Oh My Zsh |
| `omz plugin list` | List available plugins |
| `omz plugin enable <name>` | Enable a plugin |
| `omz plugin disable <name>` | Disable a plugin |
| `omz reload` | Reload the shell configuration |

### Adding plugins

Edit the `plugins=()` array in `zshrc`. Available plugins are in `~/.oh-my-zsh/plugins/`.
Custom plugins go in `~/.oh-my-zsh/custom/plugins/`.

## Installation

```sh
# 1. install Oh My Zsh (see above)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. symlink configs (replaces the generated .zshrc)
ln -sf ~/git/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/git/dotfiles/zsh/zprofile ~/.zprofile

# 3. reload
exec zsh
```

## Highlights

- **Theme:** custom Nord-colored prompt (no external theme required, `ZSH_THEME=""`)
- **Plugins:** git
- **Aliases:** `vi`/`vim` → `nvim`, `ls` with color, `nvimlog` with AnsiEsc
