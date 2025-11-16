return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
require("nvim-autopairs").remove_rule("'")
require("nvim-autopairs").remove_rule('"')
require("nvim-autopairs").remove_rule('`')
require("nvim-autopairs").remove_rule('```')
end,
}

    }

