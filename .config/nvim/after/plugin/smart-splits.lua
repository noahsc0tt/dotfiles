local ok, smart_splits = pcall(require, "smart-splits")
if not ok then return end

smart_splits.setup({
ignored_buftypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  cursor_follows_swapped_bufs = true,
})

vim.keymap.set({ "n","i","v" }, "<C-h>", smart_splits.move_cursor_left)
vim.keymap.set({ "n","i","v" }, "<C-j>", smart_splits.move_cursor_down)
vim.keymap.set({ "n","i","v" }, "<C-k>", smart_splits.move_cursor_up)
vim.keymap.set({ "n","i","v" }, "<C-l>", smart_splits.move_cursor_right)

vim.keymap.set("n", "<M-C-h>", function()
    smart_splits.resize_left(4)
end)
vim.keymap.set("n", "<M-C-l>", function()
    smart_splits.resize_right(4)
end)
vim.keymap.set("n", "<M-C-j>", function()
    smart_splits.resize_down(4)
end)
vim.keymap.set("n", "<M-C-k>", function()
    smart_splits.resize_up(4)
end)



local function swap_and_follow(dir)
    local pos = vim.api.nvim_win_get_cursor(0)
    if dir == "left" then
        smart_splits.swap_buf_left()
    elseif dir == "right" then
        smart_splits.swap_buf_right()
    elseif dir == "up" then
        smart_splits.swap_buf_up()
    elseif dir == "down" then
        smart_splits.swap_buf_down()
    end
    vim.api.nvim_win_set_cursor(0, pos)
end

vim.keymap.set("n", "<leader>sH", function() swap_and_follow("left") end)
vim.keymap.set("n", "<leader>sJ", function() swap_and_follow("down") end)
vim.keymap.set("n", "<leader>sK", function() swap_and_follow("up") end)
vim.keymap.set("n", "<leader>sL", function() swap_and_follow("right") end)



vim.keymap.set("n", "<leader>sh", function()
    vim.cmd("FocusSplitLeft")
end)

vim.keymap.set("n", "<leader>sj", function()
    vim.cmd("FocusSplitDown")
end)

vim.keymap.set("n", "<leader>sk", function()
    vim.cmd("FocusSplitUp")
end)

vim.keymap.set("n", "<leader>sl", function()
    vim.cmd("FocusSplitRight")
end)


-- For filename completion for cd in cmd mode

-- local function buf_dir()
--     local d = vim.fn.expand("%:p:h")
--     if d == "" then d = vim.fn.getcwd() end
--     return d
-- end
-- 
-- local function buf_dir_complete(arglead)
--     local matches = vim.fn.getcompletion(buf_dir() .. "/" .. arglead, "file")
--     return vim.tbl_map(function(p)
--         return vim.fn.fnamemodify(p, ":t")
--     end, matches)
-- end

-- local function buf_split(cmd, filename)
--     if filename and filename ~= "" then
--         local fullpath = buf_dir() .. "/" .. filename
--         vim.cmd(cmd .. " " .. vim.fn.fnameescape(fullpath))
--     else
--         vim.cmd(cmd)
--     end
-- end

vim.keymap.set('n', '<C-w><C-f>', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local cfg = vim.api.nvim_win_get_config(win)
    if cfg.relative ~= '' then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  vim.notify("No floating window found")
end, { desc = "Focus floating window" })
