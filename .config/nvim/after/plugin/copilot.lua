-- local chat = require("CopilotChat")
-- vim.keymap.set({"n", "i"}, "<C-i>c", chat.toggle)
-- vim.keymap.set({"n", "i"}, "<C-i>x", '<cmd>CopilotChatStop<CR>')

vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-i><C-e>", "<cmd>Copilot enable<CR>");
vim.keymap.set("i", "<C-i><C-d>", "<cmd>Copilot disable<CR>");
vim.keymap.set("i", "<C-i><C-r>", "<Plug>(copilot-dismiss)");
vim.keymap.set("i", "<C-i><C-s>", "<Plug>(copilot-suggest)");
vim.keymap.set("i", "<C-i><C-n>", "<Plug>(copilot-next)");
vim.keymap.set("i", "<C-i><C-p>", "<Plug>(copilot-prev)");
vim.keymap.set('i', '<C-i><C-w>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-i><C-l>', '<Plug>(copilot-accept-line)')

vim.g.copilot_filetypes = {
    ["*"] = true,
    ["markdown"] = false,
    ["typst"] = false,
    ["yaml"] = false,
    ["toml"] = false,
    ["csv"] = false,
    ["txt"] = false,
}


