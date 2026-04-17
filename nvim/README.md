# nvim

Neovim configuration with [vim-plug](https://github.com/junegunn/vim-plug) plugin manager and Nord theme.

## vim-plug

[vim-plug](https://github.com/junegunn/vim-plug) is a minimalist plugin manager for Vim/Neovim.
It installs plugins in parallel, supports lazy loading, and keeps itself out of your config directory.

### Installing vim-plug

Download `plug.vim` into the neovim autoload directory:

```sh
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This places the file at `~/.local/share/nvim/site/autoload/plug.vim`.

### vim-plug commands

| Command | Description |
|---------|-------------|
| `:PlugInstall` | Install plugins listed in `init.vim` |
| `:PlugUpdate` | Update installed plugins |
| `:PlugClean` | Remove unlisted plugins |
| `:PlugStatus` | Check plugin status |
| `:PlugUpgrade` | Upgrade vim-plug itself |

## Installation

```sh
# 1. install vim-plug (see above)
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 2. symlink config
mkdir -p ~/.config/nvim
ln -sf ~/git/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# 3. install plugins
nvim +PlugInstall +qall
```

## Dependencies

- [ag](https://github.com/ggreer/the_silver_searcher) (optional, for ack.vim)
- [ctags](https://ctags.io/) (optional, for tagbar and autotag)
