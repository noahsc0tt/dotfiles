return {
    {
        "folke/snacks.nvim",
        enabled = true,
        priority = 1000,
        lazy = false,
        cond = not vim.g.started_by_firenvim,
        opts = {
            animate = { enabled = true },
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                    ---@type fun(cmd:string, opts:table)|nil
                    pick = nil,
                    -- Used by the `keys` section to show keymaps.
                    -- Set your custom keymaps here.
                    -- When using a function, the `items` argument are the default keymaps.
                    keys = {
                        -- { icon = "󱘟 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        {
                            icon = "󱞂 ",
                            key = "n",
                            desc = "New Note",
                            action = function()
                                require('snacks').input.input({ prompt = "Title: " }, function(value)
                                    local name = os.date("%Y-%m-%d_%H-%M-%S") .. value
                                    require("snacks").scratch.open({ name = name })
                                end)
                            end
                        },
                        {
                            icon = "󱙔 ",
                            key = "N",
                            desc = "Search Notes",
                            action = function()
                                require('snacks').picker.scratch({
                                    win = {
                                        input = {
                                            keys = {
                                                ["<C-BS>"] = { "scratch_delete", mode = { "n", "i" } },
                                                ["<C-n>"] = { "scratch_new", mode = { "n", "i" } },
                                            },
                                        },
                                    },
                                })
                            end
                        },
                        {
                            icon = " ",
                            key = "f",
                            desc = "New Scratch File",
                            action = function()
                                vim.cmd("Scratch")
                                vim.defer_fn(function()
                                    local keys = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
                                    vim.api.nvim_feedkeys(keys, "t", false)
                                end, 1)
                            end
                        },
                        { icon = "󰱽 ", key = "F", desc = "Search Scratch Files", action = ":ScratchOpen" },
                        -- { icon = "󰨽 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        -- { icon = "󰱂 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        -- { icon = " ", key = ",", desc = "Open Config File", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰑕 ", key = "o", desc = "Oil", action = ":Oil", },
                        { icon = " ", key = "g", desc = "Grug", action = ":GrugFarWithin", },
                        { icon = "󰥌 ", key = "t", desc = "Taskell", action = ":TaskellSearch", },
                        { icon = " ", key = "c", desc = "Calculator", action = ":Nvumi", },
                        { icon = "󱄌 ", key = "r", desc = "Restart LSP", action = ":LspRestart", },
                        {
                            icon = "󰒑 ",
                            key = "x",
                            desc = "Detach LSP",
                            action = function()
                                local bufnr = 0
                                local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

                                if #clients > 0 then
                                    for _, client in ipairs(clients) do
                                        client.stop()
                                    end
                                    print("LSP detached")
                                else
                                    print("No LSP attached")
                                end
                            end,
                        },
                        {
                            icon = "󰒒 ",
                            key = "i",
                            desc = "LSP Info",
                            action = function()
                                require('snacks').picker
                                    .lsp_config()
                            end,
                        },
                        { icon = " ", key = "y", desc = "Screenkey", action = ":Screenkey", },
                        {
                            icon = " ",
                            key = "s",
                            desc = "Search Sessions",
                            action = function()
                                vim.cmd("AutoSession search")
                            end
                        },
                        {
                            icon = " ",
                            key = "x",
                            desc = "Save Session",
                            action = function()
                                vim.cmd("AutoSession save")
                            end
                        },
                        {
                            icon = "󱕗 ",
                            key = "d",
                            desc = "Delete Session",
                            action = function()
                                vim.cmd("AutoSession delete")
                                vim.cmd("qa!")
                            end
                        },
                    },
                },
                sections = {
                    -- { section = "header" },
                    -- {
                    --     pane = 2,
                    --     section = "terminal",
                    --     cmd = "colorscript -e square",
                    --     height = 5,
                    --     padding = 3,
                    -- },
                    {
                        pane = 1,
                        icon = " ",
                        title = (function()
                            local p = vim.fn.system("pwd"):gsub("\n", "")
                            local t = {}
                            for i = 1, 3 do
                                t[4 - i] = vim.fs.basename(p); p = vim.fs.dirname(p)
                            end
                            return table.concat(t, "/")
                        end)(),
                        section = "terminal",
                        cmd = "lsd --tree --color=always --group-directories-first -1 --literal --no-symlink",
                        autokey = true,
                        gap = 1,
                        indent = 2,
                        padding = 1,
                        hl_current_line = false
                    },

                    { pane = 2, section = "keys", gap = 1, padding = 1, hl_current_line = false },
                    -- { pane = 1, icon = "󰪻 ", title = "Recent Working Directory Files", section = "recent_files", cwd = true, indent = 2, padding = 1, hl_current_line = false },
                    -- { pane = 1, icon = "󱋢 ", title = "Recent Global Files", section = "recent_files", indent = 2, padding = 1, hl_current_line = false },

                    --{ pane = 2, icon = "󰪻 ", title = "Projects", section = "projects", indent = 2, padding = 1, hl_current_line = false },
                    -- {
                    --     pane = 1,
                    --     icon = " ",
                    --     title = "Git Status",
                    --     section = "terminal",
                    --     enabled = function()
                    --         return require("snacks").git.get_root() ~= nil
                    --     end,
                    --     cmd = "git -C \"$(git rev-parse --show-toplevel)\" status -sb --renames --find-renames",
                    --     indent = 2,
                    --     padding = 1,
                    --     hl_current_line = false
                    -- },
                    -- { pane = 1, section = "startup" },
                },
            },
            dim = {
                scope = {
                    min_size = 5,
                    max_size = 20,
                    siblings = true,
                },
                -- animate scopes. Enabled by default for Neovim >= 0.10
                -- Works on older versions but has to trigger redraws during animation.
                animate = {
                    enabled = vim.fn.has("nvim-0.10") == 1,
                    easing = "outQuad",
                    duration = {
                        step = 20,   -- ms per step
                        total = 300, -- maximum duration
                    },
                },
                -- what buffers to dim
                filter = function(buf)
                    return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
                end,
            },
            explorer = {
                replace_netrw = false,
                trash = true,
            },
            gh = {
                keys = {
                    select  = { "<cr>", "gh_actions", desc = "Select Action" },
                    edit    = { "i", "gh_edit", desc = "Edit" },
                    comment = { "o", "gh_comment", desc = "Add Comment" },
                    close   = { "d", "gh_close", desc = "Close" },
                    reopen  = { "u", "gh_reopen", desc = "Reopen" },
                },
            },
            git = { enabled = true },
            gitbrowse = { enabled = true },
            image = { enabled = true },
            indent = {
                enabled = true,
                indent = {
                    priority = 1,
                    enabled = true,       -- enable indent guides
                    char = "│",
                    only_scope = false,   -- only show indent guides of the scope
                    only_current = false, -- only show indent guides in the current window
                    hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
                    -- can be a list of hl groups to cycle through
                    -- hl = {
                    --     "SnacksIndent1",
                    --     "SnacksIndent2",
                    --     "SnacksIndent3",
                    --     "SnacksIndent4",
                    --     "SnacksIndent5",
                    --     "SnacksIndent6",
                    --     "SnacksIndent7",
                    --     "SnacksIndent8",
                    -- },
                },
                -- animate scopes. Enabled by default for Neovim >= 0.10
                -- Works on older versions but has to trigger redraws during animation.
                --- * out: animate outwards from the cursor
                --- * up: animate upwards from the cursor
                --- * down: animate downwards from the cursor
                --- * up_down: animate up or down based on the cursor position
                animate = {
                    enabled = false,
                    style = "out",
                    easing = "linear",
                    duration = {
                        step = 20,   -- ms per step
                        total = 500, -- maximum duration
                    },
                },
                scope = {
                    enabled = false, -- enable highlighting the current scope
                    priority = 200,
                    char = "│",
                    underline = false,    -- underline the start of the scope
                    only_current = false, -- only show scope in the current window
                    hl = "CursorLineNr", ---@type string|string[] hl group for scopes
                },
                chunk = {
                    -- when enabled, scopes will be rendered as chunks, except for the
                    -- top-level scope which will be rendered as a scope.
                    enabled = false,
                    -- only show chunk scopes in the current window
                    only_current = false,
                    priority = 200,
                    hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
                    char = {
                        corner_top = "┌",
                        corner_bottom = "└",
                        -- corner_top = "╭",
                        -- corner_bottom = "╰",
                        horizontal = "─",
                        vertical = "│",
                        arrow = ">",
                    },
                },
                -- filter for buffers to enable indent guides
                ---@param buf number
                ---@param win number
                filter = function(buf, win)
                    return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and
                        vim.bo[buf].buftype == ""
                end,
            },
            input = { enabled = true },
            keymap = { enabled = true },
            layout = { enabled = true },
            lazygit = {
                -- automatically configure lazygit to use the current colorscheme
                -- and integrate edit with the current neovim instance
                configure = true,
                -- extra configuration for lazygit that will be merged with the default
                -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
                -- you need to double quote it: `"\"test\""`
                config = {
                    os = { editPreset = "nvim-remote" },
                    gui = {
                        -- set to an empty string "" to disable icons
                        nerdFontsVersion = "3",
                    },
                },
                -- theme_path = svim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
                -- -- Theme for lazygit
                -- theme = {
                --     [241]                      = { fg = "Special" },
                --     activeBorderColor          = { fg = "MatchParen", bold = true },
                --     cherryPickedCommitBgColor  = { fg = "Identifier" },
                --     cherryPickedCommitFgColor  = { fg = "Function" },
                --     defaultFgColor             = { fg = "Normal" },
                --     inactiveBorderColor        = { fg = "FloatBorder" },
                --     optionsTextColor           = { fg = "Function" },
                --     searchingActiveBorderColor = { fg = "MatchParen", bold = true },
                --     selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
                --     unstagedChangesColor       = { fg = "DiagnosticError" },
                -- },
                win = {
                    style = {
                        fullscreen = true,
                        width = vim.o.columns,
                        height = vim.o.lines,
                        row = 0,
                        col = 0,
                    }
                },
            },
            notifier = {
                timeout = 3000, -- default timeout in ms
                width = { min = 40, max = 0.4 },
                height = { min = 1, max = 0.6 },
                margin = { top = 0, right = 1, bottom = 0 },
                padding = true,              -- add 1 cell of left/right padding to the notification window
                gap = 0,                     -- gap between notifications
                sort = { "level", "added" }, -- sort by level and time
                -- minimum log level to display. TRACE is the lowest
                -- all notifications are stored in history
                level = vim.log.levels.TRACE,
                icons = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    debug = " ",
                    trace = " ",
                },
                keep = function(notif)
                    return vim.fn.getcmdpos() > 0
                end,
                style = "compact",
                top_down = true,    -- place notifications from top to bottom
                date_format = "%R", -- time format for notifications
                -- format for footer when more lines are available
                -- `%d` is replaced with the number of lines.
                -- only works for styles with a border
                ---@type string|boolean
                more_format = " ↓ %d lines ",
                refresh = 50, -- refresh at most every 50ms
            },
            notify = { enabled = true },
            picker = {
                prompt = " ",
                focus = "input",
                show_delay = 5000,
                limit_live = 10000,
                layout = {
                    cycle = true,
                    -- fullscreen = true,
                    preset = function()
                        return vim.o.columns >= 120 and "clean" or "horizontal"
                    end,
                },
                layouts = {
                    clean = {
                        fullscreen = true,
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            row = -1,
                            width = vim.o.columns,
                            height = vim.o.lines,
                            col = 0,
                            border = "top",
                            title = " {title} {live} {flags}",
                            title_pos = "left",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list",    border = "none" },
                                { win = "preview", title = "{preview}", width = 0.6, border = "left" },
                            },
                        },
                    },
                    horizontal = {
                        fullscreen = true,
                        layout = {
                            backdrop = false,
                            width = 0.5,
                            min_width = 80,
                            height = 0.8,
                            min_height = 30,
                            box = "vertical",
                            border = false,
                            title = "{title} {live} {flags}",
                            title_pos = "left",
                            { win = "preview", title = "{preview}", height = 0.5,                     border = "top" },
                            { win = "input",   height = 1,          title = "{title} {live} {flags}", border = "top" },
                            { win = "list",    border = "top" },
                        },
                    },
                    middle = {
                        fullscreen = false,
                        backdrop = false,
                        hidden = { "preview" },
                        layout = {
                            backdrop = false,
                            row = 0.42,
                            width = 0.4,
                            height = 0.55,
                            box = "vertical",
                            border = true,
                            title = "{title}",
                            title_pos = "center",
                            { win = "input",   height = 1,          border = "bottom" },
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", height = 0.4,     border = "top" },
                        }
                    },
                },
                ---@class snacks.picker.matcher.Config
                matcher = {
                    fuzzy = true,          -- use fuzzy matching
                    smartcase = true,      -- use smartcase
                    ignorecase = true,     -- use ignorecase
                    sort_empty = false,    -- sort results when the search string is empty
                    filename_bonus = true, -- give bonus for matching file names (last part of the path)
                    file_pos = true,       -- support patterns like `file:line:col` and `file:line`
                    -- the bonusses below, possibly require string concatenation and path normalization,
                    -- so this can have a performance impact for large lists and increase memory usage
                    cwd_bonus = false,     -- give bonus for matching files in the cwd
                    frecency = true,       -- frecency bonus
                    history_bonus = false, -- give more weight to chronological order
                },
                sort = {
                    -- default sort is by score, text length and index
                    fields = { "score:desc", "#text", "idx" },
                },
                ui_select = true, -- replace `vim.ui.select` with the snacks picker
                ---@class snacks.picker.formatters.Config
                formatters = {
                    text = {
                        ft = nil, ---@type string? filetype for highlighting
                    },
                    file = {
                        filename_first = true, -- display filename before the file path
                        --- * left: truncate the beginning of the path
                        --- * center: truncate the middle of the path
                        --- * right: truncate the end of the path
                        ---@type "left"|"center"|"right"
                        truncate = "left",
                        min_width = 40,        -- minimum length of the truncated path
                        filename_only = false, -- only show the filename
                        icon_width = 2,        -- width of the icon (in characters)
                        git_status_hl = true,  -- use the git status highlight group for the filename
                    },
                    selected = {
                        show_always = false, -- only show the selected column when there are multiple selections
                        unselected = true,   -- use the unselected icon for unselected items
                    },
                    severity = {
                        icons = true,  -- show severity icons
                        level = false, -- show severity level
                        ---@type "left"|"right"
                        pos = "left",  -- position of the diagnostics
                    },
                },
                ---@class snacks.picker.previewers.Config
                previewers = {
                    diff = {
                        -- fancy: require('snacks') fancy diff (borders, multi-column line numbers, syntax highlighting)
                        -- syntax: Neovim's built-in diff syntax highlighting
                        -- terminal: external command (git's pager for git commands, `cmd` for other diffs)
                        style = "fancy", ---@type "fancy"|"syntax"|"terminal"
                        cmd = { "delta" }, -- example for using `delta` as the external diff command
                        wo = {
                            breakindent = true,
                            wrap = true,
                            linebreak = true,
                            showbreak = "",
                        },
                    },
                    git = {
                        args = {}, -- additional arguments passed to the git command. Useful to set pager options usin `-c ...`
                    },
                    file = {
                        max_size = 1024 * 1024, -- 1MB
                        max_line_length = 500,  -- max line length
                        ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
                    },
                    man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
                },
                ---@class snacks.picker.jump.Config
                jump = {
                    jumplist = true,   -- save the current position in the jumplist
                    tagstack = false,  -- save the current position in the tagstack
                    reuse_win = false, -- reuse an existing window if the buffer is already open
                    close = true,      -- close the picker when jumping/editing to a location (defaults to true)
                    match = false,     -- jump to the first match position. (useful for `lines`)
                },
                toggles = {
                    follow = "f",
                    hidden = ".",
                    ignored = "i",
                    modified = "m",
                    regex = { icon = "R", value = false },
                },
                win = {
                    -- input window
                    input = {
                        keys = {
                            ["<C-c>"] = { "cancel", mode = { "n", "i" }, },
                            ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
                            ["<CR>"] = { "confirm", mode = { "n", "i" } },
                            ["<c-space>"] = { "confirm", mode = { "n", "i" } },
                            ["<Down>"] = { "history_forward", mode = { "i", "n" } },
                            ["<Esc>"] = "cancel",
                            ["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                            ["<c-s-k>"] = { "select_and_prev", mode = { "n", "i" } },
                            ["<c-s-j>"] = { "select_and_next", mode = { "n", "i" } },
                            ["<Up>"] = { "history_back", mode = { "i", "n" } },
                            ["<a-i>"] = { "inspect", mode = { "n", "i" } },
                            ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
                            ["<c-.>"] = { "toggle_hidden", mode = { "i", "n" } },
                            ["<a-a>"] = { "toggle_ignored", mode = { "i", "n" } },
                            ["<c-v>"] = { "toggle_regex", mode = { "i", "n" } },
                            ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
                            ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
                            ["<a-g>"] = { "picker_grep", mode = { "i", "n" } },
                            ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
                            ["<c-a>"] = { "select_all", mode = { "n", "i" } },
                            ["<c-p>"] = { "preview_scroll_up", mode = { "i", "n" } },
                            ["<c-n>"] = { "preview_scroll_down", mode = { "i", "n" } },
                            ["<c-s-d>"] = { "list_scroll_down", mode = { "i", "n" } },
                            ["<c-/>"] = { "toggle_live", mode = { "i", "n" } },
                            ["<c-j>"] = { "list_down", mode = { "i", "n" } },
                            ["<c-k>"] = { "list_up", mode = { "i", "n" } },
                            ["<c-cr>"] = { "focus_preview", mode = { "i", "n" } },
                            ["<c-esc>"] = { "focus_list", mode = { "n", "i" } },
                            ["<c-q>"] = { "qflist", mode = { "i", "n" } },
                            ["<c-d>"] = { "edit_split", mode = { "i", "n" } },
                            ["<c-s>"] = { "tab", mode = { "n", "i" } },
                            ["<c-s-u>"] = { "list_scroll_up", mode = { "i", "n" } },
                            ["<c-l>"] = { "edit_vsplit", mode = { "i", "n" } },
                            ["<c-r>#"] = { "insert_alt", mode = "i" },
                            ["<c-r>%"] = { "insert_filename", mode = "i" },
                            ["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
                            ["<c-r><c-f>"] = { "insert_file", mode = "i" },
                            ["<c-r><c-l>"] = { "insert_line", mode = "i" },
                            ["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
                            ["<c-r><c-w>"] = { "insert_cword", mode = "i" },
                            ["<c-w>H"] = "layout_left",
                            ["<c-w>J"] = "layout_bottom",
                            ["<c-w>K"] = "layout_top",
                            ["<c-w>L"] = "layout_right",
                            ["?"] = "toggle_help_input",
                            ["G"] = "list_bottom",
                            ["<c-s-g>"] = { "list_bottom", mode = { "n", "i" } },
                            ["go"] = "list_top",
                            ["<c-g>"] = { "list_top", mode = { "n", "i" } },
                            ["j"] = "list_down",
                            ["k"] = "list_up",
                            ["q"] = "cancel",
                            ["<c-f>"] = { "flash", mode = { "n", "i" } },
                        },
                        b = {
                            minipairs_disable = true,
                        },
                    },
                    -- result list window
                    list = {
                        keys = {
                            ["<2-LeftMouse>"] = "confirm",
                            ["<CR>"] = "confirm",
                            ["<c-space>"] = "confirm",
                            ["<Down>"] = "history_forward",
                            ["<Esc>"] = "cancel",
                            ["<S-CR>"] = { { "pick_win", "jump" } },
                            ["K"] = { "select_and_prev", mode = { "n", "x" } },
                            ["J"] = { "select_and_next", mode = { "n", "x" } },
                            ["<Up>"] = "history_back",
                            ["<a-i>"] = "inspect",
                            ["<a-f>"] = "toggle_follow",
                            ["<c-.>"] = "toggle_hidden",
                            ["<c-p>"] = { "preview_scroll_up", mode = { "i", "n" } },
                            ["<c-n>"] = { "preview_scroll_down", mode = { "i", "n" } },
                            ["<a-a>"] = "toggle_ignored",
                            ["<a-m>"] = "toggle_maximize",
                            ["<a-p>"] = "toggle_preview",
                            ["<a-w>"] = "cycle_win",
                            ["<c-a>"] = "select_all",
                            ["<c-s-d>"] = "list_scroll_down",
                            ["<c-j>"] = "list_down",
                            ["<c-k>"] = "list_up",
                            ["<c-cr>"] = "focus_preview",
                            ["<c-q>"] = "qflist",
                            ["<c-g>"] = "print_path",
                            ["<c-d>"] = "edit_split",
                            ["<c-s>"] = "tab",
                            ["<c-s-u>"] = "list_scroll_up",
                            ["<c-l>"] = "edit_vsplit",
                            ["<c-w>H"] = "layout_left",
                            ["<c-w>J"] = "layout_bottom",
                            ["<c-w>K"] = "layout_top",
                            ["<c-w>L"] = "layout_right",
                            ["?"] = "toggle_help_list",
                            ["G"] = "list_bottom",
                            ["go"] = "list_top",
                            ["i"] = "focus_input",
                            ["<c-i>"] = "focus_input",
                            ["j"] = "list_down",
                            ["k"] = "list_up",
                            ["q"] = "cancel",
                            ["zb"] = "list_scroll_bottom",
                            ["zt"] = "list_scroll_top",
                            ["zz"] = "list_scroll_center",
                            ["<c-f>"] = { "flash", mode = { "n", "i" } },
                        },
                        wo = {
                            conceallevel = 2,
                            concealcursor = "nvc",
                        },
                    },
                    -- preview window
                    preview = {
                        keys = {
                            ["<c-esc>"] = "focus_list",
                            ["q"] = "cancel",
                            ["<Esc>"] = "cancel",
                            ["<c-c>"] = "cancel",
                            ["i"] = "focus_input",
                            ["<c-i>"] = "focus_input",
                            ["<a-w>"] = "cycle_win",
                        },
                    },
                },
                ---@class snacks.picker.icons
                icons = {
                    files = {
                        enabled = true, -- show file icons
                        dir = "󰉋 ",
                        dir_open = "󰝰 ",
                        file = "󰈔 "
                    },
                    keymaps = {
                        nowait = "󰓅 "
                    },
                    tree = {
                        vertical = "│ ",
                        middle   = "├╴",
                        last     = "└╴",
                    },
                    undo = {
                        saved = " ",
                    },
                    ui = {
                        live       = "󰐰 ",
                        hidden     = "h",
                        ignored    = "i",
                        follow     = "f",
                        selected   = "● ",
                        unselected = "○ ",
                        -- selected = " ",
                    },
                    git = {
                        enabled   = true, -- show git icons
                        commit    = "󰜘 ", -- used by git log
                        staged    = "●", -- staged changes. always overrides the type icons
                        added     = "",
                        deleted   = "",
                        ignored   = " ",
                        modified  = "○",
                        renamed   = "",
                        unmerged  = " ",
                        untracked = "?",
                    },
                    diagnostics = {
                        Error = " ",
                        Warn  = " ",
                        Hint  = " ",
                        Info  = " ",
                    },
                    lsp = {
                        unavailable = "",
                        enabled = " ",
                        disabled = " ",
                        attached = "󰖩 "
                    },
                    kinds = {
                        Array         = " ",
                        Boolean       = "󰨙 ",
                        Class         = " ",
                        Color         = " ",
                        Control       = " ",
                        Collapsed     = " ",
                        Constant      = "󰏿 ",
                        Constructor   = " ",
                        Copilot       = " ",
                        Enum          = " ",
                        EnumMember    = " ",
                        Event         = " ",
                        Field         = " ",
                        File          = " ",
                        Folder        = " ",
                        Function      = "󰊕 ",
                        Interface     = " ",
                        Key           = " ",
                        Keyword       = " ",
                        Method        = "󰊕 ",
                        Module        = " ",
                        Namespace     = "󰦮 ",
                        Null          = " ",
                        Number        = "󰎠 ",
                        Object        = " ",
                        Operator      = " ",
                        Package       = " ",
                        Property      = " ",
                        Reference     = " ",
                        Snippet       = "󱄽 ",
                        String        = " ",
                        Struct        = "󰆼 ",
                        Text          = " ",
                        TypeParameter = " ",
                        Unit          = " ",
                        Unknown       = " ",
                        Value         = " ",
                        Variable      = "󰀫 ",
                    },
                },
                ---@class snacks.picker.db.Config
                db = {
                    -- path to the sqlite3 library
                    -- If not set, it will try to load the library by name.
                    -- On Windows it will download the library from the internet.
                    sqlite3_path = nil, ---@type string?
                },
                ---@class snacks.picker.debug
                debug = {
                    scores = false,   -- show scores in the list
                    leaks = false,    -- show when pickers don't get garbage collected
                    explorer = false, -- show explorer debug info
                    files = false,    -- show file debug info
                    grep = false,     -- show file debug info
                    proc = false,     -- show proc debug info
                    extmarks = false, -- show extmarks errors
                },
                actions = {
                    {
                        flash = function(picker)
                            require("flash").jump({
                                pattern = "^",
                                label = { after = { 0, 0 } },
                                search = {
                                    mode = "search",
                                    exclude = {
                                        function(win)
                                            return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~=
                                                "snacks_picker_list"
                                        end,
                                    },
                                },
                                action = function(match)
                                    local idx = picker.list:row2idx(match.pos[1])
                                    picker.list:_move(idx, true, true)
                                end,
                            })
                        end,
                    },
                },
                explorer = {
                    finder = "explorer",
                    sort = { fields = { "sort" } },
                    supports_live = true,
                    tree = true,
                    watch = true,
                    diagnostics = true,
                    diagnostics_open = false,
                    git_status = true,
                    git_status_open = false,
                    git_untracked = true,
                    follow_file = true,
                    focus = "list",
                    auto_close = true,
                    jump = { close = false },
                    layout = { preset = "sidebar", preview = false },
                    -- to show the explorer to the right, add the below to
                    -- your config under `opts.picker.sources.explorer`
                    formatters = {
                        file = { filename_only = true },
                        severity = { pos = "right" },
                    },
                    matcher = { sort_empty = false, fuzzy = false },
                    config = function(opts)
                        return require("snacks.picker.source.explorer").setup(opts)
                    end,
                    win = {
                        list = {
                            keys = {
                                ["<BS>"] = "explorer_up",
                                ["l"] = "confirm",
                                ["h"] = "explorer_close", -- close directory
                                ["n"] = "explorer_add",
                                ["d"] = "explorer_del",
                                ["r"] = "explorer_rename",
                                ["c"] = "explorer_copy",
                                ["m"] = "explorer_move",
                                ["o"] = "explorer_open", -- open with system application
                                ["<a-p>"] = "toggle_preview",
                                ["y"] = { "explorer_yank", mode = { "n", "x" } },
                                ["p"] = "explorer_paste",
                                ["u"] = "explorer_update",
                                ["<c-c>"] = "tcd",
                                ["s"] = "picker_grep",
                                ["t"] = "terminal",
                                ["F"] = "explorer_focus",
                                ["I"] = "toggle_ignored",
                                ["H"] = "toggle_hidden",
                                ["Z"] = "explorer_close_all",
                                ["]g"] = "explorer_git_next",
                                ["[g"] = "explorer_git_prev",
                                ["]d"] = "explorer_diagnostic_next",
                                ["[d"] = "explorer_diagnostic_prev",
                                ["]w"] = "explorer_warn_next",
                                ["[w"] = "explorer_warn_prev",
                                ["]e"] = "explorer_error_next",
                                ["[e"] = "explorer_error_prev",
                            },
                        },
                    },
                },
                sources = {
                    explorer = {
                        layout = {
                            preset = "right",
                            fullscreen = false,
                        },
                    }
                }
            },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scratch = {
                name = os.date("%Y-%m-%d_%H-%M-%S"),
                content = {
                    "= ",
                    "",
                },
                cursor = {
                    location = { 1, 3 },
                    insert_mode = true,
                },
                ft = "typst",
                ---@type string|string[]?
                icon = nil,       -- `icon|{icon, icon_hl}`. defaults to the filetype icon
                root = vim.fn.stdpath("data") .. "/notes",
                autowrite = true, -- automatically write when the buffer is hidden
                -- unique key for the scratch file is based on:
                -- * name
                -- * ft
                -- * vim.v.count1 (useful for keymaps)
                -- * cwd (optional)
                -- * branch (optional)
                filekey = {
                    id = nil, ---@type string? unique id used instead of name for the filename hash
                    cwd = true,    -- use current working directory
                    branch = true, -- use current branch name
                    count = true,  -- use vim.v.count1
                },
                win = { style = "scratch" },
                win_by_ft = {
                    lua = {
                        keys = {
                            ["source"] = {
                                "<cr>",
                                function(self)
                                    local name = "scratch." ..
                                        vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
                                    --NOTE: not sure what this is doing? could be the root of the notes problems
                                    require('snacks').debug.run({ buf = self.buf, name = name })
                                end,
                                desc = "Source buffer",
                                mode = { "n", "x" },
                            },
                        },
                    },
                },
            },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            --     left = {"git"},  -- priority of signs on the left (high to low)
            --     right = { "sign", "mark", "fold", }, -- priority of signs on the right (high to low)
            --     folds = {
            --         open = false,    -- show open fold icons
            --         git_hl = false, -- use Git Signs hl for fold icons
            --     },
            --     git = {
            --         -- patterns to match Git signs
            --         patterns = { "GitSign", "MiniDiffSign" },
            --     },
            --     refresh = 50, -- refresh at most every 50ms
            -- },
            terminal = {
                -- start_insert = true,
                -- auto_insert = true,
                -- auto_close = true,
                interactive = true,
            },
            toggle = { enabled = true },
            win = {
                show = true,
                fixbuf = true,
                relative = "editor",
                position = "float",
                minimal = true,
                wo = {
                    winhighlight =
                    "Normal:SnacksNormal,NormalNC:SnacksNormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC,FloatTitle:SnacksTitle,FloatFooter:SnacksFooter,WinSeparator:SnacksWinSeparator",
                },
                bo = {},
                title_pos = "center",
                keys = {
                    q = "close",
                },
                footer_pos = "center",
                footer_keys = false,
                -- require('snacks').win.new()
                -- ---@class snacks.win.Config: vim.api.keyset.win_config
                -- ---@field style? string merges with config from `require('snacks').config.styles[style]`
                -- ---@field show? boolean Show the window immediately (default: true)
                -- ---@field footer_keys? boolean|string[] Show keys footer. When string[], only show those keys with lhs (default: false)
                -- ---@field height? number|fun(self:snacks.win):number Height of the window. Use <1 for relative height. 0 means full height. (default: 0.9)
                -- ---@field width? number|fun(self:snacks.win):number Width of the window. Use <1 for relative width. 0 means full width. (default: 0.9)
                -- ---@field min_height? number Minimum height of the window
                -- ---@field max_height? number Maximum height of the window
                -- ---@field min_width? number Minimum width of the window
                -- ---@field max_width? number Maximum width of the window
                -- ---@field col? number|fun(self:snacks.win):number Column of the window. Use <1 for relative column. (default: center)
                -- ---@field row? number|fun(self:snacks.win):number Row of the window. Use <1 for relative row. (default: center)
                -- ---@field minimal? boolean Disable a bunch of options to make the window minimal (default: true)
                -- ---@field position? "float"|"bottom"|"top"|"left"|"right"|"current"
                -- ---@field border? "none"|"top"|"right"|"bottom"|"left"|"top_bottom"|"hpad"|"vpad"|"rounded"|"single"|"double"|"solid"|"shadow"|"bold"|string[]|false|true
                -- ---@field buf? number If set, use this buffer instead of creating a new one
                -- ---@field file? string If set, use this file instead of creating a new buffer
                -- ---@field enter? boolean Enter the window after opening (default: false)
                -- ---@field backdrop? number|false|snacks.win.Backdrop Opacity of the backdrop (default: 60)
                -- ---@field wo? vim.wo|{} window options
                -- ---@field bo? vim.bo|{} buffer options
                -- ---@field b? table<string, any> buffer local variables
                -- ---@field w? table<string, any> window local variables
                -- ---@field ft? string filetype to use for treesitter/syntax highlighting. Won't override existing filetype
                -- ---@field scratch_ft? string filetype to use for scratch buffers
                -- ---@field keys? table<string, false|string|fun(self: snacks.win)|snacks.win.Keys> Key mappings
                -- ---@field on_buf? fun(self: snacks.win) Callback after opening the buffer
                -- ---@field on_win? fun(self: snacks.win) Callback after opening the window
                -- ---@field on_close? fun(self: snacks.win) Callback after closing the window
                -- ---@field fixbuf? boolean don't allow other buffers to be opened in this window
                -- ---@field text? string|string[]|fun():(string[]|string) Initial lines to set in the buffer
                -- ---@field actions? table<string, snacks.win.Action.spec> Actions that can be used in key mappings
                -- ---@field resize? boolean Automatically resize the window when the editor is resized
                -- ---@field stack? boolean When enabled, multiple split windows with the same position will be stacked together (useful for terminals)
            },
            words = {
                debounce = 100,                 -- time in ms to wait before updating
                notify_jump = false,            -- show a notification when jumping
                notify_end = true,              -- show a notification when reaching the end
                foldopen = true,                -- open folds after jumping
                jumplist = true,                -- set jump point before jumping
                modes = { "n", "i", "c", "x" }, -- modes to show references
                filter = function(buf)          -- what buffers to enable `snacks.words`
                    return vim.g.snacks_words ~= false and vim.b[buf].snacks_words ~= false
                end,
            },
            zen = {
                -- You can add any `require('snacks').toggle` id here.
                -- Toggle state is restored when the window is closed.
                -- Toggle config options are NOT merged.
                ---@type table<string, boolean>
                toggles = {
                    -- dim = true,
                    -- git_signs = false,
                    -- mini_diff_signs = false,
                    -- diagnostics = false,
                    -- inlay_hints = false,
                },
                center = false,        -- center the window
                show = {
                    statusline = true, -- can only be shown when using the global statusline
                    tabline = true,
                },
                win = { style = "zen" },
                --- Callback when the window is opened.
                -- on_open = function(win)
                --     vim.cmd("DimToggle")
                -- end,
                -- --- Callback when the window is closed.
                -- on_close = function(win)
                --     vim.cmd("DimToggle")
                -- end,
                --- Options for the `require('snacks').zen.zoom()`
                zoom = {
                    toggles = {},
                    center = false,
                    show = { statusline = true, tabline = true },
                    win = {
                        backdrop = false,
                        width = 0,  -- full width
                        height = 0, -- full height
                    },
                },
            },
            styles = {
                input = {
                    backdrop = false,
                    position = "float",
                    border = true,
                    title_pos = "center",
                    height = 1,
                    width = 60,
                    noautocmd = true,
                    relative = "editor",
                    row = vim.o.lines / 2 - 2,
                    -- relative = "cursor",
                    -- row = -3,
                    -- col = 0,
                    wo = {
                        winhighlight =
                        "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
                        cursorline = false,
                    },
                    bo = {
                        filetype = "snacks_input",
                        buftype = "prompt",
                    },
                    --- buffer local variables
                    b = {
                        completion = false, -- disable blink completions in input
                    },
                    keys = {
                        n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                        i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
                        i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
                        i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
                        i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
                        i_up = { "<C-p>", { "hist_up" }, mode = { "i", "n" } },
                        i_down = { "<C-n>", { "hist_down" }, mode = { "i", "n" } },
                        q = "cancel",
                    },
                },
                -- picker = {
                --     width = vim.o.columns,
                --     height = vim.o.lines,
                --     row = 0,
                --     col = 0,
                -- },
                notification = {
                    wo = { wrap = true }
                },
                scratch = {
                    width = vim.o.columns,
                    height = vim.o.lines,
                    row = 0,
                    col = 0,
                    border = true,
                    footer_keys = true,
                },
                terminal = {
                    border = false,
                    minimal = true,
                },
                zoom_indicator = {
                    text = "  fullscreen 󰊓  ",
                    minimal = true,
                    enter = false,
                    focusable = false,
                    height = 1,
                    row = 0,
                    col = -1,
                    backdrop = false,
                }
            },
        },
        keys = {
            { "zd",         function() require('snacks').dashboard() end,      desc = "Toggle Dashboard" },
            { "zs",         function() require('snacks').dim.enable() end,               desc = "Enable dim" },
            { "zS",         function() require('snacks').dim.disable() end,               desc = "Disable dim" },
            { "<leader>.",  function() require('snacks').explorer.open() end,  desc = "Open File Tree" },

            -- git
            { "gh",         function() require('snacks').gitbrowse.open() end, desc = "Open GitHub Repo" },
            { "<leader>go", function() require('snacks').gitbrowse.open() end, desc = "Open GitHub Repo" },
            { "<leader>gz", function() require('snacks').lazygit.open() end,   desc = "Lazygit" },

            -- lsp reference jumping
            { "<M-S-k>",    function() require('snacks').words.jump(-1) end,   desc = "Previous LSP Reference" },
            { "<M-S-j>",    function() require('snacks').words.jump() end,     desc = "Next LSP Reference" },

            { "<C-S-f>",    function() require('snacks').zen.zoom() end,       desc = "Toggle fullscreen" },

            --            -- Top Pickers & Explorer
            { "<leader>aF", function() require('snacks').picker.smart() end,   desc = "Smart Find Files" },
            {
                "<leader>af",
                function()
                    require('snacks').picker.buffers({
                        finder = "buffers",
                        format = "buffer",
                        hidden = false,
                        unloaded = true,
                        current = true,
                        sort_lastused = true,
                        win = {
                            input = {
                                keys = {
                                    ["<c-bs>"] = { "bufdelete", mode = { "n", "i" } },
                                    ["<bs>"] = { "bufdelete", mode = { "n", } },
                                },
                            },
                            list = { keys = { ["d"] = "bufdelete" } },
                        },
                    })
                end,
                desc = "Buffers"
            },
            { "<leader>s", function() require('snacks').picker.grep({ layout = { preset = "horizontal", } }) end, desc = "Grep" },
            { "<leader>an", function() require('snacks').picker.notifications() end,                               desc = "Notification History" },
            -- find
            { "<leader>f", function() require("snacks").picker.files() end,                                       desc = "Find Files", },
            {
                "<leader>ad",
                function()
                    require("snacks").picker.files({
                        cmd = "fd",
                        args = { "-t", "d", "-E", "*.*" },
                        format = "file",
                    })
                end,
                desc = "Find Directories",
            },
            { "<leader>,", function() require('snacks').picker.files({ cwd = vim.fn.stdpath("config") }) end,                 desc = "Find Config File" },
            { "<leader>a.", function() require('snacks').picker.files({ hidden = true, ignored = true, follow = false, }) end, desc = "Find Hidden Files" },
            { "<leader>ag", function() require('snacks').picker.git_files() end,                                               desc = "Find Git Files" },
            -- { "<leader>fp",      function() require('snacks').picker.projects() end,                                desc = "Projects" },
            { "<leader>ao", function() require('snacks').picker.recent() end,                                                  desc = "Old Files" },
            -- git
            {
                "<leader>gb",
                function()
                    require('snacks').picker.git_branches({
                        win = {
                            input = {
                                keys = {
                                    ["<c-bs>"] = { "git_branch_del", mode = { "n", "i" } },
                                    ["<bs>"] = { "git_branch_del", mode = { "n", } },
                                    ["<c-n>"] = { "git_branch_add", mode = { "n", "i" } },
                                    ["n"] = { "git_branch_add", mode = { "n", } },
                                }
                            }
                        }
                    })
                end,
                desc = "Git Branches"
            },
            { "<leader>gl",  function() require('snacks').picker.git_log() end,                                         desc = "Git Log" },
            { "<leader>gL",  function() require('snacks').picker.git_log_line() end,                                    desc = "Git Log Line" },
            { "<leader>gs",  function() require('snacks').picker.git_status() end,                                      desc = "Git Status" },
            { "<leader>gS",  function() require('snacks').picker.git_stash() end,                                       desc = "Git Stash" },
            { "<leader>gd",  function() require('snacks').picker.git_diff() end,                                        desc = "Git Diff (Hunks)" },
            { "<leader>gf",  function() require('snacks').picker.git_log_file() end,                                    desc = "Git Log File" },
            { "<leader>gr",  function() require('snacks').picker.git_grep({ layout = { preset = "horizontal", } }) end, desc = "Git Grep" },
            -- gh
            { "<leader>gi",  function() require('snacks').picker.gh_issue() end,                                        desc = "GitHub Issues (open)" },
            { "<leader>gai", function() require('snacks').picker.gh_issue({ state = "all" }) end,                       desc = "GitHub Issues (all)" },
            { "<leader>gp",  function() require('snacks').picker.gh_pr() end,                                           desc = "GitHub Pull Requests (open)" },
            { "<leader>gap", function() require('snacks').picker.gh_pr({ state = "all" }) end,                          desc = "GitHub Pull Requests (all)" },
            -- Grep
            {
                "/",
                function()
                    require('snacks').picker.lines({
                        finder = "lines",
                        format = "lines",
                        layout = {
                            fullscreen = true,
                            preview = "top",
                            preset = "horizontal",
                        },
                        jump = { match = true },
                        -- allow any window to be used as the main window
                        main = { current = true },
                        on_show = function(picker)
                            local cursor = vim.api.nvim_win_get_cursor(picker.main)
                            local info = vim.api.nvim_win_call(picker.main, vim.fn.winsaveview)
                            picker.list:view(cursor[1], info.topline)
                            picker:show_preview()
                        end,
                        sort = { fields = { "score:desc", "idx" } },
                    })
                end,
                desc = "Fuzzy search"
            },
            { "<leader>S",         function() require('snacks').picker.grep_buffers({ layout = { preset = "horizontal", } }) end,             desc = "Grep Open Buffers" },
            { "<leader>as",        function() require('snacks').picker.grep_word({ layout = { preset = "horizontal", } }) end,                desc = "Visual selection or word", mode = { "n", "x" } },
            -- search
            { '<leader>ap',        function() require('snacks').picker.registers() end,                                                       desc = "Registers" },
            { '<leader>a/',        function() require('snacks').picker.search_history() end,                                                  desc = "Search History" },
            { "<leader>c",         function() require('snacks').picker.command_history({ layout = { preset = "middle" } }) end,               desc = "Command History" },
            { "<leader>:",         function() require('snacks').picker.commands() end,                                                        desc = "Commands" },
            -- { "<leader>sd",      function() require('snacks').picker.diagnostics() end,                             desc = "Diagnostics" },
            -- { "<leader>sD",      function() require('snacks').picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
            { "<leader>ah",        function() require('snacks').picker.help() end,                                                            desc = "Help Pages" },
            { "<leader>aH",        function() require('snacks').picker.highlights() end,                                                      desc = "Highlights" },
            { "<leader>ae",        function() require('snacks').picker.icons() end,                                                           desc = "Icons" },
            { "<leader>aj",        function() require('snacks').picker.jumps() end,                                                           desc = "Jumps" },
            { "<leader>ak",        function() require('snacks').picker.keymaps() end,                                                         desc = "Keymaps" },
            { "<leader>al",        function() require('snacks').picker.loclist() end,                                                         desc = "Location List" },
            { "<leader>`",         function() require('snacks').picker.marks() end,                                                           desc = "Marks" },
            { "<leader>am",        function() require('snacks').picker.man() end,                                                             desc = "Man Pages" },
            { "<leader>az",        function() require('snacks').picker.zoxide() end,                                                          desc = "Search for Plugin Spec" },
            { "<leader>aq",        function() require('snacks').picker.qflist() end,                                                          desc = "Quickfix List" },
            { "<leader>A",         function() require('snacks').picker.resume() end,                                                          desc = "Resume" },
            { "<leader>u",         function() require('snacks').picker.undo() end,                                                            desc = "Undo History" },
            { "<leader>a<leader>", function() require('snacks').picker.pickers() end,                                                         desc = "Snacks Pickers" },
            { "<C-=>",             function() require('snacks').picker.spelling({ layout = { preset = "middle", fullscreen = false, } }) end, desc = "Snacks Pickers", mode = { "n", "i" } },

            { "<leader>n",         function() require('snacks').notifier.hide() end,                                                          desc = "Close all notifications",  mode = "n" },
        },

    },
}
