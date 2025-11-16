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

{ "<C-h>", function() require('smart-splits').move_cursor_left() end, mode = { "n","i","v" } },
{ "<C-j>", function() require('smart-splits').move_cursor_down() end, mode = { "n","i","v" } },
{ "<C-k>", function() require('smart-splits').move_cursor_up() end, mode = { "n","i","v" } },
{ "<C-l>", function() require('smart-splits').move_cursor_right() end, mode = { "n","i","v" } },

{ "<M-C-h>", function() require('smart-splits').resize_left(4) end, mode = "n"},
{ "<M-C-l>", function() require('smart-splits').resize_right(4) end, mode = "n"},
{ "<M-C-j>", function() require('smart-splits').resize_down(4) end, mode = "n"},
{ "<M-C-k>", function() require('smart-splits').resize_up(4) end, mode = "n"},
}

    },
}
