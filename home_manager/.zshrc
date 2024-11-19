# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT='%F{#a7c080}[%n@%m %1~]%# %F{#d3c6aa}'

eval "$(zoxide init zsh)"

# auto start ssh-agent
if [ -S ~/.ssh/socket ]; then
    eval $(ssh-agent)
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/socket
fi
export SSH_AUTH_SOCK=~/.ssh/socket

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

bindkey "^[[H"    beginning-of-line # Home
bindkey "^[[F"    end-of-line       # End
bindkey "^[[3~"   delete-char       # Del
bindkey "^[[1;5D" backward-word     # Ctrl + Left arrow
bindkey "^[[1;5C" forward-word      # Ctrl + Right arrow
bindkey -s '\e[2~' ''               # Insert

export PATH="$PATH:/home/filip/.dotnet/tools"
