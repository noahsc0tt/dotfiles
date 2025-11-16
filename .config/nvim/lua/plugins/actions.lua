return {
    {
    "aznhe21/actions-preview.nvim",
    lazy = true,
    event = "VeryLazy",
    cond = not vim.g.started_by_firenvim,
    opts = {
        backend = { "telescope", },
        telescope = {
            layout_strategy = "vertical",
            layout_config = {
                prompt_position = "top",
                width = { padding = 0 },
                height = { padding = 0 },
            },
        },
    },
    keys = {
        { "<leader>ac", function() require("actions-preview").code_actions() end, mode = {"n", "v"}, desc = "Code Actions" },
    }
},
}
