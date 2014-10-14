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

### 3. Install Vim Plugins for Vim

Requirement Vim version is below.

```
vim ~> 7.3 (~> patch 885)
```

You should install vim plugings via NeoBundle. You try to install as following sequence.

* Execute vim command
```
% vim
```

* Install vim plugins by "NeoBundle" Command(You must be in normal mode)
```
:NeoBundleInstall
```

If you wait a minute, the plugins will be installed.
