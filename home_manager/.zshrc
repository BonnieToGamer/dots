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

eval $(thefuck --alias)

export ROCM_PATH=/opt/rocm
export HSA_OVERRIDE_GFX_VERSION=11.0.0
export PATH=/opt/rocm/bin:$PATH
export LD_LIBRARY_PATH=/opt/rocm/lib:$LD_LIBRARY_PATH

fastfetch

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/filip/.lmstudio/bin"
# End of LM Studio CLI section

export _JAVA_AWT_WM_NONREPARENTING=1
export CHROME_EXECUTABLE=chromium
export ANDROID_SDK_ROOT=/home/filip/Android/Sdk
export ANDROID_HOME=/home/filip/Android/Sdk
export PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$PATH:$HOME/flutter/bin
export PATH=$PATH:$HOME/.pub-cache/bin

alias vps='ssh 217.160.224.13'
