return {
    {
        "theprimeagen/harpoon",
        cmd = "Harpoon",
        cond = not vim.g.started_by_firenvim,
        keys = {

{ "<leader>hp", require('harpoon.ui').toggle_quick_menu, mode = "n"},
{ "<leader>ha", require('harpoon.mark').add_file, mode = "n"},
{ "<leader>h1", function() require('harpoon.ui').nav_file(1) end, mode = "n"},
{ "<leader>h2", function() require('harpoon.ui').nav_file(2) end, mode = "n"},
{ "<leader>h3", function() require('harpoon.ui').nav_file(3) end, mode = "n"},
{ "<leader>h4", function() require('harpoon.ui').nav_file(4) end, mode = "n"},
{ "<leader>h5", function() require('harpoon.ui').nav_file(5) end, mode = "n"},
}
    },
}
