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

