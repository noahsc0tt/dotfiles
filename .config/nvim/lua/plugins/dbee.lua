return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        -- Install tries to automatically detect the install method.
        -- if it fails, try calling it with one of these parameters:
        --    "curl", "wget", "bitsadmin", "go"
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup({
            editor = {
                mappings = {
                    { key = "R",    mode = "v", action = "run_selection" },
                    { key = "R",    mode = "n", action = "run_file" },
                    { key = "<CR>", mode = "n", action = "run_under_cursor" },
                }
            }
        })
    end,
    keys = {
        { "<leader>b", function() require("dbee").open() end, desc = "Open database" }
    }
}
