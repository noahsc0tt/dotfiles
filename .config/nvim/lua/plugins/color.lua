return {
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure it loads immediately
        priority = 1000, -- load before other plugins
        opts = {
            style = "storm", },
        config = function()
            vim.cmd.colorscheme("tokyonight-storm")
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#82A1F1" })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#82A1F1" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#af6be0", bold = true })

            vim.cmd [[highlight Visual guibg='Grey' guifg='White']]

            vim.cmd [[highlight Search guibg='Purple' guifg='White']]
            vim.cmd [[highlight CurSearch guibg='Magenta' guifg='Black']]
            vim.cmd [[highlight IncSearch guibg='Magenta' guifg='Black']]

            -- local groups = {
            --     "NotifyINFOIcon",
            --     "NotifyWARNIcon",
            --     "NotifyDEBUGIcon",
            --     "NotifyERRORIcon",
            --     "NotifyINFOTitle",
            --     "NotifyTRACEIcon",
            --     "NotifyWARNTitle",
            --     "NotifyDEBUGTitle",
            --     "NotifyERRORTitle",
            --     "NotifyTRACETitle",
            --     "NotifyINFOBorder",
            --     "NotifyWARNBorder",
            --     "NotifyDEBUGBorder",
            --     "NotifyERRORBorder",
            --     "NotifyTRACEBorder",
            --     "NotifyINFOBody",
            --     "NotifyWARNBody",
            --     "NotifyDEBUGBody",
            --     "NotifyERRORBody",
            --     "NotifyTRACEBody",
            --     "NotifyBackground",
            --     "NotifyLogTitle",
            --     "NotifyINFOIcon3",
            --     "NotifyINFOIcon9",
            --     "NotifyINFOTitle3",
            --     "NotifyINFOTitle9",
            --     -- "NotifyINFOBorder3",
            --     -- "NotifyINFOBorder9",
            --     "NotifyLogTime",
            --     "NotifyINF0Body3", -- keeping your spelling
            --     "NotifyINFOBody9",
            -- }
            --
            -- for _, g in ipairs(groups) do
            --     vim.api.nvim_set_hl(0, g, { bg = "none" })
            -- end

            --vim.api.nvim_set_hl(0, "Folded", { bg = "#7555AE", fg = 'Purple', })
            vim.api.nvim_set_hl(0, "FoldText", { bold = true, italic = true, })
        end,
        cond = not vim.g.started_by_firenvim,
    },
}
