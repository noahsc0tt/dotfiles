if vim.g.neovide then
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_position_animation_length = 0
    -- vim.g.neovide_cursor_vfx_particle_lifetime = 0.0
    -- vim.g.neovide_cursor_vfx_mode = ""
    -- vim.g.neovide_cursor_vfx_opacity = 0.0
    vim.g.neovide_scale_factor = 1.0

    vim.keymap.set("n", "<C-+>", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.1
    end)

    vim.keymap.set("n", "<C-->", function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.1
    end)
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = "github.com_*.txt",
    command = "set filetype=markdown"
})
