return {
    {
        'rcarriga/nvim-notify',
        lazy = true,
        event = "VeryLazy",
        cond = not vim.g.started_by_firenvim,

        opts = {
    render = "wrapped-compact",
    stages = "static",
    timeout = 3000,
}
    },
}
