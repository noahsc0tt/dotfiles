return {
    "carderne/pi-nvim",
    enabled = true,
    opts = {
        set_default_keymaps = false
    },
    keys = {
        { "<leader>i", "<cmd>Pi<CR>",       desc = "Pi", mode = "n" },
        { "<leader>i", ":'<,'>Pi<CR>",       desc = "Pi", mode = "v" },
    }
}
