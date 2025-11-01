alias rd="rm -rf"
alias srd="sudo rm -rf"
# alias del="trash"
# alias rms="trash"
# alias rmt="trash"
alias cdtrash="cd /Users/nscott/Library/Mobile\ Documents/.Trash"

alias config="nvim ~/.zshrc"
alias con="nvim ~/.zshrc"
alias aliases="nvim $ZSH_CUSTOM/aliases.zsh"
alias al="nvim $ZSH_CUSTOM/aliases.zsh"
alias keybinds="nvim $ZSH_CUSTOM/keybinds.zsh"

alias reload="exec zsh"
alias rld="exec zsh"

alias uni="z ~/UCL-OneDrive/University/second-year"

alias py="python"
alias ipy="ipython -i"

alias ts="ts-node"

alias frg="rg -F"
alias erg="rg -P"
alias rgnc="rg --color=never"
alias rgnr="rg -d 1"

alias ga="git add"
alias gA="git add -A"
alias gca="git commit --amend -m"
alias gcm="git commit -m"
alias gcam="git add -A && git commit -m"
alias gch="git checkout"
alias gl="git log --oneline --graph --decorate"
alias gpsh="git push"
alias gpl="git pull"
alias grm="git rm --cached"
alias gus="git restore --staged"
alias gusa="git restore --staged ."
function gs() {
  local root
  root=$(git rev-parse --show-toplevel)
  git -C "$root" status
}
alias gsw="git switch"
alias gd="git diff | delta"

function fzg() {
  local root file
  root=$(git rev-parse --show-toplevel)
  file=$(
    git -C "$root" ls-files \
      | fzf --preview "bat --style=plain --color=always {}"
  )
  [ -n "$file" ] && echo "$root/$file"
}

function gswf() {
  local branch
  branch=$(
    git branch --all \
      | grep -v HEAD \
      | sed 's/^[* ]*//' \
      | sed 's#remotes/[^/]*/##' \
      | sort -u \
      | fzf --preview-window hidden
  )
  [ -n "$branch" ] && git switch "$branch"
}

function grmf() {
  local root file
  root=$(git rev-parse --show-toplevel)
  file=$(
    git -C "$root" ls-files \
      | fzf --preview "bat {}"
  )
  [ -n "$file" ] && git -C "$root" rm $file
}

function gaf() {
  local root files
  root=$(git rev-parse --show-toplevel)
  files=$(
    git -C "$root" ls-files -m \
      | fzf -m --preview "git -C '$root' diff --color=always -- {} | delta"
  )
  [ -n "$files" ] && git -C "$root" add $files
}

function gdf() {
  local root file
  root=$(git rev-parse --show-toplevel)
  file=$(
    git -C "$root" diff --name-only \
      | fzf --preview "git -C '$root' diff --color=always -- {} | delta"
  )
  [ -n "$file" ] && git -C "$root" diff $file | delta
}

function gusf() {
  local root files
  root=$(git rev-parse --show-toplevel)
  files=$(
    git -C "$root" diff --cached --name-only \
      | fzf -m --preview "git -C '$root' diff --cached --color=always -- {} | delta"
  )
  [ -n "$files" ] && git -C "$root" restore --staged $files
}

alias rename="printf \"\033]0;%s\007\""

alias speedtest="networkQuality"

function zjn() {
  if [ $# -eq 0 ]; then
    zellij -l welcome
  else
    zellij -s "$1"
  fi
}
alias zj="zellij"
alias zja="zellij a"
alias zjl="zellij ls"
alias zjk="zellij k"
alias zjd="zellij d"
alias zjc="zellij setup --check"

alias exe="chmod +x"
alias hide="chflags hidden"
alias unhide="chflags nohidden"

alias ls="lsd --color=always --group-directories-first -1 --literal --no-symlink"
alias lst="lsd --tree --color=always --group-directories-first --literal --no-symlink | less -R"
alias lsc="lsd --color=always --group-directories-first --literal --no-symlink"
alias lsa="lsd -A --color=always --group-directories-first -1 --literal --no-symlink | bat"
alias lsac="lsd -A --color=always --group-directories-first --literal --no-symlink | bat"
alias lsat="lsd -A --tree --color=always --group-directories-first --literal --no-symlink | less -R"
alias lsi="lsd -l --date=relative --color=always --group-directories-first -1 --literal --no-symlink --blocks name,date,size,permission --header"
alias lsai="lsd -A -l --date=relative --color=always --group-directories-first -1 --literal --no-symlink --blocks name,date,size,permission --header | bat"
alias lsaic="lsd -A -l --date=relative --color=always --group-directories-first --literal --no-symlink --blocks name,date,size,permission --header | bat"

lsg() {
	 if [[ $# -ge 2 && -d $1 ]] ; then
	 	ls "$1" | command rg -i --color=auto "${@:2}"
	 else
	 	ls . | command rg -i --color=auto "$@"
	 fi	 
}

println() {
	sed -n $1p $2
}

alias ghcp="gh copilot"

count() {
  "$@" | wc
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias kal="sudo launchctl load /Library/LaunchDaemons/com.example.kanata.plist"
alias kau="sudo launchctl unload /Library/LaunchDaemons/com.example.kanata.plist"
alias kac="/usr/local/bin/kanata -c /Users/nscott/.config/kanata/kanata.kbd --check"

alias gy="ghostty"
alias gydoc="ghostty +show-config --docs --default"

alias tkl="ls $HOME/.config/taskell/lists/"
function tk() {
  if [ $# -eq 0 ]; then
    taskell
  else
    taskell "$HOME/.config/taskell/lists/${*}.md"
  fi
} 


alias cpd="cp -R"
alias cph="copypath"
alias cpf="copyfile"
alias cpy="pbcopy"
alias pst="pbpaste"

alias ip="ipconfig getifaddr en0"

function raw() {
    if [ $# -ne 1 ]; then
        echo "Usage: gh_raw <github_file_url>"
        return 1
    fi

    local url="$1"

    # Convert normal GitHub URL to raw URL if needed
    if [[ "$url" =~ github.com ]]; then
        url="${url/github.com/raw.githubusercontent.com}"
        url="${url/blob\//}"
    fi

    # Extract filename
    local filename
    filename=$(basename "$url")

    # Download the file
    curl -L -o "$filename" "$url"
    echo "Downloaded $filename"
}


alias sshturn="sudo systemsetup -setremotelogin"
alias sshcheck="sudo systemsetup -getremotelogin"
alias hn="scutil --get LocalHostName"

alias meth="sudo pmset -a disablesleep 1"
alias melatonin="sudo pmset -a disablesleep 0"
alias rehab="sudo pmset -g assertions | bat"

alias lg="lazygit"

alias dirhistory="dirs -v"
function dir () {
	if [[ -n $1 ]] then
		dirs "$@"
	else
		dirs -v | head -n 10
	fi
}

alias d="web_search duckduckgo"

alias zt="zathura"

alias nv="nvim"
alias nd="nvim ."
alias nt="nvim -c 'terminal'"
alias nf="nvim +Telescope\\ find_files"
alias ng="nvim +Telescope\\ git_files"
alias no="nvim +Telescope\\ oldfiles"
alias ns="nvim +Telescope\\ live_grep"
alias nvd="neovide --frame buttonless --title-hidden"


alias fzn="fzf --preview-window hidden"

function c() {
  cd "$(fd -t d | fzf)" || return
}

function dh() {
  cd "$(dirs -pl | fzf --preview 'lsd --color=always --group-directories-first -1 --literal --no-symlink {} || ls --color=always {}')" || return
}

function fa() {
  alias | fzf --preview-window hidden
}

function ff() {
  fd -t f | fzf
}

function fdir() {
  fd -t d | fzf --preview 'lsd --color=always --group-directories-first -1 --literal --no-symlink {}'
}

function fm() {
  man -k . |
  sed -E 's/ *\([^)]+\)//' | \
  awk -F' - ' 'BEGIN{OFS="\t"} {print $1, ($2 ? $2 : "")}' | \
  fzf --delimiter=$'\t' --with-nth=1 --preview 'man {1}' | \
  cut -f1 | xargs -r man
}

function ft() {
  local sel
  sel=$(tldr -l | fzf --preview 'tldr {}') || return
  tldr -C "$sel" | bat
}

function fk() {
  bindkey | fzf --preview-window hidden
}

function fb() {
  brew search "" | fzf --preview 'brew info {}' | xargs brew install
}

function fh() {
  atuin search | tac | awk '{for(i=3;i<NF;i++) printf "%s%s", $i, (i==NF-1?ORS:OFS)}' | fzf --preview-window hidden
}

function ch() {
  atuin search | tac | awk '{for(i=3;i<NF;i++) printf "%s%s", $i, (i==NF-1?ORS:OFS)}' | fzf --preview-window hidden | pbcopy
}
alias fzcl='print -z -- "$(fzf)"'

alias osa="osascript -e"

unalias gr
function gr() {
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY="${*:-}"
fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}'
}

alias quit="kill"
alias kill="kill -9"

alias np="nvimpager"

alias cl="printf '\033[H\033[J'"
alias tp="tput reset"

alias oc="opencode"
alias cpl="copilot"

alias dot="cd ~/dotfiles"
alias restow='(cd ~/dotfiles && stow -R .)'

alias batn="bat --style=header-filename,rule,snip,numbers"

alias lc="lolcat -f"
alias lb="lolcat -f | bat"
alias lbn="lolcat -f | bat --style=header-filename,rule,snip,numbers "
function lh() {
  "$*" -h | lolcat -f | bat
}

alias disk="dust -rC"
alias diski="ncdu"

alias bonsai="cbonsai -S --life=60 -w 1"
alias matrix="cmatrix -b"
alias rain="tarts matrix"
alias glitch="cmatrix -b -c"
alias pipes="pipes.sh"
alias aqua="asciiquarium"
alias space="gh screensaver -s starfield -- --speed 10"
alias fireworks="gh screensaver -s fireworks"
alias bubbles="ttysvr -b 1a1b26 bubbles"
alias dvd="ttysvr -b 1a1b26 logo dvd"
alias fire="tarts fire"
alias blank="tarts blank"
alias donut="tarts donut"
alias clock="termsaver clock" 

alias lss="alias | rg -P '^(?!ssc|lss).*(cbonsai|cmatrix|tarts|pipes.sh|asciiquarium|screensaver|ttysvr)' | sd '=.*' ''"
alias ssc="alias | rg -P --color=never '^(?!ssc|lss).*(cbonsai|cmatrix|tarts|pipes.sh|asciiquarium|screensaver|ttysvr)'"

function typeout() {
  termsaver programmer -p "$*"
}

function message() {
  ghss -s marquee -- --message="$*"
}

alias text="figlet"
function ltext() {
  figlet "$*" | lolcat -f
}

alias cow="cowsay -r"
alias cowtext="figlet | cowsay -r -n"

alias send="croc"

alias jr="jrnl"
alias jre="jrnl --edit"
alias jrt="jrnl -on today --format short | tac"
alias jry="jrnl -on yesterday --format short | tac"
alias jrl="jrnl -n 100000 --format short | tac"
alias jrf="jrnl -n 100000 --format short | tac | fzf --preview-window hidden"
function jrtg() {
  jrnl -n 100000 --format short | rg "@$1"
}

alias weather="curl wttr.in/\?FQ0"
alias wth="curl wttr.in/\?FQ0"
alias weathert="curl wttr.in/\?F1"
alias wtht="curl wttr.in/\?F1"
alias weathera="curl wttr.in/\?F"
alias wtha="curl wttr.in/\?F"

alias system="fastfetch"
