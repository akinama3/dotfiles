#/bin/sh

DOTFILES_DIR=".dotfiles"

# zshrc
if [ -e ~/.zshrc ]; then
  rm -f ~/.zshrc
fi
ln -s ~/$DOTFILES_DIR/.zshrc ~/.zshrc

# vimrc
if [ -e ~/.vimrc ]; then
  rm -f ~/.vimrc
fi
ln -s ~/$DOTFILES_DIR/.vimrc ~/.vimrc

# gvimrc
if [ -e ~/.gvimrc ]; then
  rm -f ~/.gvimrc
fi
ln -s ~/$DOTFILES_DIR/.gvimrc ~/.gvimrc

# vimrc.local 環境依存のvimrcファイル(gtagsとか)
if [ ! -e ~/.vimrc.local ]; then
  touch ~/.vimrc.local
fi

# vim directory
if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi
ln -s ~/$DOTFILES_DIR/.vim ~/.vim
git submodule update --init

# tmux
if [ -e ~/.tmux.conf ]; then
  rm -f ~/.tmux.conf 
fi
ln -s ~/$DOTFILES_DIR/.tmux.conf ~/.tmux.conf

# tmux popdwerline
if [ -e ~/.tmux-powerlinerc ]; then
  rm -f ~/.tmux-powerlinerc
fi
ln -s ~/$DOTFILES_DIR/.tmux-powerlinerc ~/.tmux-powerlinerc

# global rc settings
ln -s ~/$DOTFILES_DIR/.globalrc ~/.globalrc
