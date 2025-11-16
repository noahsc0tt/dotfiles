return {
    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            vim.g.copilot_no_tab_map = true

            vim.g.copilot_filetypes = {
                ["*"] = true,
                ["markdown"] = false,
                ["typst"] = false,
                ["yaml"] = false,
                ["toml"] = false,
                ["csv"] = false,
                ["txt"] = false,
            }
        end,
        keys = {
        { "<C-i><C-e>", "<cmd>Copilot enable<CR>", mode = "i"},
        { "<C-i><C-d>", "<cmd>Copilot disable<CR>", mode = "i"},
        { "<C-i><C-r>", "<Plug>(copilot-dismiss)", mode = "i"},
        { "<C-i><C-s>", "<Plug>(copilot-suggest)", mode = "i"},
        { "<C-i><C-n>", "<Plug>(copilot-next)", mode = "i"},
        { "<C-i><C-p>", "<Plug>(copilot-prev)", mode = "i"},
        { '<C-i><C-w>', '<Plug>(copilot-accept-word)', mode = "i"},
        { '<C-i><C-l>', '<Plug>(copilot-accept-line)', mode = "i"},
        },
    },
}

