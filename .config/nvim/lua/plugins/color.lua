return {
{
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure it loads immediately
        priority = 1000, -- load before other plugins
        opts = {
            style = "night",
            on_highlights = function(hl, c)
                local prompt = c.bg
                hl.TelescopeNormal = { bg = c.bg, fg = c.fg }
                hl.TelescopeBorder = { bg = c.bg, fg = c.bg }
                hl.TelescopePromptNormal = { bg = prompt }
                hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
                hl.TelescopePromptTitle = { bg = c.bg_highlight, fg = c.fg }
                hl.TelescopePreviewTitle = { bg = c.bg, fg = c.bg }
                hl.TelescopeResultsTitle = { bg = c.bg, fg = c.bg }
                hl.NoiceCmdlinePopupBorder = { bg = c.bg, fg = c.bg }
            end,
        },
config = function()
            vim.cmd.colorscheme("tokyonight-night")
            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#82A1F1" })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#82A1F1" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#af6be0", bold = true })
vim.cmd [[highlight Visual guibg='Grey' guifg='White']]
vim.cmd [[highlight Search guibg='Purple' guifg='White']]
vim.cmd [[highlight CurSearch guibg='Magenta' guifg='Black']]
vim.cmd [[highlight IncSearch guibg='Magenta' guifg='Black']]

--vim.api.nvim_set_hl(0, "Folded", { bg = "#7555AE", fg = 'Purple', })
vim.api.nvim_set_hl(0, "FoldText", { bold = true, italic = true, })
        end,
        cond = not vim.g.started_by_firenvim,
    },
}
