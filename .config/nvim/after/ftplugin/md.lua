require('snacks').keymap.set("n", "<leader>op", ":MarkdownPreview<CR>", { desc = "Preview markdown", ft = "markdown" })
require('snacks').keymap.set("n", "<leader>lb", "o<br><Esc>", { desc = "Insert line break in markdown", ft = "markdown" })

vim.cmd("Markview enable")
