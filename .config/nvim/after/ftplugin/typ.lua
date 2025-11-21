require('snacks').keymap.set("n", "<leader>op", ":TypstPreview<CR>", { desc = "Preview typst", ft = "typst" })
require('snacks').keymap.set("n", "<leader>lb", "o#v(1em)<Esc>", { desc = "Insert line break in typst", ft = "typst" })

vim.cmd("Markview enable")
