local function getdir()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end


require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'diff', 'progress',  },
        lualine_y = { getdir, 'branch' },
        lualine_z = { 'filetype' },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = { 'diagnostics' },
        lualine_x = { 'diff', 'progress',  },
        lualine_y = {},
        lualine_z = { 'filetype' },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
