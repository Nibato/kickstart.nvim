return {
  'stevearc/overseer.nvim',

  config = function()
    require('overseer').setup()

    vim.keymap.set('n', '<leader>wr', '<cmd>OverseerRun<CR>', { desc = '[R]un task' })
    vim.keymap.set('n', '<leader>wt', '<cmd>OverseerToggle<CR>', { desc = '[T]ask list' })
  end,
}
