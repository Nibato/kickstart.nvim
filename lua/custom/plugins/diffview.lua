return {
    "sindrets/diffview.nvim",
    config = function()
        local diffview = require('diffview')
        local diffviewlib = require('diffview.lib')
        -- local actions = require("diffview.actions")

        diffview.setup({
        })

        vim.keymap.set('n', '<leader>v', function()
            if next(diffviewlib.views) == nil then
              vim.cmd('DiffviewOpen')
            else
              vim.cmd('DiffviewClose')
            end
          end,
        { desc = "Diffview Toggle" })

    end
}