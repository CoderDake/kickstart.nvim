local M = {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { { 'nvim-treesitter/nvim-treesitter-context' } },
  build = function()
    local configs = require 'nvim-treesitter.configs'
    require('nvim-treesitter.install').update { with_sync = true }()

    ---@diagnostic disable-next-line: missing-fields
    configs.setup {
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'elixir',
        'heex',
        'javascript',
        'html',
        'markdown',
        'markdown_inline',
        'ruby',
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}

return { M }
