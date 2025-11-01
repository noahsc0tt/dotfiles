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
