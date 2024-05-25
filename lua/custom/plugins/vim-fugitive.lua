return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>G', ':G<CR>', { desc = '[G]it' })
    vim.keymap.set('n', '<leader>gfum', ':G fetch upstream master<CR>', { desc = '[g]it [f]etch [u]pstream [m]aster' })
    vim.keymap.set('n', '<leader>gfuM', ':G fetch upstream main<CR>', { desc = '[g]it [f]etch [u]pstream [M]ain' })
  end,
}
