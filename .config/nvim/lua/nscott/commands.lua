-- Relaod nvim config
vim.api.nvim_create_user_command("Ld", function()
  for _, f in ipairs(vim.fn.glob("/Users/nscott/.config/nvim/after/**/*.lua", true, true)) do
    dofile(f)
  end
  dofile("/Users/nscott/.config/nvim/init.lua")
  vim.notify("Neovim config reloaded")
end, {})


-- Autocommands

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  command = "silent! wa",
})

