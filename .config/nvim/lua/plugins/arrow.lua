return {
    "otavioschwanck/arrow.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
        show_icons = true,
        leader_key = '<leader>h',    -- Recommended to be a single key
        buffer_leader_key = '<leader>m', -- Per Buffer Mappings
        hide_handbook = true,
        hide_buffer_handbook = true,
        save_key = "git_root_bare",
    }
}
