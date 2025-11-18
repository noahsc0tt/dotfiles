export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix'

export FZF_DEFAULT_OPTS=""
export FZF_DEFAULT_OPTS="--color --wrap --multi \
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
    bat --style=rule,snip {};
fi
'"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
