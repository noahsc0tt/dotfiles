vim.cmd [[highlight Visual guibg='Grey' guifg='White']]
vim.cmd [[highlight Search guibg='Purple' guifg='White']]
vim.cmd [[highlight CurSearch guibg='Magenta' guifg='Black']]
vim.cmd [[highlight IncSearch guibg='Magenta' guifg='Black']]

--vim.api.nvim_set_hl(0, "Folded", { bg = "#7555AE", fg = 'Purple', })
vim.api.nvim_set_hl(0, "FoldText", { fg = "#CDD1D0", bg = "NONE", bold = true, italic = true, })
