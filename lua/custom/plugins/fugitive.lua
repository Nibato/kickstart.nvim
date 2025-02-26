return {
    "tpope/vim-fugitive",
    config = function()
        -- Optional: Add any custom configurations or keybindings for fugitive here

        vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
        vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
        vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
        vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git pull" })
        vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

        local wk = require("which-key")
        wk.add({
          { "<leader>g", group = "[g]it fugitive" }
        })


      end,
}