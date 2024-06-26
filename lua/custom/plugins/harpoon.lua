return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    vim.keymap.set('n', '<leader>ha', mark.add_file, {})
    vim.keymap.set('n', '<leader>he', ui.toggle_quick_menu, {})

    vim.keymap.set('n', '<leader>hx', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<leader>hc', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<leader>hv', function()
      ui.nav_file(3)
    end)
    vim.keymap.set('n', '<leader>hs', function()
      ui.nav_file(4)
    end)
    vim.keymap.set('n', '<leader>hd', function()
      ui.nav_file(5)
    end)
    vim.keymap.set('n', '<leader>hf', function()
      ui.nav_file(6)
    end)
  end,
}
