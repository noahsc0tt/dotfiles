export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix'

export FZF_DEFAULT_OPTS="--color --wrap --multi \
    --bind 'focus:transform-header:file --brief {}' \
    --highlight-line --info=inline-right --ansi --layout=reverse --border=none \
    --preview-window noborder \
    --bind 'ctrl-p:preview-up,ctrl-n:preview-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-up:preview-top,ctrl-down:preview-bottom,ctrl-space:become(nvim {+})' \
    --preview-window=right:60%,wrap,info \
    --preview '~/.fzf-preview.sh {}'"
