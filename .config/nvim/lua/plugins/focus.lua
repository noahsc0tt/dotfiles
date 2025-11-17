return {
    {
        'nvim-focus/focus.nvim',
        lazy = true,
        event = "VeryLazy",
        opts = {
            enable = true,           -- Enable module
            commands = true,         -- Create Focus commands
            autoresize = {
                enable = true,       -- Enable or disable auto-resizing of splits
                width = 0,           -- Force width for the focused window
                height = 0,          -- Force height for the focused window
                minwidth = 0,        -- Force minimum width for the unfocused window
                minheight = 0,       -- Force minimum height for the unfocused window
                focusedwindow_minwidth = 0, --Force minimum width for the focused window
                focusedwindow_minheight = 0, --Force minimum height for the focused window
                height_quickfix = 10, -- Set the height of quickfix panel
            },
            split = {
                bufnew = false, -- Create blank buffer for new split windows
                tmux = false, -- Create tmux splits instead of neovim splits
            },
            ui = {
                number = false,           -- Display line numbers in the focussed window only
                relativenumber = true,    -- Display relative line numbers in the focussed window only
                hybridnumber = true,      -- Display hybrid line numbers in the focussed window only
                absolutenumber_unfocussed = true, -- Preserve absolute numbers in the unfocussed windows

                cursorline = false,       -- Display a cursorline in the focussed window only
            }
        },


        keys = {
            { "ze", function() vim.cmd("FocusEqualise") end,  mode = "n", desc = "Equalise Splits" },
            { "zF", function() vim.cmd("FocusDisable") end,   mode = "n", desc = "Disable Focus" },
            {
                "zf",
                function()
                    vim.cmd("FocusEnable")
                    vim.cmd("FocusAutoresize")
                end,
                mode = "n",
                desc = "Enable Focus and Resize"
            },
            { "zh", function() vim.cmd("FocusSplitLeft") end,  mode = "n" },
            { "zj", function() vim.cmd("FocusSplitDown") end,  mode = "n" },
            { "zk", function() vim.cmd("FocusSplitUp") end,    mode = "n" },
            { "zl", function() vim.cmd("FocusSplitRight") end, mode = "n" },

        }
    },
}
