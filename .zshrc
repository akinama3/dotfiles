autoload -U compinit
compinit

zstyle ':completion:*' list-colors ''
autoload -Uz vcs_info

PROMPT="%F{208}%n%%%f "
RPROMPT="[%1(v|%F{82}%1v%f|) %~]"
SPROMPT="correct: %R -> %r ? "

zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
autoload -U colors
colors
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^U" backward-kill-line
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt auto_cd
setopt auto_pushd
setopt correct

setopt autolist
setopt listtypes
setopt nolist_ambiguous
setopt nomenucomplete
setopt autoremoveslash
setopt auto_param_keys
setopt extendedglob
setopt nobeep
setopt transient_rprompt
setopt prompt_subst

autoload zed

# User specific environment and startup programs
PATH=$HOME/.rbenv/bin:/usr/local/php5/bin:/usr/local/ethnam/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/gree/common/php/bin:/var/www/1/vendor/bin:/opt/mysql/server-5.6/bin
LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/opt/mysql/server-5.6/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

export LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export PATH
# OSのタイプによって切り分け
case "$OSTYPE" in
  darwin*)
    alias ls="ls -G"
    export LANG="ja_JP.UTF-8"
    export LANGUAGE="ja_JP.UTF-8"
    export LC_ALL="ja_JP.UTF-8"
    ;;
  linux*)
    alias ls="ls --color"
    alias zeta="cd /var/www/1"
    # alias mysql="LANG=ja_JP.eucJP mysql"
    export LANG="en_US.UTF-8"
    export LANGUAGE="en_US.UTF-8"
    export LC_ALL="en_US.UTF-8"
    ;;
esac

alias vi=vim
alias r=rails

# 大文字小文字を区別しない補完設定
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドラインハイライト
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zle_highlight=(isearch:bold suffix:fg=208)

# XDEBUG
export XDEBUG_CONFIG="idekey=DBGP"
export XDEBUG_SESSION_START=DBGP
eval "$(rbenv init -)"

# ctags for GNU Global
export GTAGSLABEL=exuberant-ctags

# Gist
export GITHUB_URL=https://git.gree-dev.net/

# Default Editor
export EDITOR=/usr/local/bin/vim

# For Tmux PowerLine
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
