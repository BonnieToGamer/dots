# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clear='tput reset'
PROMPT='%F{#a7c080}[%n@%m %1~]%# %F{#d3c6aa}'

eval "$(zoxide init zsh)"

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
export PATH="$PATH:/home/filip/.local/bin"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# pnpm
export PNPM_HOME="/home/filip/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

. "$HOME/.cargo/env"

fastfetch
