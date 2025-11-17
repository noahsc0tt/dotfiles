return {
    {
        'mrjones2014/smart-splits.nvim',
        lazy = true,
        event = "VeryLazy",
        opts = {
            ignored_buftypes = {
                'nofile',
                'quickfix',
                'prompt',
            },
            cursor_follows_swapped_bufs = true,
        },
        keys = {

            { "<C-h>",   function() require('smart-splits').move_cursor_left() end,  mode = { "n", } },
            { "<C-j>",   function() require('smart-splits').move_cursor_down() end,  mode = { "n", } },
            { "<C-k>",   function() require('smart-splits').move_cursor_up() end,    mode = { "n", } },
            { "<C-l>",   function() require('smart-splits').move_cursor_right() end, mode = { "n", } },
            { "<M-C-h>", function() require('smart-splits').resize_left(4) end,      mode = "n" },
            { "<M-C-l>", function() require('smart-splits').resize_right(4) end,     mode = "n" },
            { "<M-C-j>", function() require('smart-splits').resize_down(4) end,      mode = "n" },
            { "<M-C-k>", function() require('smart-splits').resize_up(4) end,        mode = "n" },
            {
                "zH",
                function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    require("smart-splits").swap_buf_left()
                    vim.api.nvim_win_set_cursor(0, pos)
                end,
                mode = "n"
            },
            {
                "zJ",
                function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    require("smart-splits").swap_buf_down()
                    vim.api.nvim_win_set_cursor(0, pos)
                end,
                mode = "n"
            },
            {
                "zK",
                function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    require("smart-splits").swap_buf_up()
                    vim.api.nvim_win_set_cursor(0, pos)
                end,
                mode = "n"
            },
            {
                "zL",
                function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    require("smart-splits").swap_buf_right()
                    vim.api.nvim_win_set_cursor(0, pos)
                end,
                mode = "n"
            },
        }

    },
}
