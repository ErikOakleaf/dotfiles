#setup zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -U compinit && compinit

# Keybindings
bindkey -v

# Prompt Configuration
PROMPT="%~: "

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

#export colors
eval "$(dircolors -b)"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias ls='ls --color'

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"


# --- FZF Keybinding Customization ---
# unbind defaults
bindkey -r '^R'
bindkey -r '^T'

bindkey '^R' fzf-file-widget
bindkey '^T' fzf-history-widget

# Cursor shape for different vi modes for tmux
if [[ -n $TMUX ]]; then
    # In tmux
    zle-keymap-select() {
        if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
            printf '\033[1 q'  # block cursor
        elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
            printf '\033[5 q'  # beam cursor
        fi
    }
    zle -N zle-keymap-select
    
    # Initialize cursor on startup
    printf '\033[5 q'
    
    # Reset cursor on exit
    trap 'printf "\033[1 q"' EXIT
fi

# Reset cursor when returning from programs tmux
precmd() {
    if [[ -n $TMUX ]] && [[ $ZLE_STATE == *insert* || -z $ZLE_STATE ]]; then
        printf '\033[5 q'  # beam cursor
    fi
}

# Also reset when changing directories or after commands tmux
chpwd() {
    if [[ -n $TMUX ]]; then
        printf '\033[5 q'  # beam cursor
    fi
}
