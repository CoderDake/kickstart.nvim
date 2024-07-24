return {
  'tpope/vim-rails',
  dependencies = { 'tpope/vim-dispatch' },
  config = function ()
  vim.keymap.set('n', '<leader>rr', '<cmd>R<CR>', { desc = '[R]ails [R]elated' })
  vim.keymap.set('n', '<leader>ra', '<cmd>A<CR>', { desc = '[R]ails [A]lternate' })

  vim.keymap.set('n', '<leader>rem', '<cmd>EModel<CR>', { desc = '[R]ails [E]dit [M]odel' })
  vim.keymap.set('n', '<leader>rev', '<cmd>EView<CR>', { desc = '[R]ails [E]dit [V]iew' })
  vim.keymap.set('n', '<leader>rec', '<cmd>EController<CR>', { desc = '[R]ails [E]dit [C]ontroller' })
  
  end
}
