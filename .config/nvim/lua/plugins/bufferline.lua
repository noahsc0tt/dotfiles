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
        mode = 'tabs',
        numbers = "none",
        style_preset = function() require('bufferline').style_preset.minimal() end,
        indicator = { style = 'none' },
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        name_formatter = function(buf) return '' .. vim.api.nvim_tabpage_get_number(buf.tabnr) end
      },
    },
    keys = {
      -- { '<C-j>',   function() require('bufferline').cycle(1) end,  desc = 'Next buffer' },
      -- { '<C-S-j>',   function() require('bufferline').cycle(1) end,  desc = 'Next buffer' },
      -- { '<C-k>',   function() require('bufferline').cycle(-1) end, desc = 'Prev buffer' },
      -- { '<C-S-k>',   function() require('bufferline').cycle(-1) end, desc = 'Prev buffer' },
      { '<C-S-p>', '<C-^>',                            desc = 'Alternate buffer' },
      { '<C-S-d>',     function() vim.cmd('bdelete!') end, desc = 'Force delete buffer' },
      { '<leader>D', '<cmd>BufferLineCloseOthers<CR>', desc = 'Delete all other buffers' },
      -- { '<C-S-h>', function() require('bufferline').move(-1) end, desc = 'Move buffer left' },
      -- { '<C-S-l>', function() require('bufferline').move(1) end,  desc = 'Move buffer right' },
      -- { '<M-a>',  '<cmd>BufferLinePick<CR>',             desc = 'Buffer picker' },
      -- { '<M-BS>', '<cmd>BufferLinePickClose<CR>',        desc = 'Close buffer picker' },

      -- Tabs
      { '<M-s>',  function() vim.cmd('tab split') end,   desc = 'New tab' },
      { '<M-d>',  function() vim.cmd('tabclose') end,    desc = 'Close tab' },
      { '<M-h>',  function() vim.cmd('tabmove -1') end,  desc = 'Move tab left' },
      { '<M-l>',  function() vim.cmd('tabmove +1') end,  desc = 'Move tab right' },
      { '<M-k>',  function() vim.cmd('tabprevious') end, desc = 'Previous tab' },
      { '<M-j>',  function() vim.cmd('tabnext') end,     desc = 'Next tab' },
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
