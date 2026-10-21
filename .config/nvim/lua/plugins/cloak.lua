return {
    'laytan/cloak.nvim',
    lazy = true,
    event = "VeryLazy",
    config = function() require('cloak').setup({ enabled = true }) end
}
