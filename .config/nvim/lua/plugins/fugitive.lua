return {
    {
        "tpope/vim-fugitive",
        enabled = false,
        cond = not vim.g.started_by_firenvim,
        config = function()
            vim.g.fugitive_mergediff = 1

            vim.api.nvim_create_user_command("Ga", "Git add <args>", { nargs = "+", complete = "file" });
            vim.api.nvim_create_user_command("Gaa", "Git add -A", {});
            vim.api.nvim_create_user_command("Gc", "Git commit", {});
            vim.api.nvim_create_user_command("Gcm", "Git commit -m <args>", { nargs = 1 });
            vim.api.nvim_create_user_command("Gam", "Git commit --amend -m <args>", { nargs = 1 });
            vim.api.nvim_create_user_command("Gl", "Git log --oneline --graph --decorate <args>",
                { nargs = "*", complete = "file" });
            vim.api.nvim_create_user_command("Gs", "Git status", {});
            vim.api.nvim_create_user_command("Gd", "Git diff <args>", { nargs = "*", complete = "file" });
            vim.api.nvim_create_user_command("Gp", "Git push", {});
            vim.api.nvim_create_user_command("Gps", "Git push", {});
            vim.api.nvim_create_user_command("Gpf", "Git push --force-with-lease", {});
            vim.api.nvim_create_user_command("Gpl", "Git pull", {});
            vim.api.nvim_create_user_command("Grm", "Git rm --cached <args>", { nargs = "+", complete = "file" });
            vim.api.nvim_create_user_command("Grs", "Git reset <args>", { nargs = "*", complete = "file" });
            vim.api.nvim_create_user_command("Gus", "Git restore --staged <args>", { nargs = "*", complete = "file" });
            vim.api.nvim_create_user_command("Gsw", "Git switch", {});
            vim.api.nvim_create_user_command("Gb", "Git branch", {});

            -- vim.api.nvim_create_user_command("Gca", function()
            --   vim.cmd.Git("add -A")
            --   vim.cmd.Git("commit")
            -- end, {})
            --
            -- vim.api.nvim_create_user_command("Gcam", function(opts)
            --   vim.cmd.Git("add -A")
            --   vim.cmd.Git("commit -m " .. opts.args)
            -- end, { nargs = 1 })
            --
            --
            -- require('snacks').keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
            -- require('snacks').keymap.set("n", "<leader>gl", ":Gl<CR>", { desc = "Git log" })
            -- require('snacks').keymap.set("n", "<leader>go", ":Glo<CR>", { desc = "Git log oneline" })
            -- require('snacks').keymap.set("n", "<leader>gp", ":Gpsh<CR>", { desc = "Git push" })
            -- require('snacks').keymap.set("n", "<leader>ga", ":Ga ")
            -- require('snacks').keymap.set("n", "<leader>gm<leader>", ":Gcm \"")
            -- require('snacks').keymap.set("n", "<leader>gma", ":Gcam \"")
        end,
    },
}
