return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        -- "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({})

        vim.keymap.set("n", "<leader>aw", function() harpoon:list():add() end, { desc = "add harpoon window" })
        
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "1st harpoon" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "2nd harpoon" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "3rd harpoon" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "4th harpoon" })


        -- Standard Harpoon UI
        vim.keymap.set("n", "<leader>aa", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon picker" })
        
        -- Toggle previous & next buffers stored within Harpoon list
        -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Prev Harpoon" })
        -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Next Harpoon" })

        -- Use Telescope for UI
    --     local conf = require("telescope.config").values
    --     local function toggle_telescope(harpoon_files)
    --         local file_paths = {}
    --         for _, item in ipairs(harpoon_files.items) do
    --             table.insert(file_paths, item.value)
    --         end

    --         require("telescope.pickers").new({}, {
    --             prompt_title = "Harpoon",
    --             finder = require("telescope.finders").new_table({
    --                 results = file_paths,
    --             }),
    --             previewer = conf.file_previewer({}),
    --             sorter = conf.generic_sorter({}),
    --         }):find()
    --     end

    --     vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    --     { desc = "Open harpoon window" })
    end,


}