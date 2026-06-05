return {
    "pablopunk/pi.nvim",
    opts = {
        provider = "opencode",
        model = "opencode/big-pickle",
        max_context_lines = 300,
        max_context_bytes = 24000,
        selection_context_lines = 40,
        log_path = "/tmp/pi-nvim.log",
        skills = true,
        extensions = true,
        tools = true,
    },
    keys = {
        { "<leader>o", "<cmd>PiAsk<CR>",          desc = "Ask Pi",    mode = "n" },
        { "<leader>o", "<cmd>PiAskSelection<CR>", desc = "Ask Pi",    mode = { "v", "s", "x" } },
        { "<leader>O", "<cmd>PiCancel<CR>",       desc = "Cancel Pi", mode = "n" },
    }
}
