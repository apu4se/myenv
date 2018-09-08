# ==============================
# General settings
# ==============================
setopt correct

# ==============================
# Exports
# ==============================
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export EDITOR=vim
export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
export LANG=en_US.UTF-8
export LANGUAGE=en
export SCREENDIR=$HOME/.screen
export PROMPT=$'\n%F{red}[%w (%T)]%F{white} %F{green}%~%F{white}\n%F{cyan}❯❯❯%F{white} '
export TERM=xterm-256color

# ==============================
# Completion
# ==============================
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:options' description 'yes'

# ==============================
# Key bindings
# ==============================
bindkey -v

# ==============================
# Aliases
# ==============================
alias ls='ls -F --color'
alias ll='ls -l -h'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias vi='vim'
alias less='less -NM'
alias ..='cd ../'
alias ...='cd ../../'
alias open="cmd.exe /c start"

# ==============================
# Pyenv settings
# ==============================
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ==============================
# Load Message
# ==============================
echo "~/.zsh loaded"

