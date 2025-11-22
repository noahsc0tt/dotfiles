return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        opts = {
            debug = false,

            -- Custom format string to open the output link provided with %s
            -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
            open_cmd = 'open -a Min.app %s',

            -- Custom port to open the preview server. Default is random.
            -- Example: port = 8000
            port = 0,

            -- Setting this to 'always' will invert black and white in the preview
            -- Setting this to 'auto' will invert depending if the browser has enable
            -- dark mode
            -- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
            -- your choice of color inversion to images and everything else
            -- separately.
            invert_colors = 'always',

            -- Whether the preview will follow the cursor in the source file
            follow_cursor = true,

            -- Provide the path to binaries for dependencies.
            -- Setting this will skip the download of the binary by the plugin.
            -- Warning: Be aware that your version might be older than the one
            -- required.
            dependencies_bin = {
                ['tinymist'] = nil,
                ['websocat'] = nil
            },

            -- A list of extra arguments (or nil) to be passed to previewer.
            -- For example, extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
            extra_args = nil,

            -- This function will be called to determine the root of the typst project
            get_root = function(path_of_main_file)
                local root = os.getenv 'TYPST_ROOT'
                if root then
                    return root
                end
                return vim.fn.fnamemodify(path_of_main_file, ':p:h')
            end,

            -- This function will be called to determine the main file of the typst
            -- project.
            get_main_file = function(path_of_buffer)
                return path_of_buffer
            end,
        }
    },
    {
        "HakonHarnes/img-clip.nvim",
        lazy = true,
        event = "VeryLazy",
        opts = {
            default = {
                -- file and directory options
                dir_path = "assets", ---@type string | fun(): string
                extension = "png", ---@type string | fun(): string
                file_name = "%Y-%m-%d-%H-%M-%S", ---@type string | fun(): string
                use_absolute_path = false, ---@type boolean | fun(): boolean
                relative_to_current_file = false, ---@type boolean | fun(): boolean

                -- logging options
                verbose = true, ---@type boolean | fun(): boolean

                -- template options
                template = "$FILE_PATH", ---@type string | fun(context: table): string
                url_encode_path = false, ---@type boolean | fun(): boolean
                relative_template_path = true, ---@type boolean | fun(): boolean
                use_cursor_in_template = true, ---@type boolean | fun(): boolean
                insert_mode_after_paste = true, ---@type boolean | fun(): boolean
                insert_template_after_cursor = true, ---@type boolean | fun(): boolean

                -- prompt options
                prompt_for_file_name = true, ---@type boolean | fun(): boolean
                show_dir_path_in_prompt = false, ---@type boolean | fun(): boolean

                -- base64 options
                max_base64_size = 10, ---@type number | fun(): number
                embed_image_as_base64 = false, ---@type boolean | fun(): boolean

                -- image options
                process_cmd = "", ---@type string | fun(): string
                copy_images = false, ---@type boolean | fun(): boolean
                download_images = true, ---@type boolean | fun(): boolean
                formats = { "jpeg", "jpg", "png" }, ---@type string[]

                -- drag and drop options
                drag_and_drop = {
                    enabled = true, ---@type boolean | fun(): boolean
                    insert_mode = false, ---@type boolean | fun(): boolean
                },
            },

            -- filetype specific options
            filetypes = {
                markdown = {
                    url_encode_path = true, ---@type boolean | fun(): boolean
                    template = "![$CURSOR]($FILE_PATH)", ---@type string | fun(context: table): string
                    download_images = false, ---@type boolean | fun(): boolean
                },

                vimwiki = {
                    url_encode_path = true, ---@type boolean | fun(): boolean
                    template = "![$CURSOR]($FILE_PATH)", ---@type string | fun(context: table): string
                    download_images = false, ---@type boolean | fun(): boolean
                },

                html = {
                    template = '<img src="$FILE_PATH" alt="$CURSOR">', ---@type string | fun(context: table): string
                },

                tex = {
                    relative_template_path = false, ---@type boolean | fun(): boolean
                    template = [[
                    \begin{figure}[h]
                    \centering
                    \includegraphics[width=0.8\textwidth]{$FILE_PATH}
                    \caption{$CURSOR}
                    \label{fig:$LABEL}
                    \end{figure}
                    ]], ---@type string | fun(context: table): string

                    formats = { "jpeg", "jpg", "png", "pdf" }, ---@type table
                },

                typst = {
                    template = [[
                    #figure(
                        image("$FILE_PATH", width: 80%),
                        caption: [$CURSOR],
                    ) <fig-$LABEL>
                    ]], ---@type string | fun(context: table): string
                },

                rst = {
                    template = [[
                    .. image:: $FILE_PATH
                    :alt: $CURSOR
                    :width: 80%
                    ]], ---@type string | fun(context: table): string
                },

                asciidoc = {
                    template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]', ---@type string | fun(context: table): string
                },

                org = {
                    template = [=[
                    #+BEGIN_FIGURE
                    [[file:$FILE_PATH]]
                    #+CAPTION: $CURSOR
                    #+NAME: fig:$LABEL
                    #+END_FIGURE
                    ]=], ---@type string | fun(context: table): string
                },
            },

            -- file, directory, and custom triggered options
            files = {}, ---@type table | fun(): table
            dirs = {}, ---@type table | fun(): table
            custom = {}, ---@type table | fun(): table

        },
        keys = {
            { "<M-p>", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
            {
                "<leader>aP",
                function()
                    require('snacks').picker.files {
                        ft = { "jpg", "jpeg", "png", "webp" },
                        confirm = function(self, item, _)
                            self:close()
                            require("img-clip").paste_image({}, "./" .. item.file) -- ./ is necessary for img-clip to recognize it as path
                        end,
                    }
                end,
                desc = "Paste image from clipboard"
            },
        },
    },
    {
        "pxwg/math-conceal.nvim",
        event = "VeryLazy",
        build = "make lua51",
        main = "math-conceal",
        --- @type LaTeXConcealOptions
        opts = {
            enabled = true,
            conceal = {
                "greek",
                "script",
                "math",
                "font",
                "delim",
                "phy",
            },
            ft = { "*.tex", "*.md", "*.typ" },
        },
    }
}
