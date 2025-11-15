require("actions-preview").setup {
    backend = { "telescope", },
    telescope = {
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
            width = { padding = 0 },
            height = { padding = 0 },
        },
    },
}
require('snacks').keymap.set({ "v", "n" }, "<leader>ac", require("actions-preview").code_actions)
