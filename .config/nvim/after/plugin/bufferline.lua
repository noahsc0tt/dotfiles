local bfline = require("bufferline")

vim.opt.termguicolors = true
bfline.setup {
    options = {
        mode = "buffers",
        style_preset = bfline.style_preset.minimal,
        indicator = {
            style = 'none'
        },
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
        custom_filter = function(buf_number)
            return vim.api.nvim_buf_get_name(buf_number) ~= ""
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        left_trunc_marker = '← ',
        right_trunc_marker = '→ ',
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, level)
            if level:match("error") then
                return ""
            elseif level:match("warning") then
                return ""
            else
                return ""
            end
        end,
    }
}

vim.schedule(function()
    require('snacks').keymap.set("n", "<M-p>", "<C-^>", { silent = true, noremap = true })
end)


require('snacks').keymap.set("n", "<M-j>", function() bfline.cycle(1) end, { silent = true })
require('snacks').keymap.set("n", "<M-k>", function() bfline.cycle(-1) end, { silent = true })
-- vim.api.nvim_create_user_command("CloseTab", function()
--     local bufs = vim.fn.getbufinfo({ buflisted = 1 })
--     if #bufs <= 1 then
--         vim.notify("No more buffers to close", vim.log.levels.WARN)
--     else
--         vim.cmd("bdelete!")
--     end
-- end, {})
-- require('snacks').keymap.set("n", "<M-r>", function()
--     local new_name = vim.fn.input("New tab name: ")
--     if new_name ~= "" then
--         vim.b.bufferline_name = new_name
--         vim.cmd("redraw")
--     end
-- end, { desc = "Rename buffer" })
require('snacks').keymap.set("n", "<M-d>", function() require('snacks').bufdelete() end, { silent = true, noremap = true })
require('snacks').keymap.set("n", "<leader>sd", function() vim.cmd("bdelete!") end, { silent = true, noremap = true })
require('snacks').keymap.set("n", "<leader>sD", function() require("snacks").bufdelete.other() end, { silent = true, noremap = true })
require('snacks').keymap.set("n", "<M-C-h>", function() bfline.move(-1) end, { silent = true })
require('snacks').keymap.set("n", "<M-C-l>", function() bfline.move(1) end, { silent = true })


require('snacks').keymap.set("n", "<M-a>", "<cmd>BufferLinePick<CR>", { desc = "Buffer Picker" })
require('snacks').keymap.set("n", "<M-BS>", "<cmd>BufferLinePickClose<CR>", { desc = "Buffer Close Picker" })


-- Tabs
require('snacks').keymap.set("n", "<leader>tn", function()
    vim.cmd("tabnew")
end, { desc = "New tab" })

require('snacks').keymap.set("n", "<leader>td", function()
    vim.cmd("tabclose")
end, { desc = "Close tab" })

require('snacks').keymap.set("n", "<leader>th", function()
    vim.cmd("tabmove -1")
end, { desc = "Move tab left" })

require('snacks').keymap.set("n", "<leader>tl", function()
    vim.cmd("tabmove +1")
end, { desc = "Move tab right" })

require('snacks').keymap.set("n", "<leader>tr", function()
  require('snacks').input.input({ prompt = "Rename Tab: " }, function(value)
    if value and value ~= "" then
      vim.cmd("BufferLineTabRename " .. vim.fn.fnameescape(value))
    end
  end)
end, { desc = "Rename tab" })

require('snacks').keymap.set("n", "<leader>ts", "<cmd>BufferLineSortByTabs<CR>", { desc = "Sort buffers" })

require('snacks').keymap.set("n", "<leader>t<leader>", function() vim.cmd("tab split") end)

require('snacks').keymap.set("n", "<M-h>", function() vim.cmd("tabprevious") end, { silent = true })
require('snacks').keymap.set("n", "<M-l>", function() vim.cmd("tabnext") end, { silent = true })

