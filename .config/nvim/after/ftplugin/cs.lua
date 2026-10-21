vim.keymap.set("n", "gd", function() require('omnisharp_extended').lsp_definition() end)
vim.keymap.set("n", "gr", function() require('omnisharp_extended').lsp_references() end)
vim.keymap.set("n", "gI", function() require('omnisharp_extended').lsp_implementation() end)
vim.keymap.set("n", "gt", function() require('omnisharp_extended').lsp_type_definition() end)
