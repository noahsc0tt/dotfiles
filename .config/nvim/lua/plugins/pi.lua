return {
    "carderne/pi-nvim",
    opts = {
        set_default_keymaps = false
    },
    keys = {
        { "<leader>i", "<cmd>Pi<CR>",       desc = "Pi", mode = "n" },
        { "<leader>i", ":'<,'>Pi<CR>",       desc = "Pi", mode = "v" },
    }
}
