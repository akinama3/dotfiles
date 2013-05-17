# Usage

You can use the following script to install various setting files.

### 0. Cloning Repository

```
% git clone https://github.com/akinama/dotfiles.git .dotfiles
```

### 1. Git Submodule Update NeoBundle

```
% cd ~/.dotfiles
% git submodule init
% git submodule update
```

### 2. Make Symbolic Links

1. The script make .dotfiles directory 
2. The script make symbolic links of .vimrc, .zshrc, .tmux.conf files and .vim directory from .dotfiles directory to home directory

```
% sh setting.sh
```

