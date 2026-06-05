return {
    {
        "pwntester/octo.nvim",
        cmd = "Octo",
        opts = {
            picker = "snacks",
            enable_builtin = true,
        },
        keys = {
            {
                "<leader>G",
                "<CMD>Octo<CR>",
                desc = "Octo",
            },
            {
                "<leader>g/",
                function()
                    require("octo.utils").create_base_search_command { include_current_repo = true }
                end,
                desc = "Search GitHub",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/snacks.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    }
}
