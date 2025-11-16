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
    local coq = require "coq" -- add this

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', coq.lsp_ensure_capabilities({
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

vim.diagnostic.config(default_diagnostic_config)
end,
keys = {


-- Diagnostic actions
{ "<leader>la", vim.diagnostic.setloclist, mode = "n"},
{ "<leader>lp", vim.diagnostic.goto_prev, mode = "n"},
{ "<leader>ln", vim.diagnostic.goto_next, mode = "n"},
{ "<leader>lf", vim.diagnostic.open_float, mode = "n"},

-- Code actions
{ "<leader>ld", vim.lsp.buf.definition, mode = "n"},
{ "<leader>lD", vim.lsp.buf.declaration, mode = "n"},
-- require('snacks').keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
{ "<leader>lR", vim.lsp.buf.references, mode = "n"},
{ "<leader>lc", vim.lsp.buf.references, mode = "n"},
{ "<leader>lk", vim.lsp.buf.hover, mode = "n"},

-- require('snacks').keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
{ "<leader>lr", vim.lsp.buf.rename, mode = "n"},
{ "<leader>li", "<cmd>LspInfo<CR>", mode = "n"},

-- Detach LSP
{ "<leader>ld", function()
    local bufnr = 0
    local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

    if #clients > 0 then
        for _, client in ipairs(clients) do
            client.stop()
        end
        print("LSP detached")
    else
        print("No LSP attached")
    end
end, mode = "n",},

{ "<leader>vr", "<cmd>LspRestart<CR>", mode = "n", desc = "Restart LSP" },


{ "<leader>lew", function()
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
end, mode = "n"},

{ "<leader>lee", function()
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
end, mode = "n"},

{ "<leader>let", function()
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
end, mode = "n"},

{ "<leader>ler", function()
    vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})
    print("Diagnostics reset to default")
end, mode = "n"},

    },
}
}
