vim.keymap.set("n", "<Del>", "<Nop>")

vim.keymap.set({ "n", "v", "o" }, "<Del>w", "<Plug>CamelCaseMotion_w", { silent = true })
vim.keymap.set({ "n", "v", "o"}, "<Del>b", "<Plug>CamelCaseMotion_b", {silent = true})
vim.keymap.set({ "n", "v", "o"}, "<Del>e", "<Plug>CamelCaseMotion_e", {silent = true})
vim.keymap.set({ "n", "v", "o"}, "<Del>ge", "<Plug>CamelCaseMotion_ge", {silent = true})
vim.keymap.set({ "v", "o"}, "<Del>iw", "<Plug>CamelCaseMotion_iw", {silent = true})
vim.keymap.set({ "v", "o"}, "<Del>ib", "<Plug>CamelCaseMotion_ib", {silent = true})
vim.keymap.set({ "v", "o"}, "<Del>ie", "<Plug>CamelCaseMotion_ie", {silent = true})
