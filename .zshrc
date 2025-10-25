 # Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
export VISUAL=nvim

export MANCOLOR
export MANPAGER="less -sR"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(ruby -e 'puts Gem.bindir'):$PATH"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
    git
    fzf-tab
    web-search
    copybuffer
    zsh-autosuggestions
    fast-syntax-highlighting
    history-substring-search
    alias-finder
    dirhistory
    gitfast
    gitignore
    copypath
    copyfile
    last-working-dir
    command-not-found
    sudo
    zsh-vi-mode
)

#colorize
#safe-paste

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups


zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:*:*' fzf "--color --wrap --multi \
--bind 'focus:transform-header:file --brief {}' --highlight-line --info=inline-right --ansi --layout=reverse --border=none --preview-window noborder \
--bind 'alt-k:preview-up,\
alt-j:preview-down,\
alt-u:preview-half-page-up,\
alt-d:preview-half-page-down,\
alt-up:preview-top,\
alt-down:preview-bottom,\
alt-enter:become(nvim {+})' \
--preview '
if [[ -d {} ]]; then
    lsd --color=always --group-directories-first -1 --literal --no-symlink {};
else
    bat {};
fi
'"


# Remove duplicate entries in $fpath, preserving order
typeset -U fpath

zstyle ':completion:*' rehash false
autoload -Uz compinit
compinit -C # Cache omz setup stuff

autoload -U colors && colors

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

flip() {
  eval "$(thefuck --alias flip)"
  flip "$@"
}

eval "$(/opt/homebrew/bin/brew shellenv)"

#autoload -U promptinit &&promtinit
#prompt fade red


export NODE_PATH=$NODE_PATH:$(npm root -g)

export PATH=$PATH:/usr/local/go
export PATH=$PATH:/Users/nscott/.cargo/bin

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export COLORTERM=truecolor
export TERM=xterm-256color

# export JAVA_HOME="/opt/homebrew/opt/openjdk"
# export PATH="$JAVA_HOME/bin:$PATH"
