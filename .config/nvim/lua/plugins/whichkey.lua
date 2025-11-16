return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
opts = {
    preset = "helix",
    win = {
        no_overlap = true,
        border = "none",
        padding = { 0, 1, 0, 0 },
    },
    show_keys = true,
    show_help = false,
    plugins = {
        presets = {
            motions = false,
            operators = false,
            text_objects = false,
        },
    },
    delay = 400,
    defer = function(ctx)
        if vim.list_contains({ "d", "y", "c", }, ctx.operator) then
            return true
        end
        return vim.list_contains({ "<C-V>", "V", "v" }, ctx.mode)
    end,
},

keys = {
{ "<C-S-/>", "<cmd>WhichKey<CR>", mode = { "n", "o", "i", "v", } },
}
}
}
