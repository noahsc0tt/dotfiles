return {
    {
        "mikavilpas/yazi.nvim",
        version = "*", -- use the latest stable version
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = true,
            keymaps = {
                open_file_in_vertical_split = "<c-l>",
                open_file_in_horizontal_split = "<c-d>",
                open_file_in_tab = "<c-s>",
                grep_in_directory = "s",
                replace_in_directory = "<c-r>",
                -- cycle_open_buffers = "<tab>",
                copy_relative_path_to_selected_files = "<c-y>",
                send_to_quickfix_list = "<c-q>",
                change_working_directory = "w",
                open_and_pick_window = "<c-o>",
            },

            floating_window_scaling_factor = 1,
            yazi_floating_window_border = "none",

            open_multiple_tabs = true,
        },
        keys = {
            {
                "<leader>j",
                "<cmd>Yazi<cr>",
                mode = { "n", "v", },
                desc = "Open yazi",
            },
            {
                "<leader>J",
                "<cmd>Yazi cwd<cr>",
                mode = { "n", "v", },
                desc = "Open yazi at cwd",
            },
            {
                "<C-.>",
                "<cmd>Yazi toggle<cr>",
                mode = { "n", "v", },
                desc = "Resume yazi",
            },
        },
    }
}
