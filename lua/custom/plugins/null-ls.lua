return {
  'jose-elias-alvarez/null-ls.nvim',
  ft = { 'python' },
  opts = function()
    local null_ls = require 'null-ls'
    return {
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.ruff,
    }
  end,
}
