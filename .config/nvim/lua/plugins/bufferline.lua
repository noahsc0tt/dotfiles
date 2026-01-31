return {
    {
        'akinsho/bufferline.nvim',
        enabled = true,
        version = '*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = 'VeryLazy',
        cond = not vim.g.started_by_firenvim,
        opts = {
            options = {
                mode = 'buffers',
                style_preset = function() require('bufferline').style_preset.minimal() end,
                indicator = { style = 'none' },
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
                custom_filter = function(buf_number)
                    return vim.api.nvim_buf_get_name(buf_number) ~= ''
                end,
                show_buffer_close_icons = false,
                show_close_icon = false,
                left_trunc_marker = '← ',
                right_trunc_marker = '→ ',
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(_, level)
                    if level:match('error') then
                        return ''
                    elseif level:match('warning') then
                        return ''
                    else
                        return ''
                    end
                end,
            },
        },
        keys = {
            -- { '<C-j>',   function() require('bufferline').cycle(1) end,  desc = 'Next buffer' },
            { '<C-S-j>',   function() require('bufferline').cycle(1) end,  desc = 'Next buffer' },
            -- { '<C-k>',   function() require('bufferline').cycle(-1) end, desc = 'Prev buffer' },
            { '<C-S-k>',   function() require('bufferline').cycle(-1) end, desc = 'Prev buffer' },
            { '<C-S-Space>', '<C-^>',                                       desc = 'Most recent buffer' },
            { '<C-S-d>',   function() require('snacks').bufdelete() end,   desc = 'Delete buffer' },
            { '<leader>d', function() vim.cmd('bdelete!') end,             desc = 'Force delete buffer' },
            {
                '<leader>D',
                function()
                    local current = vim.api.nvim_get_current_buf()
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
                            vim.api.nvim_buf_delete(buf, { force = true })
                        end
                    end
                end,
                desc = 'Delete other buffers'
            },
            { '<C-S-h>', function() require('bufferline').move(-1) end, desc = 'Move buffer left' },
            { '<C-S-l>', function() require('bufferline').move(1) end,  desc = 'Move buffer right' },
            { '<M-a>',   '<cmd>BufferLinePick<CR>',                     desc = 'Buffer picker' },
            { '<M-BS>',  '<cmd>BufferLinePickClose<CR>',                desc = 'Close buffer picker' },

            -- Tabs
            { '<M-s>',   function() vim.cmd('tab split') end,           desc = 'New tab' },
            { '<M-f>',   function() vim.cmd('tab split') end,           desc = 'New tab' },
            { '<M-d>',   function() vim.cmd('tabclose') end,            desc = 'Close tab' },
            { '<M-h>',   function() vim.cmd('tabmove -1') end,          desc = 'Move tab left' },
            { '<M-l>',   function() vim.cmd('tabmove +1') end,          desc = 'Move tab right' },
            { '<M-k>',   function() vim.cmd('tabprevious') end,         desc = 'Previous tab' },
            { '<M-j>',   function() vim.cmd('tabnext') end,             desc = 'Next tab' },
            {
                '<M-r>',
                function()
                    require('snacks').input.input({ prompt = 'Rename Tab: ' }, function(value)
                        if value and value ~= '' then
                            vim.cmd('BufferLineTabRename ' .. vim.fn.fnameescape(value))
                        end
                    end)
                end,
                desc = 'Rename tab'
            },
            { '<M-b>', '<cmd>BufferLineSortByTabs<CR>', desc = 'Sort buffers by tabs' },
        },
    }
}
