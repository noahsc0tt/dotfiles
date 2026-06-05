return {
    {
        "chrisgrieser/nvim-origami",
        lazy = false,
        init = function()
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
        end,
        opts = {
            useLspFoldsWithTreesitterFallback = { enabled = true },
            pauseFoldsOnSearch = true,
            foldtext = {
                enabled = true,
                padding = { width = 4 },
                lineCount = {
                    template = "%d lines", -- `%d` is replaced with the number of folded lines
                    hlgroup = "FoldText",
                },
                diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
                gitsignsCount = true,    -- requires `gitsigns.nvim`
                disableOnFt = { "snacks_picker_input" }, ---@type string[]
            },
            autoFold = {
                enabled = true,
                kinds = { "comment", "imports" },
            },
            foldKeymaps = {
                setup = true, -- modifies `h`, `l`, and `$`
                closeOnlyOnFirstColumn = false,
            },
        }
    },

    {
        'anuvyklack/fold-preview.nvim',
        lazy = true,
        event = 'VeryLazy',
        opts = {
            auto = false,
            default_keybindings = false,
            border = 'single',
        },
        keys = {
            { 'zo',    function() require('fold-preview').show_preview() end,  desc = 'Preview fold' },
            { '<C-c>', function() require('fold-preview').close_preview() end, desc = 'Close fold preview' },
            { '<Esc>', function() require('fold-preview').close_preview() end, desc = 'Close fold preview' },
        }
    }
}
