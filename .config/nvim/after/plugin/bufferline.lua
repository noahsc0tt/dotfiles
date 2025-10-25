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
vim.api.nvim_create_user_command("CloseTab", function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if #bufs <= 1 then
        vim.notify("No more buffers to close", vim.log.levels.WARN)
    else
        vim.cmd("bdelete!")
    end
end, {})
vim.keymap.set("n", "<M-d>", function() vim.cmd("CloseTab") end, { silent = true, noremap = true })
vim.keymap.set("n", "<M-S-d>", function() vim.cmd("bdelete! others") end, { silent = true, noremap = true })
vim.keymap.set("n", "<M-C-d>", function()
    vim.cmd("CloseTab")
    vim.cmd("q")
end, { silent = true, noremap = true })

vim.keymap.set("n", "<M-h>", function() bfline.move(-1) end, { silent = true })
vim.keymap.set("n", "<M-l>", function() bfline.move(1) end, { silent = true })
