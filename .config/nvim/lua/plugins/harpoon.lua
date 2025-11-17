return {
    {
        "theprimeagen/harpoon",
        cmd = "Harpoon",
        cond = not vim.g.started_by_firenvim,
        keys = {
            { "<leader>h", function() require('harpoon.ui').toggle_quick_menu() end, mode = "n" },
            {
                "<leader>H",
                function()
                    require('harpoon.mark').add_file()
                    vim.notify("Harpooned file")
                end,
                mode = "n"
            },
            { "<C-S-0>",     function() require('harpoon.ui').nav_file(1) end,         mode = "n" },
            { "<C-S-]>",     function() require('harpoon.ui').nav_file(2) end,         mode = "n" },
            { "<C-S-=>",     function() require('harpoon.ui').nav_file(3) end,         mode = "n" },
            { "<C-;>",    function() require('harpoon.ui').nav_file(4) end,         mode = "n" },
        }
    },
}
