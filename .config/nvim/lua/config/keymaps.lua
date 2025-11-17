-- FREE:
-- <S-Cr>
-- <S-space>
-- <BS>
-- <S-BS>
-- <Del>
-- <Tab>
-- <S-Tab>
-- 0

vim.g.mapleader = " "

-- Centre after page navigation
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Delete without yanking
vim.keymap.set("n", "yp", "\"0p")
vim.keymap.set("n", "yP", "\"0P")
vim.keymap.set("v", "P", "\"0p")
vim.keymap.set({ "n", "v" }, "<leader>Cp", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>CD", "\"_d")
vim.keymap.set({ "n", "v" }, "<leader>Cd", "\"_D")
vim.keymap.set({ "n", "v" }, "<leader>CC", "\"_c")
vim.keymap.set({ "n", "v" }, "<leader>Cc", "\"_C")
vim.keymap.set({ "n", "v" }, "<leader>CX", "\"_x")
vim.keymap.set({ "n", "v" }, "<leader>Cx", "\"_X")
vim.keymap.set({ "n", "v" }, "<leader>CS", "\"_s")

-- System clipboard
vim.keymap.set({ "n", "v" }, "Y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>cy", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>cp", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>cP", "\"+P")
vim.keymap.set({ "n", "v" }, "<leader>cd", "\"+d")
vim.keymap.set({ "n", "v" }, "<leader>cD", "\"+D")
vim.keymap.set({ "n", "v" }, "<leader>cc", "\"+c")
vim.keymap.set({ "n", "v" }, "<leader>cC", "\"+C")

-- Writing and quitting
vim.keymap.set("n", "<leader>w", function()
    if vim.bo.buftype == "" and vim.bo.modifiable and vim.bo.modified and not vim.bo.readonly then
        vim.cmd("w")
    end
end)
vim.keymap.set("n", "<leader>W", function()
    if vim.bo.buftype == "" and vim.bo.modifiable and vim.bo.modified and not vim.bo.readonly then
        vim.cmd("wq")
    end
end)
vim.keymap.set("n", "<leader>q", function()
    vim.cmd("q")
end)
vim.keymap.set("n", "<leader>Q", function()
    vim.cmd("q!")
end)
vim.keymap.set("n", "<leader>e", function()
    if vim.bo.buftype == "" and vim.bo.modifiable and vim.bo.modified and not vim.bo.readonly then
        vim.cmd("w")
    end
    vim.cmd("qa!")
end)
vim.keymap.set("n", "<leader>E", function()
    vim.cmd('qa!')
end)

-- Moving selected text
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")

-- Keep cursor in the same place after J
vim.keymap.set("n", "J", "mzJ`z")

-- Format whole file
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)

-- Cursor Jump
vim.keymap.set("n", "<C-S-o>", "<C-i>", { noremap = true, silent = true })

-- Using _ for start of line
vim.keymap.set('o', '_', '^', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'g_', 'g^', { noremap = true })

-- Splitting and joining lines
vim.keymap.set("n", "J", "a<Cr><Esc>k$")
vim.keymap.set("n", "K", "J")

-- Undo and Redo
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<C-r>", "U")

-- Indenting in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Command mode
vim.keymap.set("c", "<C-a>", "<C-b>")

-- Insert mode
vim.keymap.set("c", "<C-g>h", "<Left>")
vim.keymap.set("c", "<C-g>l", "<Right>")

-- Vim stuff
vim.keymap.set("n", "<leader>oH", "<cmd>set nohlsearch<CR>")
vim.keymap.set("n", "<leader>oh", "<cmd>set hlsearch<CR>")
vim.keymap.set("n", "<leader>oz", "<cmd>Lazy sync<CR>")
vim.keymap.set("n", "<leader>oe", "<cmd>edit<CR>")
vim.keymap.set("n", "<leader>os", function()
    vim.cmd("so")
    vim.notify("Sourced file")
end, { desc = "Source file" })
vim.keymap.set("n", "<leader>ol", ":Ld<CR>")
vim.keymap.set("n", "<leader>oy", ":%y+<CR>")

-- Scrolling
vim.keymap.set({ "n", "v", "c" }, "<C-n>", "2<C-e>")
vim.keymap.set({ "n", "v", "c" }, "<C-p>", "2<C-y>")

-- Incrementing
vim.keymap.set({ 'n', 'v' }, '+', '<C-a>', { desc = 'Increment', noremap = true })
vim.keymap.set({ 'n', 'v' }, '-', '<C-x>', { desc = 'Decrement', noremap = true })
vim.keymap.set({ 'n', 'v' }, '<S-+>', 'g<C-a>',{ desc = 'Sequential Increment', noremap = true })
vim.keymap.set({ 'n', 'v' }, '<S-->', 'g<C-x>', { desc = 'Sequential Decrement', noremap = true })

-- Folding
vim.keymap.set({ 'n', 'v' }, "zm", "zM", { desc = "Close all folds" })
vim.keymap.set({ 'n', 'v' }, "zM", "zm", { desc = "Fold more" })
vim.keymap.set({ 'n', 'v' }, "zr", "zR", { desc = "Open all folds" })
vim.keymap.set({ 'n', 'v' }, "zR", "zr", { desc = "Fold less" })
vim.keymap.set({ 'n', 'v' }, "zu", "zx", { desc = "Update folds" })

-- Terminal
vim.keymap.set('t', '<C-Esc>', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
end, { desc = 'Exit terminal mode' })

vim.keymap.set('n', 'zt', function()
    local cur = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= cur and vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            vim.api.nvim_set_current_buf(buf)
            break
        end
    end
end, { silent = true })

vim.keymap.set({"n", "t"}, "<C-s>",  function() require('snacks').terminal.toggle() end, { desc = "Toggle Terminal" })
vim.keymap.set({"n", "t"}, "<C-S-f>",  function() require('snacks').terminal.open() end, { desc = "Toggle Terminal" })


-- Windows

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


vim.keymap.set({'n', 'x'}, '<leader>/', '/', { desc = "Search" })
vim.keymap.set('n', 'g/', 'gn', { desc = "Select next search result" })
