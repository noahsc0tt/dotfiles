local opencode = require("opencode")

vim.g.opencode_opts = {
    -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
}

-- Required for `opts.auto_reload`.
vim.o.autoread = true

vim.keymap.set({ "n", "x" }, "<leader>oa", function() opencode.ask("@this: ", { submit = true }) end,
    { desc = "Ask opencode" })

vim.keymap.set({ "n", "x" }, "<leader>op", function() opencode.select() end, { desc = "Execute opencode action…" })

vim.keymap.set({ "n", "x" }, "ga", function() opencode.prompt("@this") end, { desc = "Add to opencode" })

vim.keymap.set("n", "<leader>oc", function() opencode.toggle() end, { desc = "Toggle opencode" })

vim.keymap.set({"t", "n", "v", "i"}, "<S-C-u>", function() opencode.command("messages_half_page_up") end,
    { desc = "opencode half page up" })

vim.keymap.set({"t", "n", "v", "i"}, "<S-C-d>", function() opencode.command("messages_half_page_down") end,
    { desc = "opencode half page down" })
