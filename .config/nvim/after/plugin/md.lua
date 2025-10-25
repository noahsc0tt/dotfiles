require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
    latex = {
        enabled = true,
        -- Additional modes to render latex.
        render_modes = true,
        -- Executable used to convert latex formula to rendered unicode.
        converter = 'latex2text',
        -- Highlight for latex blocks.
        highlight = 'RenderMarkdownMath',
        -- Determines where latex formula is rendered relative to block.
        -- | above | above latex block |
        -- | below | below latex block |
        position = 'above',
        -- Number of empty lines above latex blocks.
        top_pad = 0,
        -- Number of empty lines below latex blocks.
        bottom_pad = 0,
        -- Always use virtual lines for rendering instead of attempting to inline.
        virtual = false,
    },
})


vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_open_ip = ''
vim.g.mkdp_browser = '/Applications/Min.app'
vim.g.mkdp_echo_preview_url = 0
vim.g.mkdp_browserfunc = ''
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''
vim.g.mkdp_port = '54321'
vim.g.mkdp_page_title = '${name}'
vim.g.mkdp_images_path = ''
vim.g.mkdp_filetypes = { 'markdown' }
vim.g.mkdp_theme = 'dark'
vim.g.mkdp_combine_preview = 0
vim.g.mkdp_combine_preview_auto_refresh = 1
