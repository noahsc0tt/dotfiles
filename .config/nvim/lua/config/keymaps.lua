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
vim.g.maplocalleader = " "

-- Centre after page navigation
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Delete without yanking
vim.keymap.set("n", "yp", "\"0p")
vim.keymap.set("n", "yP", "\"0P")
vim.keymap.set("x", "P", "\"0p")
vim.keymap.set({ "n", "x" }, "<leader>Cp", "\"_dP")
vim.keymap.set({ "n", "x" }, "<leader>CD", "\"_d")
vim.keymap.set({ "n", "x" }, "<leader>Cd", "\"_D")
vim.keymap.set({ "n", "x" }, "<leader>CC", "\"_c")
vim.keymap.set({ "n", "x" }, "<leader>Cc", "\"_C")
vim.keymap.set({ "n", "x" }, "<leader>CX", "\"_x")
vim.keymap.set({ "n", "x" }, "<leader>Cx", "\"_X")
vim.keymap.set({ "n", "x" }, "<leader>CS", "\"_s")

-- System clipboard
vim.keymap.set({ "n", "x" }, "Y", "\"+y")
vim.keymap.set({ "n", "x" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "x" }, "<leader>P", "\"+P")
-- vim.keymap.set({ "n", "x" }, "<leader>cd", "\"+d")
-- vim.keymap.set({ "n", "x" }, "<leader>cD", "\"+D")
-- vim.keymap.set({ "n", "x" }, "<leader>cc", "\"+c")
-- vim.keymap.set({ "n", "x" }, "<leader>cC", "\"+C")
-- vim.keymap.set({ "n", "x" }, "<leader>cs", "\"+S")

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
vim.keymap.set("n", "<C-q>", function()
    vim.cmd("q!")
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
-- vim.keymap.set("n", "J", "mzJ`z")

-- Format whole file
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)

-- Cursor Jump
vim.keymap.set("n", "<C-S-o>", "<C-i>", { noremap = true, silent = true })

-- Using _ for start of line
vim.keymap.set('o', '_', '^', { noremap = true })
vim.keymap.set({ 'n', 'x' }, 'g_', 'g^', { noremap = true })

-- Splitting and joining lines
vim.keymap.set("n", "J", "a<Cr><Esc>k$")
vim.keymap.set("n", "K", "Jh")

-- Undo and Redo
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<C-r>", "U")

-- Indenting
vim.keymap.set("n", "<leader><", "<<")
vim.keymap.set("n", "<leader>>", ">>")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Command mode
vim.keymap.set("c", "<C-a>", "<C-b>")

-- Insert mode
vim.keymap.set("c", "<C-g>h", "<Left>")
vim.keymap.set("c", "<C-g>l", "<Right>")

-- Vim stuff
vim.keymap.set("n", "<leader>oH", "<cmd>set nohlsearch<CR>", { desc = "Disable search highlight" })
vim.keymap.set("n", "<leader>oh", "<cmd>set hlsearch<CR>", { desc = "Enable search highlight" })
vim.keymap.set("n", "<leader>oz", "<cmd>Lazy sync<CR>", { desc = "Lazy sync" })
vim.keymap.set("n", "<leader>or", ":Lazy reload ", { desc = "Lazy relaod" })
vim.keymap.set("n", "<leader>od", "<cmd>bufdo bdelete<CR>", { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>oe", "<cmd>edit<CR>", { desc = "Edit buffer" })
vim.keymap.set("n", "<leader>on", "<cmd>enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>ot", "<cmd>term<CR>", { desc = "New terminal" })
vim.keymap.set("n", "<leader>os", function()
    vim.cmd("so")
    require('snacks').notify.info("Sourced file")
end, { desc = "Source file" })
vim.keymap.set("n", "<leader>oy", ":%y+<CR>", { desc = "Yank whole file to clipboard" })


-- z stuff
vim.keymap.set("n", "z=", function() vim.opt.spell = true; require('snacks').notify.info('Spelling enabled') end, { desc = "Enable spelling" })
vim.keymap.set("n", "z_", function() vim.opt.spell = false; require('snacks').notify.info('Spelling disabled') end, { desc = "Disable spelling" })
vim.keymap.set("n", "zw", function() vim.opt.wrap = true; require('snacks').notify.info('Wrap enabled') end, { desc = "Enable word wrap" })
vim.keymap.set("n", "zW", function() vim.opt.wrap = false; require('snacks').notify.info('Wrap disabled') end, { desc = "Disable word wrap" })
vim.keymap.set("n", "zb", function() vim.b.completion = true; require('snacks').notify.info('Completions enabled') end, { desc = "Enable word wrap" })
vim.keymap.set("n", "zB", function() vim.b.completion = false; require('snacks').notify.info('Completions disabled') end, { desc = "Disable completions" })

vim.keymap.set("n", "<C-.>", "yyp$", { desc = "Duplicate line" })

-- Scrolling
vim.keymap.set({ "n", "x", "c" }, "<C-n>", "2<C-e>")
vim.keymap.set({ "n", "x", "c" }, "<C-p>", "2<C-y>")

-- Incrementing
vim.keymap.set({ 'n', 'x' }, '+', '<C-a>', { desc = 'Increment', noremap = true })
vim.keymap.set({ 'n', 'x' }, '-', '<C-x>', { desc = 'Decrement', noremap = true })
vim.keymap.set({ 'n', 'x' }, '<S-+>', 'g<C-a>',{ desc = 'Sequential Increment', noremap = true })
vim.keymap.set({ 'n', 'x' }, '<S-->', 'g<C-x>', { desc = 'Sequential Decrement', noremap = true })

-- Folding
vim.keymap.set({ 'n', 'x' }, "<leader>z", "zM", { desc = "Close all folds" })
vim.keymap.set({ 'n', 'x' }, "<leader>Z", "zR", { desc = "Open all folds" })
vim.keymap.set({ 'n', 'x' }, "zu", "zx", { desc = "Update folds" })

-- Terminal
vim.keymap.set('t', '<C-Esc>', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
end, { desc = 'Exit terminal mode' })

vim.keymap.set('n', 'zT', function()
    local cur = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= cur and vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            vim.api.nvim_set_current_buf(buf)
            break
        end
    end
end, { silent = true })

vim.keymap.set({"n", "t", "i"}, "<C-Space>",  function() require('snacks').terminal.toggle() end, { desc = "Toggle Terminal" })
vim.keymap.set({"n", "t", "i"}, "<C-S-s>",  function() require('snacks').terminal.open() end, { desc = "New Terminal" })


-- Windows

vim.keymap.set('n', '<C-s><C-f>', function()
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

vim.keymap.set('n', 'gz', 'zz', { desc = "Centre this line" })

-- Removing lsp defaults
-- vim.keymap.del('n', 'grn')
-- vim.keymap.del('n', 'grr')
-- vim.keymap.del({ 'n', 'x'}, 'gra')
-- vim.keymap.del('n', 'gri')
-- vim.keymap.del('n', 'grt')

-- --NOTE: Conflict with lsp incoming calls, temporary solution is to just use visual line mode
-- vim.keymap.del('n', 'gcc')

vim.keymap.set("i", "<C-,>", "<C-d>", { desc = "Delete indent" })
vim.keymap.set("i", "<C-.>", "<C-t>", { desc = "Indent" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word" })
vim.keymap.set("i", "<C-s>", "<Esc><C-w>", { desc = "Window" })
vim.keymap.set("n", "<C-s>", "<C-w>", { desc = "Window" })

vim.keymap.set("n", "f", "<C-f>", { desc = "Flash" })
vim.keymap.set("n", "<C-f>", "f", { desc = "Forward in-line search" })

vim.keymap.set("n", "<Del>", "lxh")

vim.keymap.set("n", "<C-S-.>", ">>")
vim.keymap.set("n", "<C-S-,>", "<<")


-- vim.keymap.set("n", "<BS>", function() vim.cmd("q") end, { desc = "Quit" })

-- vim.keymap.set("n", "0", "_")
-- vim.keymap.set("n", "_", "0")
