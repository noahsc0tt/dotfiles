require("origami").setup {
	useLspFoldsWithTreesitterFallback = true,
	pauseFoldsOnSearch = true,
	foldtext = {
		enabled = true,
		padding = 3,
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
