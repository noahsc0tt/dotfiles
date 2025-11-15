if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_position_animation_length = 0
    -- vim.g.neovide_cursor_vfx_particle_lifetime = 0.0
    -- vim.g.neovide_cursor_vfx_mode = ""
    -- vim.g.neovide_cursor_vfx_opacity = 0.0
    vim.g.neovide_scale_factor = 1.0

    require('snacks').keymap.set("n", "<C-+>", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
    end)

    require('snacks').keymap.set("n", "<C-->", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
    end)
end

if vim.g.started_by_firenvim then
    vim.o.showtabline = 0
    vim.o.laststatus = 0
    vim.o.ruler = false
    vim.o.number = false
    vim.o.relativenumber = false
    vim.o.cursorline = false
    vim.o.signcolumn = "no"
    vim.o.statusline = ""
    vim.o.winbar = ""
    vim.cmd [[highlight Normal guibg=NONE]]

    -- no popup menu animations
    vim.o.pumblend = 0
    vim.o.pumheight = 10

    -- don't mess with scrolling
    vim.o.scrolloff = 0
    vim.o.sidescrolloff = 0
end

vim.g.firenvim_config = {
    localSettings = {
        [".*"] = {
            cmdline = "neovim",
        }
    }
}

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = "github.com_*.txt",
    command = "set filetype=markdown"
})
