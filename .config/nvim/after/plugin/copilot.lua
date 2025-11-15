-- local chat = require("CopilotChat")
-- require('snacks').keymap.set({"n", "i"}, "<C-i>c", chat.toggle)
-- require('snacks').keymap.set({"n", "i"}, "<C-i>x", '<cmd>CopilotChatStop<CR>')

require('snacks').keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
require('snacks').keymap.set("i", "<C-i><C-e>", "<cmd>Copilot enable<CR>");
require('snacks').keymap.set("i", "<C-i><C-d>", "<cmd>Copilot disable<CR>");
require('snacks').keymap.set("i", "<C-i><C-r>", "<Plug>(copilot-dismiss)");
require('snacks').keymap.set("i", "<C-i><C-s>", "<Plug>(copilot-suggest)");
require('snacks').keymap.set("i", "<C-i><C-n>", "<Plug>(copilot-next)");
require('snacks').keymap.set("i", "<C-i><C-p>", "<Plug>(copilot-prev)");
require('snacks').keymap.set('i', '<C-i><C-w>', '<Plug>(copilot-accept-word)')
require('snacks').keymap.set('i', '<C-i><C-l>', '<Plug>(copilot-accept-line)')

vim.g.copilot_filetypes = {
    ["*"] = true,
    ["markdown"] = false,
    ["typst"] = false,
    ["yaml"] = false,
    ["toml"] = false,
    ["csv"] = false,
    ["txt"] = false,
}


