return {
  'nvim-lua/plenary.nvim',
  config = function()
    local file = "/tmp/nvim_profile.log"
    vim.keymap.set('n', '<leader>pp', function()
      os.remove(file)
      ---@diagnostic disable-next-line: param-type-mismatch
      require('plenary.profile').start(file,  {flame = true})
    end, { desc = '[P]rofiling Start' })
    vim.keymap.set('n', '<leader>ps', function()
      require('plenary.profile').stop()
    end, { desc = 'Vim [P]rofiling [S]top' })

    vim.keymap.set('n', '<leader>pg', function()
      vim.cmd('e ' .. file)
    end, { desc = 'Vim [P]rofiling [Go] to file' })


  end
}
