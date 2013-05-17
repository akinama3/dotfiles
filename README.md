# Usage

You can use the following script to install various setting files.

### 1. Cloning Repository

```
% git clone https://github.com/akinama/dotfiles.git .dotfiles
```

### 2. Git Submodule Update NeoBundle and Make Symbolic Links

1. The script make symbolic links of .vimrc, .zshrc, .tmux.conf files and .vim directory from .dotfiles directory to home directory
2. The script updating NeoBundle submodule including "--init"

```
% cd ~/.dotfiles
% sh setting.sh
```
