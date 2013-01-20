autoload -U compinit
compinit

PROMPT="%n%% "
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt auto_cd
setopt auto_pushd
setopt correct

autoload zed

# User specific environment and startup programs
PATH=$PATH:$HOME/.bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/sbin
# LD_LIBRARY_PATH=/usr/lib64/mysql:/usr/local/lib
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

export LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export PATH

alias r=rails
alias ls="ls -G"

eval "$(rbenv init -)"

# 大文字小文字を区別しない補完設定
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
