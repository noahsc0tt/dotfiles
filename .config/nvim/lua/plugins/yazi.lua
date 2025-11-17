return {
    {
        "mikavilpas/yazi.nvim",
        version = "*", -- use the latest stable version
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<C-.>",
                mode = { "n", "v", "i" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi",
            },
            {
                -- Open in the current working directory
                "<C-,>",
                "<cmd>Yazi cwd<cr>",
                desc = "Open yazi at cwd",
            },
            {
                "<C-S-.>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume yazi",
            },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = true,
            keymaps = {
                open_file_in_vertical_split = "<c-v>",
                open_file_in_horizontal_split = "<c-x>",
                open_file_in_tab = "<c-t>",
                grep_in_directory = "<c-s>",
                replace_in_directory = "<c-g>",
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
    }
}
