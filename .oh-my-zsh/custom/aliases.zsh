alias rd="rm -rf"
alias srd="sudo rm -rf"
# alias del="trash"
# alias rms="trash"
# alias rmt="trash"
alias cdtrash="cd /Users/nscott/Library/Mobile\ Documents/.Trash"

alias config="NO_AUTOSESSION=1 nvim ~/.zshrc"
alias con="NO_AUTOSESSION=1 nvim ~/.zshrc"
alias aliases='NO_AUTOSESSION=1 nvim $ZSH_CUSTOM/aliases.zsh'
alias al='NO_AUTOSESSION=1 nvim $ZSH_CUSTOM/aliases.zsh'
alias keybinds='NO_AUTOSESSION=1 nvim $ZSH_CUSTOM/keybinds.zsh'

alias reload="exec zsh"
alias rld="exec zsh"

alias uni="z ~/UCL-OneDrive/University/second-year"

alias py="python"
alias ipy="ipython -i"

alias ts="ts-node"

alias rg="rga"
alias frg="rga -F"
alias erg="rga -P"
alias rgnc="rga --color=never"
alias rg.="rga -d 1"
function lg() {
	RG_PREFIX="rga --files-with-matches"
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
    fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
      --phony -q "$1" \
      --bind "change:reload:$RG_PREFIX {q}" \
      --preview-window="70%:wrap"
}


alias ga="git add"
alias gA="git add -A"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gcam="git add -A && git commit -m"
alias gch="git checkout"
alias gl="git log --oneline --graph --decorate --show-signature"
alias glv="git log --graph --decorate --show-signature"
alias gpsu="git push --set-upstream origin $(git_current_branch)"
alias gpl="git pull"
alias grm="git rm --cached"
alias grt="git reset"
alias grts="git reset --soft"
alias grth="git reset --hard"
alias grtk="git reset --keep"
alias gus="git restore --staged"
alias gusa="git restore --staged ."
alias gr='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gst="git stash"
function gs() {
  local root
  root=$(git rev-parse --show-toplevel)
  git -C "$root" status -sb --renames --find-renames
}
function gsv() {
  local root
  root=$(git rev-parse --show-toplevel)
  git -C "$root" status
}
alias gsw="git switch"
alias gd="git diff"
alias grmt="git remote add origin"

alias glf="forgit::log"
alias gsf="forgit::show"
alias gbdf="forgit::branch::delete"
alias gstf="forgit::stash::show"
alias grsf="forgit::checkout::file"
alias gcf="forgit::checkout::commit"
alias grtf="forgit::checkout::commit"
alias gcln="forgit::clean"
alias gcpf="forgit::cherry::pick::from::branch"
alias grbf="forgit::rebase"
alias grlf="forgit::reflog"
alias gblf="forgit::blame"

alias gop="git open"
alias gstats="git quick-stats"

alias grp="gita"

function fzg() {
  local root file
  root=$(git rev-parse --show-toplevel)
  file=$(
    git -C "$root" ls-files \
      | fzf --preview "bat --style=plain --color=always {}"
  )
  [ -n "$file" ] && echo "$root/$file"
}

# function gswf() {
#   local branch
#   branch=$(
#     git branch --all \
#       | grep -v HEAD \
#       | sed 's/^[* ]*//' \
#       | sed 's#remotes/[^/]*/##' \
#       | sort -u \
#       | fzf --preview 'git log --oneline --graph --decorate --show-signature --color=always {}'
#   )
#   [ -n "$branch" ] && git switch "$branch"
# }
alias gswf="forgit::checkout::branch"

# function grmf() {
#   local root file
#   root=$(git rev-parse --show-toplevel)
#   file=$(
#     git -C "$root" ls-files \
#       | fzf --preview "bat {}"
#   )
#   [ -n "$file" ] && git -C "$root" rm $file
# }

function grmf() {
  local root file
  root=$(git rev-parse --show-toplevel)
  file=$(
    git -C "$root" ls-files \
      | fzf --preview "bat {}"
  )
  [ -n "$file" ] && git -C "$root" rm --cached $file
}

# function gaf() {
#   local root files
#   root=$(git rev-parse --show-toplevel)
#   files=$(
#     git -C "$root" ls-files -m -o --exclude-standard \
#       | fzf -m --preview "git -C '$root' diff --color=always -- {} | delta"
#   )
#   [ -n "$files" ] && git -C "$root" add $files
# }
alias gaf="forgit::add"

function gdf() {
  local root file
  root=$(git rev-parse --show-toplevel)
  file=$(
    git -C "$root" diff --name-only \
      | fzf --preview "git -C '$root' diff --color=always -- {} | delta"
  )
  [ -n "$file" ] && git -C "$root" diff $file
}

# function gusf() {
#   local root files
#   root=$(git rev-parse --show-toplevel)
#   files=$(
#     git -C "$root" diff --cached --name-only \
#       | fzf -m --preview "git -C '$root' diff --cached --color=always -- {} | delta"
#   )
#   [ -n "$files" ] && git -C "$root" restore --staged $files
# }
alias gusf="forgit::reset::head"

alias ttytle="printf \"\033]0;%s\007\""

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

unalias ls
function ls() {
  lsd --color=always --group-directories-first -1 --literal --no-symlink "$@" | bat
}

function lsf() {
  lsd --color=always --group-directories-first -1 --literal --no-symlink "$@" | fzf
}

function lst() {
  lsd --tree --color=always --group-directories-first --literal --no-symlink "$@" | less -R | bat
}

function lsc() {
  lsd --color=always --group-directories-first --literal --no-symlink "$@" | bat
}

unalias lsa
function lsa() {
  lsd -A --color=always --group-directories-first -1 --literal --no-symlink "$@" | bat
}

function lsaf() {
  lsd -A --color=always --group-directories-first --literal --no-symlink "$@" | bat
}

function lsat() {
  lsd -A --tree --color=always --group-directories-first --literal --no-symlink "$@" | less -R | bat
}

function lsi() {
  lsd -l --date=relative --color=always --group-directories-first -1 \
      --literal --no-symlink --blocks name,date,size,permission --header \
      "$@" | bat
}

function lsai() {
  lsd -A -l --date=relative --color=always --group-directories-first -1 \
       --literal --no-symlink --blocks name,date,size,permission --header \
       "$@" | bat
}

function lsaif() {
  lsd -A -l --date=relative --color=always --group-directories-first \
       --literal --no-symlink --blocks name,date,size,permission --header \
       "$@" | bat
}

function lsg() {
	 if [[ $# -ge 2 && -d $1 ]] ; then
	 	ls "$1" | command rg -i --color=auto "${@:2}"
	 else
	 	ls . | command rg -i --color=auto "$@"
	 fi	 
}

function lsag() {
	 if [[ $# -ge 2 && -d $1 ]] ; then
	 	ls -a "$1" | command rg -i --color=auto "${@:2}"
	 else
	 	ls -a . | command rg -i --color=auto "$@"
	 fi	 
}

alias ghcp="gh copilot"

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

# alias tkl="ls $HOME/.config/taskell/lists/"

function tk() {
  local dir="$HOME/.scratch/taskell/"
  if [ $# -eq 0 ]; then
    local file

    file=$(ls -1 "$dir" 2>/dev/null | fzf --preview="bat $dir/{}") || return

    taskell "$dir/$file"
  else
    taskell "${dir}${*}.md"
  fi
} 
# function tk() {
#     local dir="$HOME/.config/taskell/lists"
#     local file
#
#     file=$(ls -1 "$dir" 2>/dev/null | fzf --preview="bat $dir/{}") || return
#
#     taskell "$dir/$file"
# }


alias cpd="cp -R"
alias cph="copypath"
alias cpf="copyfile"
function cpy() {
  tee >(pbcopy)
}
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

alias gz="lazygit"

alias dirhistory="dirs -v"
function dir () {
	if [[ -n $1 ]] then
		dirs "$@"
	else
		dirs -v | head -n 10
	fi
}

alias v="vim"
alias n="nvim"
alias nv="NO_AUTOSESSION=1 nvim"
# alias nd='NO_AUTOSESSION=1 nvim "+lua Snacks.dashboard()"'
alias nt="NO_AUTOSESSION=1 nvim -c 'terminal'"
alias nf="NO_AUTOSESSION=1 nvim +Telescope\\ find_files"
alias ng="NO_AUTOSESSION=1 nvim +Telescope\\ git_files"
alias no="NO_AUTOSESSION=1 nvim +Telescope\\ oldfiles"
alias ns="NO_AUTOSESSION=1 nvim +Telescope\\ live_grep"
alias nvd="neohub --opts --frame buttonless --title-hidden"


alias fzn="fzf --preview-window hidden"
alias fv="fpp"

function c() {
  cd "$(fd -t d -L | fzf)" || return
}

function dh() {
  cd "$(dirs -pl | fzf --preview 'lsd --color=always --group-directories-first -1 --literal --no-symlink {} || ls --color=always {}')" || return
}

# function fa() {
#   alias | fzf --preview-window hidden
# }
alias fa="tv alias"

function f() {
  fd -t f -L | fzf
}

function d() {
  fd -t d -L | fzf --preview 'lsd --color=always --group-directories-first -1 --literal --no-symlink {}'
}

function fm() {
  man -k . |
  sed -E 's/ *\([^)]+\)//' | \
  awk -F' - ' 'BEGIN{OFS="\t"} {print $1, ($2 ? $2 : "")}' | \
  fzf --delimiter=$'\t' --with-nth=1 --preview 'man {1}' | \
  cut -f1 | xargs -r man
}
# alias fm="tv man-pages"

# function ft() {
#   local sel
#   sel=$(tldr -l | fzf --preview 'tldr {}') || return
#   tldr -C "$sel" | bat
# }
alias ft="tv tldr"

alias fe="tv env"
alias fr="tv git-repos"

function fb() {
  brew search "" | fzf --preview 'brew info {}' | xargs brew install
}

function h() {
  atuin search | tac | awk '{for(i=3;i<NF;i++) printf "%s%s", $i, (i==NF-1?ORS:OFS)}' | fzf --preview-window hidden
}

alias osa="osascript -e"

function lrg() {
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY="${*:-}"
fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}'
}

alias quit="kill"
alias k="fkill"

alias np="nvimpager"

alias cl="printf '\033[H\033[J'"
alias tp="tput reset"

alias oc="opencode"
alias cpl="copilot"

alias dot="cd ~/dotfiles"
alias restow='(cd ~/dotfiles && stow -R .)'

function bat() {
  if [ -t 0 ]; then
    # stdin is not connected, arguments are files
    command bat --style=header-filename,rule,snip "$@"
  else
    # stdin is being piped in
    command bat --style=rule,snip
  fi
}
function batn() {
  if [ -t 0 ]; then
    # stdin is not connected, arguments are files
    command bat --style=header-filename,rule,snip,numbers "$@"
  else
    # stdin is being piped in
    command bat --style=rule,snip,numbers
  fi
}
alias b="bat"
alias bn="batn"

function lb() {
  if [ -t 0 ]; then
    # stdin is not connected, arguments are files
    bat --style=header-filename,rule,snip "$@" | lc -f | bat --style=header-filename,rule,snip
  else
    # stdin is being piped in
     bat --style=rule,snip "$@" | lc -f | bat --style=rule,snip
  fi
}

function lbn() {
  if [ -t 0 ]; then
    #stdin is not connected, arguments are files
    bat --style=header-filename,rule,snip,numbers "$@" | lc -f | bat --style=header-filename,rule,snip,numbers
  else
    # stdin is being piped in
     bat "$@" | lc -f | bat --style=rule,snip,numbers
  fi
}
function lh() {
  "$*" -h | lc -f | bat --style=rule,snip
}

alias disk="dust -rC"
alias diski="ncdu"

alias bonsai="cbonsai -S --life=60 -w 1"
alias matrix="cmatrix -b"
alias rain="tarts matrix"
alias glitch="cmatrix -b -c"
alias pipes="pipes.sh"
alias aqua="asciiquarium"
alias stars="gh screensaver -s starfield -- --speed 10"
alias sound="cava"
alias space="astroterm -c -u -m -s 1001 -f 60 --city=London"
alias tower="arttime -t '\"The name of the LORD is a strong tower; the righteous run to it and are safe.\" - Proverbs 18:10' -a castle3 --ac 4 --tc 2 --nolearn"
alias asciiart="arttime -t '\"The name of the LORD is a strong tower; the righteous run to it and are safe.\" - Proverbs 18:10' --random --ac 4 --tc 2 --nolearn"
alias fireworks="gh screensaver -s fireworks"
alias life='go-life'
alias fire="tarts fire"
alias blank="tarts blank"
alias donut="tarts donut"
alias bubbles="ttysvr -b 24283b bubbles"
alias dvd="ttysvr -b 24283b logo dvd"
alias clock="termsaver clock" 
alias starwars="termsaver starwars"
alias ss="~/dev/github/noahsc0tt/random-tty-screensaver/random-screensaver.sh"

function typeout() {
  termsaver programmer -p "$*"
}

function message() {
  gh screensaver -smarquee -- --message="$*"
}

alias text="termsaver randtxt -w '\"The name of the LORD is a strong tower; the righteous run to it and are safe.\" - Proverbs 18:10'"

function lfiglet() {
  figlet "$*" | lc -f
}

alias cow="cowsay -r"
alias cowfiglet="figlet | cowsay -r -n"

alias send="croc"

alias jr="jrnl"
alias jre="jrnl --edit"
alias jrt="jrnl -on today --format short | tac"
alias jry="jrnl -on yesterday --format short | tac"
alias jrl="jrnl -n 100000 --format short | tac | bat"
alias jrf="jrnl -n 100000 --format short | tac | fzf --preview-window hidden"
function jrg() {
  jrnl -n 100000 --format short | rg "@$1"
}

alias weather="clear && curl wttr.in/London\?F"
alias weathernow="curl wttr.in/London\?FQ0"
alias weathertoday="curl wttr.in/London\?F1"

alias system="fastfetch"

alias kl="kalker"

alias rbk="rubiks -clsti"

alias scratch="cd ~/.scratch/scratch.nvim/"

function feed() {
  print -z "$(cat $@)"
}

alias pdf="hygg"
alias pdfview="fancy-cat"

alias snake="sssnake -m normal"
alias sssnake="sssnake -m screensaver"

alias ig="instagram chat start"
alias whatsapp="nchat"

function typing() {
  if [ $# -eq 0 ]; then
    ttyper
  else
    typtea start --lang "$@"
  fi
}

alias yt="gophertube"

alias web="cha"
alias cal="calcure"

alias paint="textual-paint"

alias markdown="frogmouth"

function verse() {
  verses "$*" --only-verses
}

alias ze="zoxide edit"

alias gi="add-gitignore"

function idea() {
  if [[ $# -eq 0 ]]; then
    eureka 2>/dev/null
  else
    eureka "$@"
  fi
}

alias tm="~/dev/github/noahsc0tt/ttyme-tracker/ttyme-tracker.sh"

alias lp="/Users/nscott/dev/github/noahsc0tt/fuzzpass/fuzzpass.sh"

alias '$'=''

alias mdtree="gtree"

alias math="mdlt"

alias cheat="navi"

alias count="scc"

alias fu="find-up --all"

function pretty() {
  tte --input-file "$@" random_effect
}

alias pomo="arttime -k timer.pomodoro4etc"

alias clean="rm ~/.zcompdump* && source ~/.zshrc && exec zsh"

alias ddg="ddgr"

function how() {
  how2 "$@" 2>/dev/null
}

alias gls="k -h"

alias oil="edir -t -i -a -g -X"

alias bar="spark"

alias clean-rename="slugify"
alias rnm="repren"

function wh() {
  whence "$@"
  which "$@"
  where "$@"
}

alias overflow="rebound"

alias ping="prettyping"

alias range="rng"

alias wifi="wifi-wand"

alias json="jo"

alias convert="bitwise"

alias sudoku="nudoku"

alias o="ok 1"

alias highlight="h"
