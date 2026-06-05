return {
  {
    "folke/flash.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>v",
        function()
          require("flash").treesitter({
            actions = {
              ["+"] = "next",
              ["-"] = "prev",
            }
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Select with treesitter"
      },
      { "<C-f>", mode = { "n", "x", "i", "o" }, function() require("flash").jump() end,              desc = "Flash jump" },
      -- { "<C-v>", mode = { "n", "x", "i", "o" }, function() require("flash").treesitter_search() end, desc = "Flash treesitter search" },
      {
        "<C-a>",
        mode = { "n", "x", "i", "o" },
        function()
          require("flash").jump({
            forward = false,
            pattern = vim.fn.expand("<cWORD>"),
          })
        end,
        desc = "Flash current word"
      },
      { "r", mode = { "o", }, function() require("flash").remote() end, desc = "Flash operator mode" },
    },
  },
}
