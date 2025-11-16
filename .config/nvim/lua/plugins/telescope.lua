return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
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
                file_sorter = function() require("telescope.sorters").get_fzf_sorter() end,
                previewer = true,
                initial_mode = "insert",
                path_display = { truncate = 1, shorten = 1, "smart" },
                follow = true,
            },
            extensions = {
                -- file_browser = {
                --     layout_strategy = "flex",
                --     layout_config = {
                --         width = { padding = 0 },
                --         height = { padding = 0 },
                --         prompt_position = "top",
                --         preview_cutoff = 1,
                --         flip_columns = 120,
                --     },
                --     theme = "ivy",
                --     hijack_netrw = true,
                --     display_stat = false,
                --     prompt_path = false,
                --     select_buffer = true,
                --     hide_parent_dir = true,
                --     hidden = false,
                --     follow_symlinks = true,
                --     grouped = true,
                --     git_status = true,
                --     initial_mode = "normal",
                --     icons = {
                --         ["directory"] = "",
                --         ["file"] = "",
                --         ["executable"] = "",
                --     },
                --     mappings = {
                --         ["n"] = {
                --             ["n"] = function() require("telescope.extensions.file_browser.actions").create() end,
                --             ["l"] = function(prompt_bufnr)
                --                 local entry = require("telescope.actions.state").get_selected_entry()
                --                 local path = entry.path or entry.value
                --
                --                 if vim.fn.isdirectory(path) == 1 then
                --                     require("telescope.actions").select_default(prompt_bufnr)
                --                 end
                --             end,
                --             ["a"] = function() require("telescope.extensions.file_browser.actions").toggle_all() end,
                --             ["A"] = function(prompt_bufnr)
                --                 open_file_browser(require("telescope.actions.state").get_current_picker(prompt_bufnr).finder.path,
                --                     showing_stat, flat)
                --             end,
                --             ["K"] = function()
                --                 require("telescope.actions").toggle_selection()
                --                 require("telescope.actions").move_selection_better()
                --             end,
                --             ["J"] = function()
                --                 require("telescope.actions").toggle_selection()
                --                 require("telescope.actions").move_selection_worse()
                --             end,
                --             ["z"] = function() require("telescope.extensions.file_browser.actions").goto_home_dir() end,
                --             ["w"] = function() require("telescope.extensions.file_browser.actions").goto_cwd() end,
                --             ["h"] = function() require("telescope.extensions.file_browser.actions").goto_parent_dir() end,
                --             ["."] = function() require("telescope.extensions.file_browser.actions").toggle_hidden() end,
                --             ["Y"] = copy_file_path,
                --             ["c"] = function(prompt_bufnr)
                --                 local entry = require("telescope.actions.state").get_selected_entry()
                --                 local dir = entry.path
                --                 local uv = vim.loop.fs_stat(dir)
                --                 if not (uv and uv.type == "directory") then
                --                     dir = vim.fn.fnamemodify(dir, ":h")
                --                 end
                --                 local dir_esc = vim.fn.fnameescape(dir)
                --                 os.execute("cd " .. dir_esc)
                --             end,
                --             ["o"] = function(prompt_bufnr)
                --                 local quiet = require("telescope.actions.state").get_current_picker(prompt_bufnr).finder.quiet
                --                 local selections = require("telescope._extensions.file_browser.utils").get_selected_files(prompt_bufnr, true)
                --                 if vim.tbl_isempty(selections) then
                --                     require("telescope._extensions.file_browser.utils").notify("actions.open",
                --                         { msg = "No selection to be opened!", level = "INFO", quiet = quiet })
                --                     return
                --                 end
                --
                --                 local cmd = "open"
                --                 for _, selection in ipairs(selections) do
                --                     require("plenary.job")
                --                         :new({
                --                             command = cmd,
                --                             args = { selection:absolute() },
                --                         })
                --                         :start()
                --                 end
                --             end,
                --             ["s"] = function(prompt_bufnr)
                --                 local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                --                 require("telescope.actions").close(prompt_bufnr)
                --                 local show_stat = not showing_stat
                --                 showing_stat = not showing_stat
                --                 open_file_browser(picker.finder.path, show_stat, flat)
                --             end,
                --             ["F"] = function(prompt_bufnr)
                --                 local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                --                 require("telescope.actions").close(prompt_bufnr)
                --                 local flatten = not flat
                --                 flat = not flat
                --                 open_file_browser(picker.finder.path, showing_stat, flatten)
                --             end,
                --             ["t"] = function()
                --                 local entry = require("telescope.actions.state").get_selected_entry()
                --
                --                 local dir = entry.path
                --                 local uv = vim.loop.fs_stat(dir)
                --                 if not (uv and uv.type == "directory") then
                --                     dir = vim.fn.fnamemodify(dir, ":h")
                --                 end
                --                 local dir_esc = vim.fn.fnameescape(dir)
                --                 if vim.env.ZELLIJ then
                --                     os.execute("zellij run -c --cwd " .. dir_esc .. " -- $SHELL")
                --                 else
                --                 end
                --                 vim.cmd("qa!")
                --             end,
                --         }
                --     }
                -- },
            }
        },
        config = function()
            -- local showing_stat = false
            -- local flat = false
            --
            -- local function copy_file_path()
            --     local entry = require("telescope.actions.state").get_selected_entry()
            --     if entry and entry.path then
            --         vim.fn.setreg("+", entry.path) -- copy absolute path to clipboard
            --         print("Copied: " .. entry.path)
            --     end
            -- end
            -- require('telescope').load_extension "file_browser"
            require('telescope').load_extension "notify"


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
            -- _G.open_file_browser = function(path, show_stat, flatten)
            --     path = path or vim.fn.expand("%:p:h")
            --     local stat
            --     if show_stat then
            --         stat = { date = true, size = true, }
            --     else
            --         stat = false
            --     end
            --
            --     local depth
            --     if flatten then
            --         depth = false
            --     else
            --         depth = 1
            --     end
            --
            --     local opts = {
            --         path = path,
            --         cwd_to_path = true,
            --         display_stat = stat,
            --         depth = depth,
            --         attach_mappings = function(prompt_bufnr, map)
            --             map('n', 'c', function()
            --                 require("telescope.extensions.file_browser.actions").goto_cwd(prompt_bufnr)
            --             end, { nowait = true })
            --             map('n', 'd', function()
            --                 require("telescope.extensions.file_browser.actions").remove(prompt_bufnr)
            --             end, { nowait = true })
            --             map('n', 'y', function()
            --                 require("telescope.extensions.file_browser.actions").copy(prompt_bufnr)
            --             end, { nowait = true })
            --             return true
            --         end,
            --     }
            --
            --     --    if vim.o.columns < 120 then
            --     --        opts.layout_strategy = "vertical"
            --     --    else
            --     --        opts.layout_strategy = "horizontal"
            --     --    end
            --     --
            --
            --     require('telescope').extensions.file_browser.file_browser(opts)
            -- end
        end,

        keys = {
            -- { "<C-.>", function() open_file_browser() end, mode = { "n", "v", "i" } },

            -- Files only
            { "<leader>f",  function() require("telescope.builtin").find_files() end,                         mode = { "n", "v" } },

            -- Directories only
            {
                "<leader>ad",
                function()
                    require("telescope.builtin").find_files({
                        find_command = { "fd", "--type", "d", "--hidden", "--no-ignore", "--absolute-path" },
                    })
                end,
                mode = { "n", "v" }
            },

            -- Grep
            { "<leader>as", function() require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() }) end, mode = { "n", "v" } },


            {
                "<leader>af",
                function()
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
                end,
                mode = { "n", "v" }
            },


            { "<leader>/",  function() require("telescope.builtin").current_buffer_fuzzy_find() end, mode = { "n", "v" } },


            { "<leader>aw", function() require("telescope.builtin").grep_string() end,               mode = "n" },


            {
                "<leader>aw",
                function()
                    vim.cmd('normal! "vy')
                    local text = vim.fn.getreg("v")
                    require("telescope.builtin").grep_string({ search = text, initial_mode = "normal", })
                end,
                mode = "v"
            },


            { "<leader>ag",        function() require("telescope.builtin").git_files() end,        mode = { "n", "v" } },


            { "<leader>ao",        function() require("telescope.builtin").oldfiles() end,         mode = { "n", "v" } },


            { "<leader>ar",        function() require("telescope.builtin").lsp_references() end,   mode = { "n", "v" } },


            { "<leader>ae",        function() require("telescope.builtin").diagnostics() end,      mode = { "n", "v" } },


            { "<leader>an",        function() require('telescope').extensions.notify.notify() end, mode = { "n", "v" } },


            { "<leader>c",         function() require("telescope.builtin").command_history() end,  mode = { "n", "v" } },


            { "<leader>aj",        function() require("telescope.builtin").jumplist() end,         mode = { "n", "v" } },


            { "<leader>ah",        function() require("telescope.builtin").search_history() end,   mode = { "n", "v" } },


            { "<leader>`",         function() require("telescope.builtin").marks() end,            mode = { "n", "v" } },


            { "<leader>ap",        function() require("telescope.builtin").registers() end,        mode = { "n", "v" } },


            { "<leader>:",         function() require("telescope.builtin").commands() end,         mode = { "n", "v" } },


            { "<leader>A",         function() require("telescope.builtin").builtin() end,          mode = { "n", "v" } },


            { "<leader>at",        function() require("telescope.builtin").filetypes() end,        mode = { "n", "v" } },


            { "<C-=>",             function() require("telescope.builtin").spell_suggest() end,    mode = { "n", "v", "i" } },


            { "<leader>a<leader>", function() require("telescope.builtin").resume() end,           mode = { "n", "v" } },

        }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        cond = not vim.g.started_by_firenvim,

    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        cond = not vim.g.started_by_firenvim,
        enabled = false,
    },
}
