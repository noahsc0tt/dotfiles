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
    vim.keymap.set("n", "<M-p>", "<C-^>", { silent = true, noremap = true })
end)


vim.keymap.set("n", "<M-j>", function() bfline.cycle(1) end, { silent = true })
vim.keymap.set("n", "<M-k>", function() bfline.cycle(-1) end, { silent = true })
-- vim.api.nvim_create_user_command("CloseTab", function()
--     local bufs = vim.fn.getbufinfo({ buflisted = 1 })
--     if #bufs <= 1 then
--         vim.notify("No more buffers to close", vim.log.levels.WARN)
--     else
--         vim.cmd("bdelete!")
--     end
-- end, {})
-- vim.keymap.set("n", "<M-r>", function()
--     local new_name = vim.fn.input("New tab name: ")
--     if new_name ~= "" then
--         vim.b.bufferline_name = new_name
--         vim.cmd("redraw")
--     end
-- end, { desc = "Rename buffer" })
vim.keymap.set("n", "<M-d>", function() require('snacks').bufdelete() end, { silent = true, noremap = true })
vim.keymap.set("n", "<M-C-d>", function() vim.cmd("bdelete!") end, { silent = true, noremap = true })
vim.keymap.set("n", "<M-S-d>", function() require("snacks").bufdelete.other() end, { silent = true, noremap = true })
vim.keymap.set("n", "<M-C-h>", function() bfline.move(-1) end, { silent = true })
vim.keymap.set("n", "<M-C-l>", function() bfline.move(1) end, { silent = true })


vim.keymap.set("n", "<leader>g", "<cmd>BufferLinePick<CR>", { desc = "Buffer Picker" })
vim.keymap.set("n", "<leader>G", "<cmd>BufferLinePickClose<CR>", { desc = "Buffer Picker" })


-- Terminal
vim.keymap.set('t', '<C-Esc>', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
end, { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>st', ':terminal<CR>', { desc = 'New terminal' })

vim.keymap.set('n', '<leader>sT', function()
    local cur = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= cur and vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            vim.api.nvim_set_current_buf(buf)
            break
        end
    end
end, { silent = true })

-- Tabs
vim.keymap.set("n", "<leader>tn", function()
    vim.cmd("tabnew")
end, { desc = "New tab" })

vim.keymap.set("n", "<leader>td", function()
    vim.cmd("tabclose")
end, { desc = "Close tab" })

vim.keymap.set("n", "<leader>th", function()
    vim.cmd("tabmove -1")
end, { desc = "Move tab left" })

vim.keymap.set("n", "<leader>tl", function()
    vim.cmd("tabmove +1")
end, { desc = "Move tab right" })

vim.keymap.set("n", "<leader>tr", ":BufferLineTabRename ", { desc = "Rename tab" })

vim.keymap.set("n", "<leader>ts", "<cmd>BufferLineSortByTabs<CR>", { desc = "Sort buffers" })

vim.keymap.set("n", "<leader>t<leader>", function() vim.cmd("tab split") end)

vim.keymap.set("n", "<M-h>", function() vim.cmd("tabprevious") end, { silent = true })
vim.keymap.set("n", "<M-l>", function() vim.cmd("tabnext") end, { silent = true })

