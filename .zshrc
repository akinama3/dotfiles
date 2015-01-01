# setting variables
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000

# prompt variables
PROMPT="%F{208}%n%%%f "
RPROMPT="[%1(v|%F{82}%1v%f|) %~]"
SPROMPT="correct: %R -> %r ? "

# emacs keybind
bindkey -e

# completion setting
autoload -Uz compinit
compinit

# VCS
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

# zmv
autoload -Uz zmv

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# colorize list
zstyle ':completion:*' list-colors ''
autoload -Uz vcs_info

# colorize by name
autoload -Uz colors
colors

# word separation
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|."
zstyle ':zle:*' word-style unspecified

# disable ^Q/^S flow control
setopt no_flow_control

# ignore duplication command history list
setopt hist_ignore_dups     

# share command history data
setopt share_history

# cd command abbriviation
setopt auto_cd

# execute pushd automatically
setopt auto_pushd

# block beep sound
setopt no_beep

# list files/directories automatically
setopt auto_list

# show identifier mark in listing
setopt list_types

# file name completion
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt no_menu_complete

# **/* glob 
setopt extended_glob

# transient RPROMPT 
setopt transient_rprompt

# deployment variables to prompt
setopt prompt_subst

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# command line highlighting
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User specific environment and startup programs
PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/Applications/android-sdk-macosx/platform-tools:/Applications/android-sdk-macosx/tools
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.7"`
PATH=${JAVA_HOME}/bin:${PATH}
LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/opt/mysql/server-5.6/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
SCALA_HOME=/usr/local/scala

# OSのタイプによって切り分け
case "$OSTYPE" in
  darwin*)
    PATH=/opt/chefdk/bin:/usr/local/Cellar/gradle/bin:$PATH
    export GRADLE_HOME=/usr/local/Cellar/gradle/2.2.1
    alias ls="ls -G"
    export LANG="ja_JP.UTF-8"
    export LANGUAGE="ja_JP.UTF-8"
    export LC_ALL="ja_JP.UTF-8"
    ;;
  linux*)
    alias ls="ls --color"
    export LANG="ja_JP.UTF-8"
    export LANGUAGE="ja_JP.UTF-8"
    export LC_ALL="ja_JP.UTF-8"
    ;;
esac

# Environment variables
export LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export PATH
export SCALA_HOME

alias vi=vim
alias r=rails

# XDEBUG
export XDEBUG_CONFIG="idekey=DBGP"
export XDEBUG_SESSION_START=DBGP
eval "$(rbenv init -)"

# ctags for GNU Global
export GTAGSLABEL=exuberant-ctags

# Default Editor
export EDITOR=vim

# For Tmux PowerLine
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
