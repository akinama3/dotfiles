# Usage

You can use the following script to install various setting files.

### 1. Cloning Repository

```
% git clone https://github.com/akinama/dotfiles.git .dotfiles
```

### 2. Install dein.vim and Make Symbolic Links

1. The script installs dein.vim to ~/.cache/dein
2. The script makes symbolic links of .vimrc, .zshrc, .tmux.conf files and .vim directory from .dotfiles directory to home directory

```
% cd ~/.dotfiles
% sh setting.sh
```

### 3. Install Plugins for NeoVim

The conformed NeoVim version is below.

```
neovim ~> 0.2.2
```

You should install vim plugings via dein.vim. You try to install as following sequence.

* Execute nvim command and automatically install with dein.vim
```
% nvim
```

* Manual install plugins by "dein.vim"
```
:call dein#install()
```

If you wait a minute, the plugins will be installed.
