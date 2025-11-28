export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix'

read -r -d '' FZF_PREVIEW <<'EOF' || true
    if [[ -d {} ]]; then
        lsd --color=always --group-directories-first -1 --literal --no-symlink {}
    elif [[ -f {} ]]; then
        if [[ {} == *.md || {} == *.typ ]]; then
            glow {}
        elif [[ {} == *.png || {} == *.jpg || {} == *.JPG || {} == *.JPEG || {} == *.pdf || {} == *.jpeg || {} == *.webp || {} == *.gif || {} == *.bmp ]]; then
            cols=${FZF_PREVIEW_COLUMNS:-80}
            rows=${FZF_PREVIEW_LINES:-20}
            timg -p k -W -g "${cols}x${rows}" --clear {}
        else
            bat --style=rule,snip {}
        fi
    fi
EOF

export FZF_DEFAULT_OPTS="--color --wrap --multi \
    --bind 'focus:transform-header:file --brief {}' \
    --highlight-line --info=inline-right --ansi --layout=reverse --border=none \
    --preview-window noborder \
    --bind 'ctrl-p:preview-up,ctrl-n:preview-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,ctrl-up:preview-top,ctrl-down:preview-bottom,ctrl-space:become(nvim {+})' \
    --preview '$FZF_PREVIEW'"
