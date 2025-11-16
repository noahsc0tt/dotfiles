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
          always_show_bufferline = false,
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
      { '<M-j>', function() require('bufferline').cycle(1) end, desc = 'Next buffer' },
      { '<M-k>', function() require('bufferline').cycle(-1) end, desc = 'Prev buffer' },
      { '<M-d>', function() require('snacks').bufdelete() end, desc = 'Delete buffer' },
      { '<leader>sd', function() vim.cmd('bdelete!') end, desc = 'Force delete buffer' },
      { '<leader>sD', function() require('snacks').bufdelete.other() end, desc = 'Delete other buffers' },
      { '<M-C-h>', function() require('bufferline').move(-1) end, desc = 'Move buffer left' },
      { '<M-C-l>', function() require('bufferline').move(1) end, desc = 'Move buffer right' },
      { '<M-a>', '<cmd>BufferLinePick<CR>', desc = 'Buffer picker' },
      { '<M-BS>', '<cmd>BufferLinePickClose<CR>', desc = 'Close buffer picker' },
      { '<M-p>', '<C-^>', desc = 'Alternate file' },
      -- Tabs
      { '<leader>tn', function() vim.cmd('tabnew') end, desc = 'New tab' },
      { '<leader>td', function() vim.cmd('tabclose') end, desc = 'Close tab' },
      { '<leader>th', function() vim.cmd('tabmove -1') end, desc = 'Move tab left' },
      { '<leader>tl', function() vim.cmd('tabmove +1') end, desc = 'Move tab right' },
      { '<leader>tr', function()
          require('snacks').input.input({ prompt = 'Rename Tab: ' }, function(value)
            if value and value ~= '' then
              vim.cmd('BufferLineTabRename ' .. vim.fn.fnameescape(value))
            end
          end)
        end, desc = 'Rename tab' },
      { '<leader>ts', '<cmd>BufferLineSortByTabs<CR>', desc = 'Sort buffers by tabs' },
      { '<leader>t<leader>', function() vim.cmd('tab split') end, desc = 'Split to new tab' },
      { '<M-h>', function() vim.cmd('tabprevious') end, desc = 'Previous tab' },
      { '<M-l>', function() vim.cmd('tabnext') end, desc = 'Next tab' },
    },
}
}
