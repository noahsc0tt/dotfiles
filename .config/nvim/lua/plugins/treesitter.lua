return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local langs = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown",
                "markdown_inline", "javascript", "typescript", "python", "html", "css",
                "json", "c_sharp", "java", "haskell", "razor", "typst", "sql" }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = langs,
                callback = function()
                    if vim.bo.filetype == "razor" then
                        vim.treesitter.start(0, "html")
                    else
                        vim.treesitter.start()
                    end
                end,
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        ft = "cshtml",
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    -- Defaults
                    enable_close = false,        -- Auto close tags
                    enable_rename = true,        -- Auto rename pairs of tags
                    enable_close_on_slash = true -- Auto close on trailing </
                }
            })
        end
    },
}
