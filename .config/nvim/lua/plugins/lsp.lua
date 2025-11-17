return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "ms-jpq/coq_nvim",       branch = "coq" },
            { "ms-jpq/coq.artifacts",  branch = "artifacts" },

            -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
            -- - shell repl
            -- - nvim lua api
            -- - scientific calculator
            -- - comment banner
            -- - etc

        },
        init = function()
            vim.g.coq_settings = {
                auto_start = 'shut-up',
                completion = {
                    always = false,
                    sticky_manual = false,

                },
                display = {
                    preview = {
                        border = { "", "", "", "", "", "", "", "" }
                    },
                    statusline = { helo = false }
                },
                keymap = {
                    recommended = true,
                    pre_select = true,
                    jump_to_mark = '<C-m>',
                    manual_complete = '<C-Space>',
                    bigger_preview = '<C-k>',
                },
            }
        end,
        config = function()
            vim.env.PATH = vim.env.HOME .. "/.local/share/nvim/mason/bin:" .. vim.env.PATH
            local coq = require "coq" -- add this

            vim.lsp.enable('lua_ls')
            vim.lsp.config('lua_ls', coq.lsp_ensure_capabilities({
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
            }))
            vim.lsp.enable('basedpyright')
            vim.lsp.config('basedpyright', coq.lsp_ensure_capabilities({
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
                }
            }))
            vim.lsp.enable('jdtls')
            vim.lsp.config('jdtls', coq.lsp_ensure_capabilities({
                cmd_env = {
                    JAVA_HOME = "/opt/homebrew/opt/openjdk",
                    PATH = "/opt/homebrew/opt/openjdk/bin:" .. vim.env.PATH,
                },
            }))
            vim.lsp.enable('bashls')
            vim.lsp.config('bashls', coq.lsp_ensure_capabilities({ filetypes = { "sh", "zsh", "bash" } }))
            vim.lsp.enable('eslint')
            vim.lsp.enable('clangd')
            vim.lsp.enable('ruby-lsp')
            vim.lsp.config('ruby-lsp', coq.lsp_ensure_capabilities({
                cmd = { "ruby-lsp" },
                filetypes = { "ruby" },
            }))
            vim.lsp.enable('hls')
            vim.lsp.config('hls', coq.lsp_ensure_capabilities({
                cmd = { "haskell-language-server-wrapper", "--lsp" },
                filetypes = { "haskell", "lhaskell" },
            }))
            vim.lsp.enable('ts_ls')
            vim.lsp.enable('jsonls')

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
            { "<leader>ld", vim.diagnostic.setloclist,   mode = "n",          desc = "Open diagnostics" },
            { "gp",         vim.diagnostic.goto_prev,    mode = "n",          desc = "Previous diagnostic" },
            { "gn",         vim.diagnostic.goto_next,    mode = "n",          desc = "Next diagnostic" },
            { "<leader>lf", vim.diagnostic.open_float,   mode = "n",          desc = "Open diagnostic float" },

            -- Code actions
            { "gd",         vim.lsp.buf.definition,      mode = "n",          desc = "Go to definition" },
            { "gD",         vim.lsp.buf.declaration,     mode = "n",          desc = "Go to declaration" },
            { "gt",         vim.lsp.buf.type_definition, mode = "n",          desc = "Go to type definition" },
            { "<leader>li", vim.lsp.buf.implementation,  mode = "n",          desc = "Go to implementation" },
            { "<C-S-s>",    vim.lsp.buf.signature_help,  mode = { "n", "i" }, desc = "Signature help" },
            { "<leader>lr", vim.lsp.buf.references,      mode = "n",          desc = "List references" },
            { "<leader>lk", vim.lsp.buf.hover,           mode = "n",          desc = "Hover documentation" },

            -- require('snacks').keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
            {
                "gr",
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
                desc = "Disable warning diagnostics"
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
                    print("All diagnostics disabled")
                end,
                mode = "n",
                desc = "Disable all diagnostics"
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
                desc = "Disable virtual text diagnostics"
            },

            {
                "<leader>la",
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
                desc = "Show all diagnostics"
            },

        },
    }
}
