require("coq_3p")({
    { src = "builtin/syntax" },
    {
        src = "repl",
        sh = "zsh",
        shell = { py = "python3" },
        max_lines = 99,
        deadline = 500,
        unsafe = { "sudo", "rm", "poweroff", "mv", "cp", "dd" },
    },
    { src = "bc", short_name = "MATH", precision = 6 },
})


vim.keymap.set({ "n", "i" }, "<C-Esc>", function()
  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info().selected == -1 then
      return vim.api.nvim_replace_termcodes("<C-e><CR>", true, true, true)
    else
      return vim.api.nvim_replace_termcodes("<C-y>", true, true, true)
    end
  end
  return vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
end, { expr = true, silent = true })
