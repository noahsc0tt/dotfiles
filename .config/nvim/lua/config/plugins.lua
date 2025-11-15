return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        event = { "BufReadPost", "BufNewFile" }
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        cond = not vim.g.started_by_firenvim,

    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        cond = not vim.g.started_by_firenvim,
    },

    {
        "mbbill/undotree",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "theprimeagen/harpoon",
        cmd = "Harpoon",
        cond = not vim.g.started_by_firenvim,
    },

    {
        "tpope/vim-fugitive",
        cond = not vim.g.started_by_firenvim,

    },

    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        cond = not vim.g.started_by_firenvim,

    },

    {
        "kylechui/nvim-surround",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        "bkad/CamelCaseMotion",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },

    {
        "github/copilot.vim",
        event = "InsertEnter"
    },

    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim", branch = "master" },
    --     },
    --     build = "make tiktoken",
    --     cmd = { "CopilotChat", "CopilotChatToggle" },
    --     opts = {
    --         {
    --             model = 'gpt-4.1',
    --             temperature = 0.1,
    --             window = {
    --                 layout = 'vertical',
    --                 width = 0.3,
    --             },
    --             auto_insert_mode = true,
    --         }
    --     },
    --     cond = not vim.g.started_by_firenvim,
    --
    -- },

    {
        'mrjones2014/smart-splits.nvim',
        lazy = true,
        event = "VeryLazy",
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        lazy = true,
        event = "VeryLazy",
        cond = not vim.g.started_by_firenvim,
    },

    {
        'dhruvasagar/vim-table-mode',
        cmd = { "TableModeToggle", "TableModeEnable" },
        config = function()
            vim.g.table_mode_corner = '|'
        end
    },

    --    {
    --        "nvim-zh/colorful-winsep.nvim",
    --        config = true,
    --        event = { "WinLeave" },
    --    },

    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --     ft = { "markdown" },
    --     ---@module 'render-markdown'
    --     cmd = { "RenderMarkdown" },
    -- },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    { 'glacambre/firenvim', build = ":call firenvim#install(0)" },


    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure it loads immediately
        priority = 1000, -- load before other plugins
        opts = {
            style = "night",
            on_highlights = function(hl, c)
                local prompt = c.bg
                hl.TelescopeNormal = { bg = c.bg, fg = c.fg }
                hl.TelescopeBorder = { bg = c.bg, fg = c.bg }
                hl.TelescopePromptNormal = { bg = prompt }
                hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
                hl.TelescopePromptTitle = { bg = c.bg_highlight, fg = c.fg }
                hl.TelescopePreviewTitle = { bg = c.bg, fg = c.bg }
                hl.TelescopeResultsTitle = { bg = c.bg, fg = c.bg }
                hl.NoiceCmdlinePopupBorder = { bg = c.bg, fg = c.bg }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight-night")
            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#82A1F1" })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#82A1F1" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#af6be0", bold = true })
        end,
        cond = not vim.g.started_by_firenvim,

    },

    -- {
    --     'romariorobby/taskell.nvim',
    --     lazy = true,
    --     event = "VeryLazy",
    --     cond = not vim.g.started_by_firenvim,
    -- },

    {
        'rcarriga/nvim-notify',
        lazy = true,
        event = "VeryLazy",
        cond = not vim.g.started_by_firenvim,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        cond = not vim.g.started_by_firenvim,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        cond = not vim.g.started_by_firenvim,
    },

    {
        "aznhe21/actions-preview.nvim",
        lazy = true,
        event = "VeryLazy",
        cond = not vim.g.started_by_firenvim,
    },


    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    {
        "NStefan002/screenkey.nvim",
        lazy = false,
        branch = "main",
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        ft = { "markdown", "typst" },
    },

    {
        "chrisgrieser/nvim-origami",
        lazy = false,

        init = function()
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
        end,
    },

    -- {
    --     "xzbdmw/colorful-menu.nvim",
    --     lazy = true,
    --     event = "VeryLazy",
    --     config = function()
    --         require("colorful-menu").setup()
    --     end
    -- },

    {
        "NickvanDyke/opencode.nvim",
        cond = not vim.g.started_by_firenvim,
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "ms-jpq/coq_nvim",       branch = "coq" },
            { "ms-jpq/coq.artifacts",  branch = "artifacts" },

            -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
            -- - shell repl
            -- - nvim lua api
            -- - scientific calculator
            -- - comment banner
            -- - etc

        },
        init = function()
            vim.g.coq_settings = {
                auto_start = 'shut-up',
                completion = {
                    always = false,
                    sticky_manual = false,

                },
                display = {
                    preview = {
                        border = { "", "", "", "", "", "", "", "" }
                    },
                    statusline = { helo = false }
                },
                keymap = {
                    recommended = true,
                    pre_select = true,
                    jump_to_mark = '<C-m>',
                    manual_complete = '<C-Space>',
                    bigger_preview = '<C-k>',
                },
            }
        end,
    },

    {
        "rmagatti/auto-session",
        lazy = false,
        cond = not vim.g.started_by_firenvim,
    },

    {
        'nvim-focus/focus.nvim',
        lazy = true,
        event = "VeryLazy",
    },

    {
        "folke/zen-mode.nvim",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "LintaoAmons/scratch.nvim",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
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
                            icon = "󱞂 ",
                            key = "N",
                            desc = "Search Notes",
                            action = function()
                                require('snacks').scratch.select()
                            end
                        },
                        {
                            icon = " ",
                            key = "c",
                            desc = "Create Scratch File",
                            action = function()
                                vim.cmd("Scratch")
                                vim.defer_fn(function()
                                    local keys = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
                                    vim.api.nvim_feedkeys(keys, "t", false)
                                end, 1)
                            end
                        },
                        { icon = "󰱽 ", key = "C", desc = "Search Scratch Files", action = ":ScratchOpen" },
                        -- { icon = "󰨽 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        -- { icon = "󰱂 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "o", desc = "Open Config File", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰒲 ", key = "z", desc = "Lazy Sync", action = ":Lazy sync", enabled = package.loaded.lazy ~= nil },
                        {
                            icon = " ",
                            key = "s",
                            desc = "Search Sessions",
                            action = function()
                                vim.cmd("AutoSession search")
                            end
                        },
                        {
                            icon = " ",
                            key = "v",
                            desc = "Save Session",
                            action = function()
                                vim.cmd("AutoSession save")
                            end
                        },
                        {
                            icon = "󰧧 ",
                            key = "q",
                            desc = "Quit and Delete Session",
                            action = function()
                                vim.cmd("AutoSession delete")
                                vim.cmd("qa!")
                            end
                        },
                    },
                },
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        cmd = "colorscript -e square",
                        height = 5,
                        padding = 3,
                    },
                    { pane = 2, icon = "󱫓 ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1, hl_current_line = false },
                    { pane = 2, icon = " ", title = "Recent Directories", section = "projects", indent = 2, padding = 1, hl_current_line = false },
                    { pane = 2, section = "keys", gap = 0, padding = 1, hl_current_line = false },
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
                        cmd = "lsd --color=always --group-directories-first -1 --literal --no-symlink",
                        indent = 2,
                        padding = 1,
                        hl_current_line = false
                    },
                    {
                        pane = 1,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return require("snacks").git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        indent = 2,
                        padding = 1,
                        hl_current_line = false
                    },
                    { pane = 2, section = "startup" },
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
            gitbrowse = { enabled = true },
            image = { enabled = true },
            indent = {
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
                ---@class snacks.indent.animate: snacks.animate.Config
                ---@field enabled? boolean
                --- * out: animate outwards from the cursor
                --- * up: animate upwards from the cursor
                --- * down: animate downwards from the cursor
                --- * up_down: animate up or down based on the cursor position
                ---@field style? "out"|"up_down"|"down"|"up"
                animate = {
                    enabled = false,
                    style = "out",
                    easing = "linear",
                    duration = {
                        step = 20,   -- ms per step
                        total = 500, -- maximum duration
                    },
                },
                ---@class snacks.indent.Scope.Config: snacks.scope.Config
                scope = {
                    enabled = true, -- enable highlighting the current scope
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
                    style = "lazygit",
                },
            },
            notifier = {
                enabled = false,
            },
            picker = {
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
                                ["<space>"] = "toggle_preview",
                                ["y"] = { "explorer_yank", mode = { "n", "x" } },
                                ["p"] = "explorer_paste",
                                ["u"] = "explorer_update",
                                ["<c-c>"] = "tcd",
                                ["s"] = "picker_grep",
                                ["t"] = "terminal",
                                ["F"] = "explorer_focus",
                                ["I"] = "toggle_ignored",
                                [""] = "toggle_hidden",
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
                        layout = { layout = { position = "right" } },
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
                ---@type table<string, snacks.win.Config>
                win_by_ft = {
                    lua = {
                        keys = {
                            ["source"] = {
                                "<cr>",
                                function(self)
                                    local name = "scratch." ..
                                        vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
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
            --     left = {},  -- priority of signs on the left (high to low)
            --     "git"
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
                bo = {
                    filetype = "snacks_terminal",
                },
                wo = {},
                stack = true, -- when enabled, multiple split windows with the same position will be stacked together (useful for terminals)
                keys = {
                    q = "hide",
                    gf = function(self)
                        local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
                        if f == "" then
                            require('snacks').notify.warn("No file under cursor")
                        else
                            self:hide()
                            vim.schedule(function()
                                vim.cmd("e " .. f)
                            end)
                        end
                    end,
                },
            },
            toggle = { enabled = false },
            win = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true } -- Wrap notifications
                }
            },
        },
        keys = {
            { "<leader>n",   function() require('snacks').notifier.hide() end,                    desc = "Dismiss Notifications" },
            -- { "<leader>an",  function() require('snacks').notifier.show_history() end,            desc = "Notification History" },
            { "<leader>d",   function() require('snacks').dashboard() end,                        desc = "Toggle Dashboard" },
            { "<leader>zd",  function() vim.cmd("DimToggle") end,                                 desc = "Toggle dim" },
            { "<leader>.",   function() require('snacks').explorer.open() end,                    desc = "Open File Tree" },
            -- git
            { "<leader>gi",  function() require('snacks').picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
            { "<leader>gai", function() require('snacks').picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
            { "<leader>gp",  function() require('snacks').picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
            { "<leader>gap", function() require('snacks').picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
            { "<leader>go",  function() require('snacks').gitbrowse.open() end,                   desc = "Open GitHub Repo" },
            { "<leader>gz",  function() require('snacks').lazygit.open() end,                     desc = "Lazygit" },
            -- lsp reference jumping
            { "<leader>k",   function() require('snacks').words.jump(-1) end,                     desc = "Previous LSP Reference" },
            { "<leader>j",   function() require('snacks').words.jump() end,                       desc = "Next LSP Reference" },
        },

    }
}
