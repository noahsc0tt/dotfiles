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
vim.keymap.set("v", "<leader>p", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set({ "n", "v" }, "<leader>c", "\"_c")
vim.keymap.set({ "n", "v" }, "<leader>x", "\"_x")
vim.keymap.set({ "n", "v" }, "<leader>X", "\"_X")
vim.keymap.set({ "n", "v" }, "<leader>s", "\"_s")

-- Double space to use clipboard
vim.keymap.set({ "n", "v" }, "Y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader><leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader><leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader><leader>P", "\"+P")
vim.keymap.set({ "n", "v" }, "<leader><leader>d", "\"+d")
vim.keymap.set({ "n", "v" }, "<leader><leader>D", "\"+D")
vim.keymap.set({ "n", "v" }, "<leader><leader>c", "\"+c")
vim.keymap.set({ "n", "v" }, "<leader><leader>C", "\"+C")

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
        vim.cmd("wqa")
    else
        vim.cmd("qa!")
    end
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
vim.keymap.set("n", "<leader>vH", "<cmd>set nohlsearch<CR>")
vim.keymap.set("n", "<leader>vh", "<cmd>set hlsearch<CR>")
vim.keymap.set("n", "<leader>vz", "<cmd>Lazy sync<CR>")
vim.keymap.set("n", "<leader>ve", "<cmd>edit<CR>")
vim.keymap.set("n", "<leader>vs", function()
    vim.cmd("so")
    vim.notify("Sourced file")
end, { desc = "Source file and echo message" })
vim.keymap.set("n", "<leader>vl", ":Ld<CR>")
vim.keymap.set("n", "<leader>vy", ":%y+<CR>")
vim.keymap.set("n", "<leader>vn", "<cmd>enew<CR>")
vim.keymap.set("n", "<leader>vm", "<cmd>Markview enable<CR>")
vim.keymap.set("n", "<leader>vM", "<cmd>Markview disable<CR>")

-- Scrolling
vim.keymap.set({ "n", "v", "c" }, "<C-n>", "2<C-e>")
vim.keymap.set({ "n", "v", "c" }, "<C-p>", "2<C-y>")

-- Incrementing
vim.keymap.set({ 'n', 'v' }, '+', '<C-a>', { desc = 'Increment', noremap = true })
vim.keymap.set({ 'n', 'v' }, '-', '<C-x>', { desc = 'Decrement', noremap = true })


-- Folding
vim.keymap.set({ 'n', 'v' }, "<leader>z", "zM")
vim.keymap.set({ 'n', 'v' }, "<leader>Z", "zR")
