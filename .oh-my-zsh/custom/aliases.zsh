alias cdfzf='cd "$(fzf --walker dir,follow,hidden --no-preview)"'
alias clfzf='print -z -- "$(fzf)"'
alias hfzf='print -z -- "$(fc -lnr 1 | fzf --no-preview)"'
alias dfzf="fzf --walker dir,follow,hidden"
alias ffzf="fzf --walker file,follow,hidden"

alias rd="rm -rf"
alias rd="rm -rf"
alias srd="sudo rm -rf"
# alias del="trash"
# alias rms="trash"
# alias rmt="trash"
alias cdtrash="cd /Users/nscott/Library/Mobile\ Documents/.Trash"

alias calc="kalker"

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
alias rgnr="rg -d 1"
alias frgnr="rg -F -d 1"

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
alias gs="git status"
alias gsw="git switch"
alias gd="git diff | delta"

function ignore_local() {
  if [ -z "$1" ]; then
    echo "Usage: ignore_local <path>"
    return 1
  fi
  echo "$1" >> .git/info/exclude
  echo "Added '$1' to .git/info/exclude"
}
alias gig="ignore_local"

alias rename="printf \"\033]0;%s\007\""

alias speedtest="networkQuality"

alias updatelocatedb="sudo /usr/libexec/locate.updatedb"

function zn() {
  if [ $# -eq 0 ]; then
    zellij -l welcome
  else
    zellij -s "$1"
  fi
}
alias zj="zellij"
alias za="zellij a"
alias zf="zellij a"
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

alias nl="nightlight"

# just use take
function mcd() {
  mkdir -p -- "$@" && cd -- "${@[-1]}"
}


alias kal="sudo launchctl load /Library/LaunchDaemons/com.example.kanata.plist"
alias kau="sudo launchctl unload /Library/LaunchDaemons/com.example.kanata.plist"
alias kac="/usr/local/bin/kanata -c /Users/nscott/.config/kanata/kanata.kbd --check"

alias gy="ghostty"
alias gyc="ghostty +show-config --docs --default"

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
alias nt="nvim +Telescope"
alias nf="nvim +Telescope\\ find_files"
alias ng="nvim +Telescope\\ git_files"
alias no="nvim +Telescope\\ oldfiles"
alias ns="nvim +Telescope\\ live_grep"
alias nm="nvim +Telescope\\ man_pages"

function c() {
  cd "$(fd -t d | fzf)" || return
}

function dh() {
  cd "$(dirs -pl | fzf --preview 'lsd --color=always --group-directories-first -1 --literal --no-symlink {} || ls --color=always {}')" || return
}

function ff() {
  fd -t f | fzf --preview 'bat {}'
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

function fb() {
  bindkey | fzf --preview-window hidden
}

 function fh() {
   atuin search | tac | awk '{for(i=3;i<NF;i++) printf "%s%s", $i, (i==NF-1?ORS:OFS)}' | fzf --preview-window hidden
 }

alias clfzf='print -z -- "$(fzf)"'
alias npfzf='fzf --preview-window hidden'
alias fzfnp='fzf --preview-window hidden'


alias osa="osascript -e"

unalias gr
function gr() {
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY="${*:-}"
fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --bind 'enter:become(nvim {1} +{2})'
}

alias quit="kill"
alias kill="kill -9"

alias np="nvimpager"

alias cl="printf '\033[H\033[J'"
alias tp="tput reset"

alias oc="opencode"
alias cpl="copilot"

alias tc="typst compile"

alias dot="cd ~/dotfiles"
alias restow='(cd ~/dotfiles && stow -R .)'

alias batn="bat --style=header-filename,rule,snip,numbers"

alias lc="lolcat -f"
alias lbat="lolcat -f | bat"
alias lbatn="lolcat -f | bat --style=header-filename,rule,snip,numbers "
function lbatf() {
  lolcat -f "$*" | bat
}
function lbatnf() {
  lolcat -f "$*" | bat --style=header-filename,rule,snip,numbers
}
function lh() {
  "$*" -h | lolcat -f | bat
}
unalias l
function l() {
  "$*" | lolcat -f
}

alias disk="dust -rC"
alias diski="ncdu"

alias bonsai="cbonsai -S --life=60 -w 1"
alias matrix="cmatrix -b"
alias glitch="cmatrix -b -c"
alias pipes="pipes.sh"
alias aqua="asciiquarium"
alias ghss="gh screensaver"
# tarts, ttysvr, 

alias text="figlet"
function ltext() {
  figlet "$*" | lolcat -f
}

alias send="croc"

alias jr="jrnl"
alias jre="jrnl --edit"
alias jrt="jrnl -on today --format short | tac"
alias jry="jrnl -on yesterday --format short | tac"
alias jrl="jrnl -n 100000 --format short | tac | bat"

alias weather="curl wttr.in/\?F1"
alias weathera="curl wttr.in/\?F"

alias system="fastfetch"
