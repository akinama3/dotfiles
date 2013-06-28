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
PATH=$HOME/.rbenv/bin:/usr/local/ethnam/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/gree/common/php/bin:/var/www/1/vendor/bin
LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

export LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export PATH
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

alias r=rails
alias ls="ls --color"
alias mysql="LANG=ja_JP.eucJP mysql"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias zeta="cd /var/www/1"

# 大文字小文字を区別しない補完設定
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドラインハイライト
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zle_highlight=(isearch:bold suffix:fg=208)

# XDEBUG
export XDEBUG_CONFIG="idekey=DBGP"
export XDEBUG_SESSION_START=DBGP
eval "$(rbenv init -)"

# For Tmux PowerLine
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
