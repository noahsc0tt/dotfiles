return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { 'saghen/blink.cmp' },
        },
        config = function()
            vim.env.PATH = vim.env.HOME .. "/.local/share/nvim/mason/bin:" .. vim.env.PATH
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            vim.lsp.config('lua_ls', {
                -- root_dir = require('lspconfig.util').root_pattern(
                --         '.luarc.json', '.luacheckrc', '.stylua.toml', 'lua/', '.git'
                --     ),
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "require", "_G", },
                        },
                    },
                },
                capabilities = capabilities,
            })
            vim.lsp.enable('lua_ls')

            vim.lsp.config('basedpyright', {
                settings = {
                    basedpyright = {
                        python = {
                            pythonPath = vim.fn.trim(vim.fn.system("pyenv which python")),
                        },
                        analysis = {
                            extraPaths = { "/Users/nscott/.config/pyright-stubs" },
                            typeCheckingMode = "basic",
                            reportUnnecessaryTypeIgnoreComment = true,
                            reportPrivateUsage = true,
                        },
                    }
                },
                capabilities = capabilities,
            })
            vim.lsp.enable('basedpyright')

            vim.lsp.config('jdtls', {
                cmd_env = {
                    JAVA_HOME = "/opt/homebrew/opt/openjdk",
                    PATH = "/opt/homebrew/opt/openjdk/bin:" .. vim.env.PATH,
                },
                capabilities = capabilities,
            })
            vim.lsp.enable('jdtls')

            vim.lsp.config('bashls', { filetypes = { "sh", "zsh", "bash" }, capabilities = capabilities, })
            vim.lsp.enable('bashls')

            vim.lsp.enable('ruby-lsp')
            vim.lsp.config('ruby-lsp', {
                cmd = { "ruby-lsp" },
                filetypes = { "ruby" },
                capabilities = capabilities,
            })

            vim.lsp.config('hls', {
                cmd = { "haskell-language-server-wrapper", "--lsp" },
                filetypes = { "haskell", "lhaskell" },
                capabilities = capabilities,
            })
            vim.lsp.enable('hls')

            vim.lsp.enable('gopls')
            vim.lsp.enable('eslint')
            vim.lsp.enable('clangd')
            vim.lsp.enable('ts_ls')
            vim.lsp.enable('jsonls')
            vim.lsp.enable('omnisharp')

            vim.lsp.config('ltex_ls_plus', {
                filetypes = { "text", "markdown", "tex", "typst" },
                settings = {
                    ltex = {
                        language = "en-GB",
                    },
                },
            })
            vim.lsp.enable('ltex_ls_plus')

            vim.lsp.config("tinymist", {
                cmd = { "tinymist" },
                filetypes = { "typst" },
                root_markers = { "typst.toml", ".git" },
            })
            vim.lsp.enable("tinymist")

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                float = {
                    border = "rounded",
                    prefix = " • ",
                    severity_sort = true,
                },
            })
        end,
        keys = {
            -- Diagnostic actions
            -- { "<leader>ld", vim.diagnostic.setloclist,   mode = "n", desc = "Open diagnostics" },
            { "gp",         function() vim.diagnostic.jump({ count = -1 }) end,                         mode = "n",                    desc = "Previous diagnostic" },
            { "gn",         function() vim.diagnostic.jump({ count = 1 }) end,                         mode = "n",                    desc = "Next diagnostic" },
            { "<leader>ld", vim.diagnostic.open_float,                                       mode = "n",                    desc = "Open diagnostic float" },
            { "gd",         function() require('snacks').picker.lsp_definitions() end,       desc = "Goto Definition" },
            { "gD",         function() require('snacks').picker.lsp_declarations() end,      desc = "Goto Declaration" },
            { "gr",         function() require('snacks').picker.lsp_references() end,        nowait = true,                 desc = "References" },
            { "<leader>li", function() require('snacks').picker.lsp_implementations() end,   desc = "Goto Implementation" },
            { "gI",         function() require('snacks').picker.lsp_implementations() end,   desc = "Goto Implementation" },
            { "gt",         function() require('snacks').picker.lsp_type_definitions() end,  desc = "Goto Type Definition" },
            -- { "gc",         function() require('snacks').picker.lsp_incoming_calls() end,    desc = "Calls Incoming" },
            -- { "gC",         function() require('snacks').picker.lsp_outgoing_calls() end,    desc = "Calls Outgoing" },
            { "<leader>ls", function() require('snacks').picker.lsp_symbols() end,           desc = "LSP Symbols" },
            { "<leader>lS", function() require('snacks').picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
            { "<leader>l,", function() require('snacks').picker.lsp_config() end,            desc = "LSP Info" },

            -- Code actions
            -- { "gd",         vim.lsp.buf.definition,      mode = "n", desc = "Go to definition" },
            -- { "gD",         vim.lsp.buf.declaration,     mode = "n", desc = "Go to declaration" },
            -- { "gt",         vim.lsp.buf.type_definition, mode = "n", desc = "Go to type definition" },
            -- { "<leader>li", vim.lsp.buf.implementation,  mode = "n", desc = "Go to implementation" },
            { "<leader>?",  vim.lsp.buf.signature_help,                                      mode = "n",                    desc = "Signature help" },
            { "<C-S-/>",    vim.lsp.buf.signature_help,                                      mode = "i",                    desc = "Signature help" },
            { "<leader>k", require("noice.lsp").hover,                                               mode = "n",                    desc = "Hover documentation" },
            { "<M-C-S-k>",      vim.lsp.buf.hover,                                               mode = { "n", "i" },           desc = "Hover documentation" },

            -- require('snacks').keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
            {
                "<leader>r",
                function()
                    vim.cmd("w")
                    vim.lsp.buf.rename()
                end,
                mode = "n",
                desc = "Rename symbol"
            },


            {
                "<leader>lw",
                function()
                    vim.diagnostic.config({
                        virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
                        underline = { severity = { min = vim.diagnostic.severity.ERROR } },
                        signs = { severity = { min = vim.diagnostic.severity.ERROR } },
                        update_in_insert = false,
                        float = {
                            border = "rounded",
                            prefix = " • ",
                            severity_sort = true,
                        },
                    })
                    print("Warnings disabled")
                end,
                mode = "n",
                desc = "Disable warnings"
            },

            {
                "<leader>le",
                function()
                    vim.diagnostic.config({
                        virtual_text = false,
                        underline = false,
                        signs = false,
                        update_in_insert = false,
                        float = {
                            border = "rounded",
                            prefix = " • ",
                            severity_sort = true,
                        },
                    })
                    print("Errors disabled")
                end,
                mode = "n",
                desc = "Disable errors"
            },

            {
                "<leader>lt",
                function()
                    vim.diagnostic.config({
                        virtual_text = false,
                        underline = true,
                        signs = true,
                        update_in_insert = false,
                        float = {
                            border = "rounded",
                            prefix = " • ",
                            severity_sort = true,
                        },
                    })
                    print("Virtual text disabled")
                end,
                mode = "n",
                desc = "Disable virtual text"
            },

            {
                "<leader>lr",
                function()
                    vim.diagnostic.config({
                        virtual_text = true,
                        signs = true,
                        underline = true,
                        update_in_insert = false,
                        float = {
                            border = "rounded",
                            prefix = " • ",
                            severity_sort = true,
                        },
                    })
                    print("Diagnostics reset to default")
                end,
                mode = "n",
                desc = "Reset diagnostics"
            },

        },
    }
}
