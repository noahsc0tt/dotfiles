local chat = require("CopilotChat")

vim.keymap.set('i', '<C-i>f', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.keymap.set({"n", "i"}, "<C-i>e", "<cmd>Copilot enable<CR>");
vim.keymap.set({"n", "i"}, "<C-i>d", "<cmd>Copilot disable<CR>");
vim.keymap.set("i", "<C-i>r", "<Plug>(copilot-dismiss)");
vim.keymap.set("i", "<C-i>s", "<Plug>(copilot-suggest)");
vim.keymap.set("i", "<C-i>n", "<Plug>(copilot-next)");
vim.keymap.set("i", "<C-i>p", "<Plug>(copilot-prev)");
vim.keymap.set('i', '<C-i>w', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-i>l', '<Plug>(copilot-accept-line)')
vim.keymap.set({"n", "i"}, "<C-i>c", chat.toggle)
vim.keymap.set({"n", "i"}, "<C-i>x", '<cmd>CopilotChatStop<CR>')

vim.g.copilot_filetypes = {
    ["*"] = true,
    ["markdown"] = false,
    ["yaml"] = false,
    ["toml"] = false,
    ["csv"] = false,
    ["txt"] = false,
}


