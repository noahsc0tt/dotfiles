return {
    {
        "bkad/CamelCaseMotion",
        lazy = true,
        event = "VeryLazy",
        keys = {
            { "\\w",  "<Plug>CamelCaseMotion_w",  mode = { "n", "v", } },
            { "\\b",  "<Plug>CamelCaseMotion_b",  mode = { "n", "v", } },
            { "\\e",  "<Plug>CamelCaseMotion_e",  mode = { "n", "v", } },
            { "\\ge", "<Plug>CamelCaseMotion_ge", mode = { "n", "v", } },
            { "\\iw", "<Plug>CamelCaseMotion_iw", mode = { "v", } },
            { "\\ib", "<Plug>CamelCaseMotion_ib", mode = { "v", } },
            { "\\ie", "<Plug>CamelCaseMotion_ie", mode = { "v", } },
            { "<leader>w",  "<Plug>CamelCaseMotion_w",  mode = { "o" } },
            { "<leader>b",  "<Plug>CamelCaseMotion_b",  mode = { "o" } },
            { "<leader>e",  "<Plug>CamelCaseMotion_e",  mode = { "o" } },
            { "<leader>ge", "<Plug>CamelCaseMotion_ge", mode = { "o" } },
            { "<leader>iw", "<Plug>CamelCaseMotion_iw", mode = { "o" } },
            { "<leader>ib", "<Plug>CamelCaseMotion_ib", mode = { "o" } },
            { "<leader>ie", "<Plug>CamelCaseMotion_ie", mode = { "o" } },
        },
    }
}
