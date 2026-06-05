return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        event = "VeryLazy",
    },

    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        config = true,

    },

    {
        "kylechui/nvim-surround",
        lazy = true,
        event = "VeryLazy",
        config = true
    },

    {
        'dhruvasagar/vim-table-mode',
        cmd = { "TableModeToggle", "TableModeEnable" },
        config = function()
            vim.g.table_mode_corner = '|'
        end
    },

    {
        "xzbdmw/colorful-menu.nvim",
        enabled = true,
        lazy = true,
        event = "VeryLazy",
        config = true,
    },

    {
        "josephburgess/nvumi",
        dependencies = { "folke/snacks.nvim" },
        opts = {
            virtual_text = "inline", -- "newline" or "inline"
            prefix = " = ", -- prefix shown before the output
            date_format = "uk", -- or: "uk", "us", "long"
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
