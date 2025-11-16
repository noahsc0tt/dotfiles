require("mason").setup()
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

local function restart_all_lsps()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
        client.stop()
    end

    -- reload lsp.lua configuration:help cterm-colors
    local ok, _ = pcall(dofile, vim.fn.stdpath("config") .. "/after/plugin/lsp.lua")
    if not ok then
        print("Failed to reload lsp.lua")
    else
        print("LSP restarted")
    end
end

-- Override :LspRestart globally
vim.api.nvim_create_user_command("LspRestart", restart_all_lsps, { force = true })


-- Detach LSP
require('snacks').keymap.set("n", "<leader>ld", function()
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
end, { noremap = true, silent = true })

require('snacks').keymap.set("n", "<leader>vr", restart_all_lsps, { noremap = true, silent = true })



-- Diagnostics
local default_diagnostic_config = {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        prefix = " • ",
        severity_sort = true,
    },
}
vim.diagnostic.config(default_diagnostic_config)

local function disable_warnings()
    vim.diagnostic.config({
        virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
        underline = { severity = { min = vim.diagnostic.severity.ERROR } },
        signs = { severity = { min = vim.diagnostic.severity.ERROR } },
        update_in_insert = default_diagnostic_config.update_in_insert,
        float = default_diagnostic_config.float,
    })
    print("Warnings disabled")
end

local function disable_errors()
    vim.diagnostic.config({
        virtual_text = false,
        underline = false,
        signs = false,
        update_in_insert = false,
        float = default_diagnostic_config.float
    })
    print("All diagnostics disabled")
end

local function disable_virtual_text()
    vim.diagnostic.config({
        virtual_text = false,
        underline = default_diagnostic_config.underline,
        signs = default_diagnostic_config.signs,
        update_in_insert = default_diagnostic_config.update_in_insert,
        float = default_diagnostic_config.float,
    })
    print("Virtual text disabled")
end

local function reset_diagnostics()
    vim.diagnostic.config(default_diagnostic_config)
    print("Diagnostics reset to default")
end



-- Keymaps

local opts = { noremap = true, silent = true }

-- Diagnostics config
require('snacks').keymap.set("n", "<leader>lew", disable_warnings, opts)
require('snacks').keymap.set("n", "<leader>lee", disable_errors, opts)
require('snacks').keymap.set("n", "<leader>let", disable_virtual_text, opts)
require('snacks').keymap.set("n", "<leader>ler", reset_diagnostics, opts)

-- Diagnostic actions
require('snacks').keymap.set("n", "<leader>la", vim.diagnostic.setloclist)
require('snacks').keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
require('snacks').keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
require('snacks').keymap.set("n", "<leader>lf", vim.diagnostic.open_float)

-- Code actions
require('snacks').keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
require('snacks').keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
-- require('snacks').keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
require('snacks').keymap.set("n", "<leader>lR", vim.lsp.buf.references, opts)
require('snacks').keymap.set("n", "<leader>lc", vim.lsp.buf.references, opts)
require('snacks').keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts)

-- require('snacks').keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
require('snacks').keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
require('snacks').keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
