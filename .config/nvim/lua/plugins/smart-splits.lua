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
            swap = {
                -- follow the buffer into its new window
                move_cursor = true,
            },
        },
        keys = {

            { "<C-s><C-h>", function() require('smart-splits').move_cursor_left() end,  mode = { "n", } },
            { "<C-s><C-j>", function() require('smart-splits').move_cursor_down() end,  mode = { "n", } },
            { "<C-s><C-k>", function() require('smart-splits').move_cursor_up() end,    mode = { "n", } },
            { "<C-s><C-l>", function() require('smart-splits').move_cursor_right() end, mode = { "n", } },
            { "<C-S-h>",    function() require('smart-splits').resize_left(4) end,      mode = "n" },
            { "<C-S-l>",    function() require('smart-splits').resize_right(4) end,     mode = "n" },
            { "<C-S-j>",    function() require('smart-splits').resize_down(4) end,      mode = "n" },
            { "<C-S-k>",    function() require('smart-splits').resize_up(4) end,        mode = "n" },
            { "zH", function() require("smart-splits").swap_buf_left() end, mode = "n" },
            { "zJ", function() require("smart-splits").swap_buf_down() end, mode = "n" },
            { "zK", function() require("smart-splits").swap_buf_up() end, mode = "n" },
            { "zL", function() require("smart-splits").swap_buf_right() end, mode = "n" },
        }

    },
}
