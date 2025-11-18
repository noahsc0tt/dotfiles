return {
    {
        "windwp/nvim-autopairs",
        enabled = false,
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup {}
            require("nvim-autopairs").remove_rule("'")
            require("nvim-autopairs").remove_rule('"')
            require("nvim-autopairs").remove_rule('`')
            require("nvim-autopairs").remove_rule('```')
        end,
    }

}
