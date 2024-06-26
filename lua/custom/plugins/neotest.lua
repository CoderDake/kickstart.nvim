return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'sidlatau/neotest-dart',
  },
  config = function()
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'neotest-dart' {
          command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {},
        },
      },
    }
    vim.keymap.set('n', '<leader>tr', function()
      neotest.run.run()
    end, { desc = '[T]est [R]un' })
    vim.keymap.set('n', '<leader>tR', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = '[T]est [R]un All' })
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
    vim.keymap.set('n', '[t', function()
      neotest.jump.prev { status = 'failed' }
    end, { desc = 'Next Failed Test' })
    vim.keymap.set('n', ']t', function()
      neotest.jump.prev { status = 'failed' }
    end, { desc = 'Prev Failed Test' })
  end,
}
