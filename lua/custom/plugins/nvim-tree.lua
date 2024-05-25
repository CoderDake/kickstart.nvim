return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<Cr>', { desc = '[T]oggle File Tree' })
    require('nvim-tree').setup {}
  end,
}
