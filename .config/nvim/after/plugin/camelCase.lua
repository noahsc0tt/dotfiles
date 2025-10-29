vim.keymap.set("n", "<C-BS>", "<Nop>")

vim.keymap.set({ "n", "v", "o" }, "<C-BS>w", "<Plug>CamelCaseMotion_w", { silent = true })
vim.keymap.set({ "n", "v", "o"}, "<C-BS>b", "<Plug>CamelCaseMotion_b", {silent = true})
vim.keymap.set({ "n", "v", "o"}, "<C-BS>e", "<Plug>CamelCaseMotion_e", {silent = true})
vim.keymap.set({ "n", "v", "o"}, "<C-BS>ge", "<Plug>CamelCaseMotion_ge", {silent = true})
vim.keymap.set({ "v", "o"}, "<C-BS>iw", "<Plug>CamelCaseMotion_iw", {silent = true})
vim.keymap.set({ "v", "o"}, "<C-BS>ib", "<Plug>CamelCaseMotion_ib", {silent = true})
vim.keymap.set({ "v", "o"}, "<C-BS>ie", "<Plug>CamelCaseMotion_ie", {silent = true})
