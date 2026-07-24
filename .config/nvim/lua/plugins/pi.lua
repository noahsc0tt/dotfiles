return {
    "carderne/pi-nvim",
    opts = {
        set_default_keymaps = false
    },
    keys = {
        { "<leader>O", "<cmd>Pi<CR>",       desc = "Pi", mode = "n" },
        { "<leader>O", ":'<,'>Pi<CR>",       desc = "Pi", mode = "v" },
    }
}
