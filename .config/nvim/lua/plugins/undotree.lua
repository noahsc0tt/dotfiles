return {
    {
        "mbbill/undotree",
        lazy = true,
        event = "VeryLazy",
        keys = {
        { '<leader>u', vim.cmd.UndotreeToggle, mode = 'n'},
    }
    },
}
