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

    -- {
    --     "folke/twilight.nvim",
    --     lazy = true,
    --     event = "VeryLazy",
    -- },

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
        keys = {
            { "<leader>n",  function() Snacks.notifier.dismiss() end, desc = "Dismiss Notifications" },
            { "<leader>sd", function() Snacks.dashboard.toggle() end, desc = "Toggle Dashboard" },
        },
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            terminal = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    -- wo = { wrap = true } -- Wrap notifications
                }
            },
        }


    }
}
