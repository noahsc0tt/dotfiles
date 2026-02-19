return {
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

            -- For logging that is to a file if you wish to trace through requests
            -- for reporting bugs, i would not rely on this, but instead the provided
            -- logging mechanisms within 99.  This is for more debugging purposes
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			_99.setup({
                model = "opencode/kimi-k2.5-free",
				logger = {
					level = _99.DEBUG,
					path = "/Users/nscott/.temp/" .. basename .. ".99.debug",
					print_on_error = true,
				},

                {
                    source = "blink",
                },
			})

			vim.keymap.set("v", "I", function()
				_99.visual()
			end)

			vim.keymap.set("v", "<leader>is", function()
				_99.stop_all_requests()
			end)
		end,
	},
}
