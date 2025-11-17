return {
    {
        'kevinhwang91/nvim-hlslens',
        lazy = true,
        event = "VeryLazy",
        opts = {
            auto_enable = true,
            calm_down = false,
            nearest_only = false,
        },
        keys = {
            { 'n',  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], },
            { 'N',  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], },
            { '*',  [[*<Cmd>lua require('hlslens').start()<CR>]], },
            { '#',  [[#<Cmd>lua require('hlslens').start()<CR>]], },
            { 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], },
            { 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], },
        }
    }
}
