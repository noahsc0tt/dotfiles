return {
    {
        "NickvanDyke/opencode.nvim",
        cond = not vim.g.started_by_firenvim,
        keys = {

            { "<leader>oa", function() require('opencode').ask("@this: ", { submit = true }) end, desc = "Ask opencode", mode = { "n", "x" } },

            { "<leader>op", function() require('opencode').select() end, desc = "Execute opencode action…", mode = { "n", "x" } },

            { "gO", function() require('opencode').prompt("@this") end, desc = "Add to opencode", mode = { "n", "x" } },

            { "<leader>oc", function() require('opencode').toggle() end, desc = "Toggle opencode", mode = "n" },

            { "<M-C-u>", function() require('opencode').command("messages_half_page_up") end, desc = "opencode half page up", mode = { "t", "n", "x", "i" } },

            { "<M-C-d>", function() require('opencode').command("messages_half_page_down") end, desc = "opencode half page down", mode = { "t", "n", "x", "i" } },
        }
    },
}
