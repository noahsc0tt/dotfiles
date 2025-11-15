require("focus").setup({
    enable = true,                   -- Enable module
    commands = true,                 -- Create Focus commands
    autoresize = {
        enable = true,               -- Enable or disable auto-resizing of splits
        width = 0,                   -- Force width for the focused window
        height = 0,                  -- Force height for the focused window
        minwidth = 0,                -- Force minimum width for the unfocused window
        minheight = 0,               -- Force minimum height for the unfocused window
        focusedwindow_minwidth = 0,  --Force minimum width for the focused window
        focusedwindow_minheight = 0, --Force minimum height for the focused window
        height_quickfix = 10,        -- Set the height of quickfix panel
    },
    split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false,   -- Create tmux splits instead of neovim splits
    },
    ui = {
        number = false,                    -- Display line numbers in the focussed window only
        relativenumber = true,            -- Display relative line numbers in the focussed window only
        hybridnumber = true,              -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = true, -- Preserve absolute numbers in the unfocussed windows

        cursorline = false,                -- Display a cursorline in the focussed window only
    }
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.wo.cursorline = true
        vim.wo.cursorcolumn = false

        if vim.bo.buftype ~= "terminal" and vim.bo.buftype ~= "prompt" then
            vim.wo.number = true
            vim.wo.relativenumber = true
        else
            vim.wo.number = false
            vim.wo.relativenumber = false
        end
    end,
})


-- local ignore_buftypes = { 'terminal', 'prompt', }
--
-- vim.api.nvim_create_autocmd('WinEnter', {
--     callback = function(_)
--         if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
--             vim.w.focus_disable = true
--         else
--             vim.w.focus_disable = false
--         end
--     end,
--     desc = 'Disable focus autoresize for BufType',
-- })

require('snacks').keymap.set("n", "<M-f>", function()
    vim.cmd("ZenMode")
    vim.cmd("DimToggle")
end)
require('snacks').keymap.set("n", "<leader>zq", function() vim.cmd("FocusEqualise") end )
require('snacks').keymap.set("n", "<leader>zF", function() vim.cmd("FocusDisable") end)
require('snacks').keymap.set("n", "<leader>zf", function()
    vim.cmd("FocusEnable")
    vim.cmd("FocusAutoresize")
end)

-- Markview
require('snacks').keymap.set("n", "<leader>zm", "<cmd>Markview enable<CR>")
require('snacks').keymap.set("n", "<leader>zM", "<cmd>Markview disable<CR>")
