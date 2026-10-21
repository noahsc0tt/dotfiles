local function give_buffer_to_tab(dir)
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_win = vim.api.nvim_get_current_win()
  local cur_tab = vim.fn.tabpagenr()
  local tab_count = vim.fn.tabpagenr('$')

  -- If only one tab, move buffer to a new tab
  if tab_count < 2 then
    vim.cmd('tabnew')
    vim.api.nvim_win_set_buf(0, cur_buf)
    vim.api.nvim_win_close(cur_win, true)
    return
  end

  -- If moving next from last tab, or prev from first tab -> new tab
  if (dir == 1 and cur_tab == tab_count) or (dir == -1 and cur_tab == 1) then
    vim.cmd('tabnew')
    vim.api.nvim_win_set_buf(0, cur_buf)
    vim.api.nvim_win_close(cur_win, true)
    return
  end

  -- Normal case: move to adjacent existing tab
  local tgt = cur_tab + dir

  vim.cmd(tgt .. 'tabnext')
  vim.cmd('vsplit')
  vim.api.nvim_win_set_buf(0, cur_buf)

  vim.cmd(cur_tab .. 'tabnext')
  vim.api.nvim_win_close(cur_win, true)

  vim.cmd(tgt .. 'tabnext')
end

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
        name_formatter = function(buf)
          local ok, name = pcall(vim.api.nvim_tabpage_get_var, buf.tabnr, 'name')
          if ok and name ~= '' then return name end
          return tostring(vim.api.nvim_tabpage_get_number(buf.tabnr))
        end
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
      { '<M-a>',  '<cmd>BufferLinePick<CR>',             desc = 'Buffer picker' },
      { '<M-BS>', '<cmd>BufferLinePickClose<CR>',        desc = 'Close buffer picker' },

      -- Tabs
      { '<M-s>',  function() vim.cmd('tab split') end,   desc = 'New tab', mode = {"n", "i"} },
      { '<M-d>',  function() vim.cmd('tabclose') end,    desc = 'Close tab', mode = {"n", "i"} },
      { '<M-h>',  function() vim.cmd('tabmove -1') end,  desc = 'Move tab left', mode = {"n", "i"} },
      { '<M-l>',  function() vim.cmd('tabmove +1') end,  desc = 'Move tab right', mode = {"n", "i"} },
      { '<M-k>',  function() vim.cmd('tabprevious') end, desc = 'Previous tab', mode = {"n", "i"} },
      { '<M-j>',  function() vim.cmd('tabnext') end,     desc = 'Next tab', mode = {"n", "i"} },
      { '<leader><M-k>', function() give_buffer_to_tab(-1) end, desc = 'Give buffer to previous tab', mode = { "n", } },
      { '<leader><M-j>', function() give_buffer_to_tab(1) end,  desc = 'Give buffer to next tab', mode = { "n", } },
      {
        '<M-r>',
        function()
          local cur = vim.api.nvim_get_current_tabpage()
          local ok, name = pcall(vim.api.nvim_tabpage_get_var, cur, 'name')
          local prompt = (ok and name ~= '') and ('Rename Tab (%s): '):format(name) or 'Rename Tab: '
          require('snacks').input.input({ prompt = prompt }, function(value)
            if value == nil then return end
            vim.api.nvim_tabpage_set_var(cur, 'name', value)
            vim.cmd('redrawtabline')
          end)
        end,
        desc = 'Rename tab'
      },
      { '<M-b>', '<cmd>BufferLineSortByTabs<CR>', desc = 'Sort buffers by tabs' },
    },
  }
}
