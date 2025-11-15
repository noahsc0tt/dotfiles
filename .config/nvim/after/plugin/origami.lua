local opts = {
    useLspFoldsWithTreesitterFallback = true,
    pauseFoldsOnSearch = true,
    foldtext = {
        enabled = true,
        padding = 4,
        lineCount = {
            template = "%d lines folded", -- `%d` is replaced with the number of folded lines
            hlgroup = "FoldText",
        },
        diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
        gitsignsCount = true, -- requires `gitsigns.nvim`
        disableOnFt = { "snacks_picker_input" }, ---@type string[]
    },
    autoFold = {
        enabled = true,
        kinds = { "comment", "imports" },
    },
    foldKeymaps = {
        setup = true, -- modifies `h`, `l`, and `$`
        hOnlyOpensOnFirstColumn = false,
    },
}
require("origami").setup(opts)

-- require('snacks').keymap.set("n", "<leader>vf", function()
--     require("origami").setup(opts)
--     vim.notify("Reloaded Origami")
-- end, { desc = "Reapply Origami folding", silent = false })
