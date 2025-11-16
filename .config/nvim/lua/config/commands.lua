-- Relaod nvim config
vim.api.nvim_create_user_command("Ld", function()
  for _, f in ipairs(vim.fn.glob("/Users/nscott/.config/nvim/after/**/*.lua", true, true)) do
    dofile(f)
  end
  dofile("/Users/nscott/.config/nvim/init.lua")
  vim.notify("Neovim config reloaded")
end, {})

vim.api.nvim_create_user_command("DimToggle", function()
    local snacks = require("snacks")
    if snacks.dim.enabled == true then
        snacks.dim.disable()
    else
        snacks.dim.enable()
    end
end, {})

-- Autocommands

-- Auto save on buffer leave
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  command = "silent! wa",
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
