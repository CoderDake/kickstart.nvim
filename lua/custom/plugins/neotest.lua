return {
  'nvim-ntotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'sidlatau/neotest-dart',
    'olimorris/neotest-rspec',
  },
  config = function()
    local neotest = require 'neotest'
    ---@diagnostic disable-next-line: missing-fields
    neotest.setup({
      adapters = {
        require('neotest-rspec'),
        require 'neotest-dart' {
          command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {},
        },
      },
      floating = {
        border = 'rounded',
        max_height = 0.95,
        max_width = 0.95,
        options = {},
      }
    })
    vim.keymap.set('n', '<leader>tr', function()
      neotest.run.run()
    end, { desc = '[T]est [R]un' })
    vim.keymap.set('n', '<leader>ta', function()
      neotest.run.attach()
    end, { desc = '[T]est Run [A]ttach' })
    vim.keymap.set('n', '<leader>tR', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = '[T]est [R]un All' })
    vim.keymap.set('n', '<leader>tp', function()
      neotest.output_panel.toggle()
    end, { desc = 'Toggle [T]est [P]anel' })
    vim.keymap.set('n', '<leader>ts', function()
      neotest.run.stop()
    end, { desc = '[T]est [S]top' })
    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open()
    end, { desc = '[T]est [O]utput open' })
    vim.keymap.set('n', '<leader>tO', function()
      neotest.output.open { enter = true }
    end, { desc = '[T]est [O]utput open enter' })
    vim.keymap.set('n', '<leader>tt', function()
      neotest.summary.toggle { follow = true }
    end, { desc = '[T]est Summary [T]oggle' })
    vim.keymap.set('n', ']t', function()
      neotest.jump.next { status = 'failed' }
    end, { desc = 'Next Failed Test' })
    vim.keymap.set('n', '[t', function()
      neotest.jump.prev { status = 'failed' }
    end, { desc = 'Prev Failed Test' })
    vim.keymap.set('n', '<leader>tA', function()
      neotest.run.run(vim.fn.getcwd())
    end, { desc = '[T]est [A]ll in cwd' })
  end,
}
