local telescope = require("telescope")
local actions = require("telescope.actions")
local state = require("telescope.actions.state")
local builtin = require("telescope.builtin")
local fb = telescope.extensions.file_browser
local fb_actions = fb.actions
local fb_utils = require("telescope._extensions.file_browser.utils")

local showing_stat = false
local flat = false

local function copy_file_path()
    local entry = state.get_selected_entry()
    if entry and entry.path then
        vim.fn.setreg("+", entry.path) -- copy absolute path to clipboard
        print("Copied: " .. entry.path)
    end
end

telescope.setup {
    defaults = {
        color_devicons = true,
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
            prompt_position = "top",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_cutoff = 1,
            flex = { flip_columns = 120, }
        },
        file_sorter = require("telescope.sorters").get_fzf_sorter,
        previewer = true,
        initial_mode = "insert",
        path_display = { truncate = 1, shorten = 1, "smart" },
        follow = true,
    },
    extensions = {
        file_browser = {
            layout_strategy = "flex",
            layout_config = {
                width = { padding = 0 },
                height = { padding = 0 },
                prompt_position = "top",
                preview_cutoff = 1,
                flip_columns = 120,
            },
            theme = "ivy",
            hijack_netrw = true,
            display_stat = false,
            prompt_path = false,
            select_buffer = true,
            hide_parent_dir = true,
            hidden = false,
            follow_symlinks = true,
            grouped = true,
            git_status = true,
            initial_mode = "normal",
            icons = {
                ["directory"] = "",
                ["file"] = "",
                ["executable"] = "",
            },
            mappings = {
                ["n"] = {
                    ["n"] = fb_actions.create,
                    ["l"] = function(prompt_bufnr)
                        local entry = state.get_selected_entry()
                        local path = entry.path or entry.value

                        if vim.fn.isdirectory(path) == 1 then
                            actions.select_default(prompt_bufnr)
                        end
                    end,
                    ["a"] = fb_actions.toggle_all,
                    ["A"] = function(prompt_bufnr)
                        open_file_browser(state.get_current_picker(prompt_bufnr).finder.path,
                            showing_stat, flat)
                    end,
                    ["K"] = actions.toggle_selection + actions.move_selection_better,
                    ["J"] = actions.toggle_selection + actions.move_selection_worse,
                    ["z"] = fb_actions.goto_home_dir,
                    ["w"] = fb_actions.goto_cwd,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["."] = fb_actions.toggle_hidden,
                    ["Y"] = copy_file_path,
                    ["c"] = function(prompt_bufnr)
                        local entry = state.get_selected_entry()
                        local dir = entry.path
                        local uv = vim.loop.fs_stat(dir)
                        if not (uv and uv.type == "directory") then
                            dir = vim.fn.fnamemodify(dir, ":h")
                        end
                        local dir_esc = vim.fn.fnameescape(dir)
                        os.execute("cd " .. dir_esc)
                    end,
                    ["o"] = function(prompt_bufnr)
                        local quiet = state.get_current_picker(prompt_bufnr).finder.quiet
                        local selections = fb_utils.get_selected_files(prompt_bufnr, true)
                        if vim.tbl_isempty(selections) then
                            fb_utils.notify("actions.open",
                                { msg = "No selection to be opened!", level = "INFO", quiet = quiet })
                            return
                        end

                        local cmd = "open"
                        for _, selection in ipairs(selections) do
                            require("plenary.job")
                                :new({
                                    command = cmd,
                                    args = { selection:absolute() },
                                })
                                :start()
                        end
                    end,
                    ["s"] = function(prompt_bufnr)
                        local picker = state.get_current_picker(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        local show_stat = not showing_stat
                        showing_stat = not showing_stat
                        open_file_browser(picker.finder.path, show_stat, flat)
                    end,
                    ["F"] = function(prompt_bufnr)
                        local picker = state.get_current_picker(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        local flatten = not flat
                        flat = not flat
                        open_file_browser(picker.finder.path, showing_stat, flatten)
                    end,
                    ["t"] = function()
                        local entry = state.get_selected_entry()

                        local dir = entry.path
                        local uv = vim.loop.fs_stat(dir)
                        if not (uv and uv.type == "directory") then
                            dir = vim.fn.fnamemodify(dir, ":h")
                        end
                        local dir_esc = vim.fn.fnameescape(dir)
                        if vim.env.ZELLIJ then
                            os.execute("zellij run -c --cwd " .. dir_esc .. " -- $SHELL")
                        else
                        end
                        vim.cmd("qa!")
                    end,
                }
            }
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                layout_strategy = "flex",
            }
        }
    }
}
telescope.load_extension "file_browser"
vim.schedule(function()
    telescope.load_extension("ui-select")
end)
telescope.load_extension "notify"


-- keeps track of current `tabline` and `statusline`, so we can restore it after closing telescope
local temp_showtabline
local temp_laststatus

function _G.global_telescope_find_pre()
    temp_showtabline = vim.o.showtabline
    temp_laststatus = vim.o.laststatus
    vim.o.showtabline = 0
    vim.o.laststatus = 0
end

function _G.global_telescope_leave_prompt()
    vim.o.laststatus = temp_laststatus
    vim.o.showtabline = temp_showtabline
end

vim.cmd([[
  augroup MyAutocmds
    autocmd!
    autocmd User TelescopeFindPre lua global_telescope_find_pre()
    autocmd FileType TelescopePrompt autocmd BufLeave <buffer> lua global_telescope_leave_prompt()
  augroup END
]])

-- File browser
_G.open_file_browser = function(path, show_stat, flatten)
    path = path or vim.fn.expand("%:p:h")
    local stat
    if show_stat then
        stat = { date = true, size = true, }
    else
        stat = false
    end

    local depth
    if flatten then
        depth = false
    else
        depth = 1
    end

    local opts = {
        path = path,
        cwd_to_path = true,
        display_stat = stat,
        depth = depth,
        attach_mappings = function(prompt_bufnr, map)
            map('n', 'c', function()
                fb_actions.goto_cwd(prompt_bufnr)
            end, { nowait = true })
            map('n', 'd', function()
                fb_actions.remove(prompt_bufnr)
            end, { nowait = true })
            map('n', 'y', function()
                fb_actions.copy(prompt_bufnr)
            end, { nowait = true })
            return true
        end,
    }

    --    if vim.o.columns < 120 then
    --        opts.layout_strategy = "vertical"
    --    else
    --        opts.layout_strategy = "horizontal"
    --    end
    --
    fb.file_browser(opts)
end
vim.keymap.set({ "n", "v" }, "<leader>.", open_file_browser)



-- Mappings

-- Files only
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    builtin.find_files()
end)

-- Directories only
vim.keymap.set({ "n", "v" }, "<leader>ad", function()
    builtin.find_files({
        find_command = { "fd", "--type", "d", "--hidden", "--no-ignore", "--absolute-path" },
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local dir = state.get_selected_entry().path
                open_file_browser(dir)
            end)
            return true
        end,
    })
end)

-- Grep
vim.keymap.set({ "n", "v" }, "<leader>as", function()
    builtin.live_grep({ cwd = vim.fn.getcwd() })
end)


vim.keymap.set({ "n", "v" }, "<leader>af", function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    local current = vim.api.nvim_get_current_buf()
    local index = 1
    for i, buf in ipairs(bufs) do
        if buf.bufnr == current then
            index = i
            break
        end
    end

    require("telescope.builtin").buffers({
        initial_mode = "insert",
        default_selection_index = index,
        attach_mappings = function(prompt_bufnr, map)
            map("n", "d", function()
                require("telescope.actions").delete_buffer(prompt_bufnr)
            end, { nowait = true })
            map("i", "<C-d>", function()
                require("telescope.actions").delete_buffer(prompt_bufnr)
            end, { nowait = true })
            return true
        end,
    })
end)


vim.keymap.set({ "n", "v" }, "<leader>/", function() builtin.current_buffer_fuzzy_find() end)


vim.keymap.set("n", "<leader>aw", function() builtin.grep_string() end)


vim.keymap.set("v", "<leader>aw", function()
    vim.cmd('normal! "vy')
    local text = vim.fn.getreg("v")
    builtin.grep_string({ search = text, initial_mode = "normal", })
end, { noremap = true, silent = true })


vim.keymap.set({ "n", "v" }, "<leader>ag", function() builtin.git_files() end)


vim.keymap.set({ "n", "v" }, "<leader>ao", function() builtin.oldfiles() end)


vim.keymap.set({ "n", "v" }, "<leader>ar", function() builtin.lsp_references() end)


vim.keymap.set({ "n", "v" }, "<leader>ae", function() builtin.diagnostics() end)


vim.keymap.set({ "n", "v" }, "<leader>an", function() telescope.extensions.notify.notify() end)


vim.keymap.set({ "n", "v" }, "<leader>c", function() builtin.command_history() end)


vim.keymap.set({ "n", "v" }, "<leader>aj", function() builtin.jumplist() end)


vim.keymap.set({ "n", "v" }, "<leader>ah", function() builtin.search_history() end)


vim.keymap.set({ "n", "v" }, "<leader>`", function() builtin.marks() end)


vim.keymap.set({ "n", "v" }, "<leader>ap", function() builtin.registers() end)


vim.keymap.set({ "n", "v" }, "<leader>:", function() builtin.commands() end)


vim.keymap.set({ "n", "v" }, "<leader>A", function() builtin.builtin() end)


vim.keymap.set({ "n", "v" }, "<leader>at", function() builtin.filetypes() end)


vim.keymap.set({ "n", "v", "i" }, "<C-=>", function() builtin.spell_suggest() end)


vim.keymap.set({ "n", "v" }, "<leader>a<leader>", function() builtin.resume() end)


-- lsp_definitions, git
