require("screenkey").setup({
    win_opts = {
        row = vim.o.lines - vim.o.cmdheight - 1,
        col = vim.o.columns - 1,
        relative = "editor",
        anchor = "SE",
        width = 25,
        height = 1,
        border = "none",
        title = "",
        title_pos = "center",
        style = "minimal",
        focusable = false,
        noautocmd = true,
    },
    hl_groups = {
        ["screenkey.hl.key"] = { link = "Normal" },
        ["screenkey.hl.map"] = { link = "Normal" },
        ["screenkey.hl.sep"] = { link = "Normal" },
    },
    compress_after = 5,
    clear_after = 2,
    emit_events = false,
    disable = {
        filetypes = {},
        buftypes = {},
        modes = { "i", "c" },
    },
    show_leader = false,
    group_mappings = true,
    display_infront = {},
    display_behind = {},
    -- filter = function(keys)
    --     local ignore = { "h", "j", "k", "l" }
    --     return vim.iter(keys)
    --         :filter(function(k)
    --             return not vim.tbl_contains(ignore, k.key)
    --         end)
    --         :totable()
    -- end,
    colorize = function(keys)
        return keys
    end,
    separator = " ",
    keys = {
        ["<TAB>"] = "󰌒",
        ["<CR>"] = "󰌑",
        ["<ESC>"] = "Esc",
        ["<SPACE>"] = "␣",
        ["<Space>"] = "␣",
        ["<BS>"] = "󰌥",
        ["<DEL>"] = "Del",
        ["<LEFT>"] = "",
        ["<RIGHT>"] = "",
        ["<UP>"] = "",
        ["<DOWN>"] = "",
        ["<HOME>"] = "Home",
        ["<END>"] = "End",
        ["<PAGEUP>"] = "PgUp",
        ["<PAGEDOWN>"] = "PgDn",
        ["<INSERT>"] = "Ins",
        ["<F1>"] = "󱊫",
        ["<F2>"] = "󱊬",
        ["<F3>"] = "󱊭",
        ["<F4>"] = "󱊮",
        ["<F5>"] = "󱊯",
        ["<F6>"] = "󱊰",
        ["<F7>"] = "󱊱",
        ["<F8>"] = "󱊲",
        ["<F9>"] = "󱊳",
        ["<F10>"] = "󱊴",
        ["<F11>"] = "󱊵",
        ["<F12>"] = "󱊶",
        ["CTRL"] = "Ctrl",
        ["ALT"] = "Alt",
        ["SUPER"] = "󰘳",
        ["<leader>"] = "␣",
    },
    notify_method = "echo",
    log = {
        min_level = vim.log.levels.OFF,
        filepath = vim.fn.stdpath("data") .. "/screenkey_log",
    },
})
