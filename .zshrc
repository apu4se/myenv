# ==============================
# Autoloadings
# ==============================
autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit -u
autoload -Uz url-quote-magic
autoload -Uz vcs_info

# ==============================
# General settings
# ==============================
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history
setopt hist_reduce_blanks
setopt hist_verify
setopt ignore_eof
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt prompt_subst
setopt pushd_ignore_dups
setopt rm_star_wait
setopt share_history
setopt transient_rprompt

# ==============================
# Exports
# ==============================
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export EDITOR=vim
export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
export LANG=en_US.UTF-8
export LANGUAGE=en
export SCREENDIR=$HOME/.screen
export PROMPT=$'\n%F{red}(%T)[%n@%m]%F{white} %F{green}%~%F{white}\n%F{cyan}i>>>%F{white} '
export TERM=xterm-256color
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
export PATH=$HOME/local/bin:$PATH

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
bindkey -e
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# ==============================
# Aliases
# ==============================
alias c='cd'
alias po='popd'
alias pu='pushd'
alias ls='ls -F --color'
alias l='ls -A'
alias ll='ls -l -h'
alias la='ll -A'
alias rm='rm -i'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias vi='vim'
alias less='less -NM'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias pvenv='source pvenv'

# ==============================
# WSL settings
# ==============================
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    export PROMPT=$'\n%F{red}[%w (%T)]%F{white} %F{green}%~%F{white}\n%F{cyan}>>>%F{white} '
    alias open="cmd.exe /c start"
    alias dotnet="cmd.exe /c dotnet"
    alias remoted='(cd /mnt/c/Windows/System32/ && open mstsc.exe)'
    vscode(){
        /mnt/c/Users/admin/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe $1 &
    }
    alias vsc="vscode"

    vs(){
        "/mnt/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/IDE/devenv.exe" $1 &
    }

    rider(){
        "/mnt/c/Program Files/JetBrains/JetBrains Rider 2018.3.4/bin/rider64.exe" $1 &
    }
    alias ri="rider"

    if [ -f "./.venv/bin/activate" ]
    then
    . .venv/bin/activate
    elif [ -f "./venv/bin/activate" ]
    then
    . venv/bin/activate
    elif [ -f "$HOME/.mygvenv/bin/activate" ]
    then
    . $HOME/.mygvenv/bin/activate
    fi
fi

# ==============================
# Load Message
# ==============================
# cd $HOME
echo "~/.zshrc loaded"

