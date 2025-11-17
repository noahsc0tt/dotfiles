return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'folke/trouble.nvim',
        },
        cond = not vim.g.started_by_firenvim,

        opts = function(_, opts)
            -- your whole config stays exactly the same:

            opts.options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16,
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                },
            }

            opts.sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filename' },
                lualine_c = { },
                lualine_x = { 'diff', 'progress' },
                lualine_y = {
                    function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end,
                    'branch'
                },
                lualine_z = { 'filetype' },
            }

            opts.inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = { 'diagnostics' },
                lualine_x = { 'diff', 'progress' },
                lualine_y = {},
                lualine_z = { 'filetype' },
            }

            opts.tabline = {}
            opts.winbar = {}
            opts.inactive_winbar = {}
            opts.extensions = {}

            -- ★ ADD TROUBLE COMPONENT HERE ★
            local trouble = require("trouble")
            local symbols = trouble.statusline({
                mode = "lsp_document_symbols",
                groups = {},
                title = false,
                filter = { range = true },
                format = "{kind_icon}{symbol.name:Normal}",
                hl_group = "lualine_c_normal",
            })

            table.insert(opts.sections.lualine_c, {
                symbols.get,
                cond = symbols.has,
            })
            table.insert(opts.sections.lualine_c,
                'diagnostics')
            return opts
        end,
    }
}
