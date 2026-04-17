# nvim

Neovim configuration with [vim-plug](https://github.com/junegunn/vim-plug) plugin manager and Nord theme.

## Installation

```sh
# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# symlink config
mkdir -p ~/.config/nvim
ln -sf ~/git/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# install plugins (from within neovim)
nvim +PlugInstall +qall
```

## Dependencies

- [ag](https://github.com/ggreer/the_silver_searcher) (optional, for ack.vim)
- [ctags](https://ctags.io/) (optional, for tagbar and autotag)
