return {
    {
    "aznhe21/actions-preview.nvim",
    lazy = true,
    event = "VeryLazy",
    cond = not vim.g.started_by_firenvim,
    opts = {
        backend = { "snacks", },
        snacks = {
            layout = { preset = "clean" },
        },
    },
    keys = {
        { "<leader>la", function() require("actions-preview").code_actions() end, mode = {"n", "x"}, desc = "Code Actions" },
    }
},
}
