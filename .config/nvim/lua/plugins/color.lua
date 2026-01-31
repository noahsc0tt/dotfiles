return {
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure it loads immediately
        priority = 1000, -- load before other plugins
        config = function()
            vim.cmd.colorscheme("tokyonight-storm")
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            --
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#24283b", })

            -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#82A1F1" })
            -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#af6bec0" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#3B4261", bold = true })

            -- local transparent_groups = {
            --     "BufferLineFill",
            --     "BufferLineBuffer",
            --     "BufferLineModified",
            --     "BufferLineBackground",
            --     "BufferLineDiagnostic",
            --     "BufferLineWarning",
            --     "BufferLineOffsetSeparator",
            --     "BufferLineIndicator",
            --     "BufferLineHint",
            --     "BufferLineInfo",
            --     "BufferLineError",
            --
            --     "BufferLineFillVisible",
            --     "BufferLineBufferVisible",
            --     "BufferLineModifiedVisible",
            --     "BufferLineBackgroundVisible",
            --     "BufferLineDiagnosticVisible",
            --     "BufferLineWarningVisible",
            --     "BufferLineOffsetSeparatorVisible",
            --     "BufferLineIndicatorVisible",
            --     "BufferLineHintVisible",
            --     "BufferLineInfoVisible",
            --     "BufferLineErrorVisible",
            --
            -- }
            -- for _, group in ipairs(transparent_groups) do
            --     local current = vim.api.nvim_get_hl(0, { name = group })
            --     current.bg = 0x24283b
            --     vim.api.nvim_set_hl(0, group, current)
            -- end
            --
            -- local dark_groups = {
            --     "BufferLineFillSelected",
            --     "BufferLineBufferSelected",
            --     "BufferLineBackgroundSelected",
            --     "BufferLineDiagnosticSelected",
            --     "BufferLineGroupLabelSelected",
            --     "BufferLineCloseButtonSelected",
            --     "BufferLineTruncMarkerSelected",
            --     "BufferLineGroupSeparatorSelected",
            --     "BufferLineWarningSelected",
            --     "BufferLineOffsetSeparatorSelected",
            --     "BufferLineIndicatorSelected",
            --     "BufferLineHintSelected",
            --     "BufferLineInfoSelected",
            --     "BufferLineErrorSelected",
            --     -- "BufferLineDiagnosticSelected",
            --     -- "BufferLineInfoDiagnosticSelected",
            --     -- "BufferLineHintDiagnosticSelected",
            --     -- "BufferLineWarningDiagnosticSelected",
            --     -- "BufferLineErrorDiagnosticSelected",
            -- }
            -- for _, group in ipairs(dark_groups) do
            --     local current = vim.api.nvim_get_hl(0, { name = group })
            --     current.bg = 0x1B1E2C -- use decimal or hex
            --     vim.api.nvim_set_hl(0, group, current)
            -- end
            vim.api.nvim_set_hl(0, "BufferlineFill", {
                bg = "#212436",
                default = true,
                fg = "#565F89"
            })
            vim.api.nvim_set_hl(0, "BufferlineBufferSelected", {
                bg = "#24283B",
                bold = true,
                cterm = {
                    bold = true,
                    italic = true
                },
                default = true,
                fg = "#0DB9D7",
                italic = true
            })

            vim.cmd [[highlight Visual guibg='Grey' guifg='White']]

            vim.cmd [[highlight Search guibg='Purple' guifg='White']]
            vim.cmd [[highlight CurSearch guibg='Magenta' guifg='Black']]
            vim.cmd [[highlight IncSearch guibg='Magenta' guifg='Black']]

            vim.api.nvim_set_hl(0, "FoldText", { bold = true, italic = true, })
        end,
        cond = not vim.g.started_by_firenvim,
    },
}
