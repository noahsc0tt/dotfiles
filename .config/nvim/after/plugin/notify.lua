require("notify").setup({
    level = vim.log.levels.WARN,
    render = "wrapped-compact",
    stages = "fade",
    timeout = 500,
})
vim.notify = require("notify")
