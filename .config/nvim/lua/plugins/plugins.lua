return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        cond = not vim.g.started_by_firenvim,
        config = true,

    },

    {
        "kylechui/nvim-surround",
        lazy = true,
        event = "VeryLazy",
        config = true
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enabled = false,
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        cmd = { "CopilotChat", "CopilotChatToggle" },
        opts = {
            {
                model = 'gpt-5.1',
                temperature = 0.1,
                window = {
                    layout = 'vertical',
                    width = 0.3,
                },
                auto_insert_mode = true,
            }
        },
        cond = not vim.g.started_by_firenvim,

    },

    {
        'dhruvasagar/vim-table-mode',
        cmd = { "TableModeToggle", "TableModeEnable" },
        config = function()
            vim.g.table_mode_corner = '|'
        end
    },

    { 'glacambre/firenvim', build = ":call firenvim#install(0)" },

    {
        'romariorobby/taskell.nvim',
        enabled = false,
        cmd = 'Taskell',
        cond = not vim.g.started_by_firenvim,
    },

    {
        "xzbdmw/colorful-menu.nvim",
        enabled = true,
        lazy = true,
        event = "VeryLazy",
        config = true,
    },

    {
        'anuvyklack/keymap-amend.nvim',
        enabled = false,
        lazy = false,
    },

    {
        "josephburgess/nvumi",
        dependencies = { "folke/snacks.nvim" },
        opts = {
            virtual_text = "inline", -- "newline" or "inline"
            prefix = " = ", -- prefix shown before the output
            date_format = "iso", -- or: "uk", "us", "long"
            keys = {
                run = "<CR>", -- run/refresh calculations
                reset = "R", -- reset buffer
                yank = "<leader>y", -- yank output of current line
                yank_all = "<leader>Y", -- yank all outputs
            },
            custom_conversions = {},
            custom_functions = {}
        }
    }
}
