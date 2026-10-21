return {
  "emeren/wt.nvim",
  config = function()
    require("worktrunk").setup()
  end,
  keys = {
      { "<leader>gn", function() require("worktrunk").create() end, desc = "New Worktree" },
      { "<leader>gw", function() require("worktrunk").list() end, desc = "Select Worktree" },
      { "<leader>gW", function() require("worktrunk").remove() end, desc = "Remove Worktree" },
  }
}
